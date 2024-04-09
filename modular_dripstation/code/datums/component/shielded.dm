/datum/component/shielded
	var/shield_icon 
	var/shield_icon_state 
	/// How long we have to avoid being hit to replenish charges. If set to 0, we never recharge lost charges
	var/shield_recharge
	/// Once we go unhit long enough to recharge, we replenish charges this often. The floor is effectively 1 second, AKA how often SSdcs processes
	var/charge_increment_delay = 1 SECONDS

	var/target_slot

	var/cached_mutable_appearance

	var/starting_charges = 0
	var/current_charges
	var/max_charges = 1
	var/recharge_rate = 1
	var/has_sparks = FALSE

	var/is_shielded = FALSE
	var/is_charged = TRUE

	/// The cooldown tracking when we were last hit
	COOLDOWN_DECLARE(recently_hit_cd)
	/// The cooldown tracking when we last replenished a charge
	COOLDOWN_DECLARE(charge_add_cd)

	var/mob/living/current_owner

/datum/component/shielded/Initialize(shielded_icon, shielded_icon_state, shielded_recharge, slot, charge_i_d = 1 SECONDS, max_charge = 1, starting_charges = 0, recharge_rating = 1, sparks_enable = FALSE)
	if(!shielded_icon)	
		CRASH("Invalid shield icon passed")
	if(!shielded_icon_state)
		CRASH("Invalid shield icon state passed")
	if(!isnum(shielded_recharge))
		CRASH("Invalid shield recharge passed, expected number, found [shielded_recharge]")
	if(!isnum(max_charge))
		CRASH("Invalid shield max shield passed, expected number, found [max_charge]")
	if(!isnum(recharge_rating))
		CRASH("Invalid shield recharge rating passed, expected number, found [recharge_rating]")

	shield_icon = shielded_icon 
	shield_icon_state = shielded_icon_state
	shield_recharge = shielded_recharge
	charge_increment_delay = charge_i_d
	target_slot = slot
	max_charges = max_charge
	if(isnull(starting_charges))
		current_charges = max_charges
	else
		current_charges = starting_charges
	recharge_rate = recharge_rating
	if(recharge_rate)
		START_PROCESSING(SSdcs, src)
	has_sparks = sparks_enable
	cached_mutable_appearance = mutable_appearance(shield_icon, shield_icon_state)

	RegisterSignal(parent,COMSIG_ITEM_HIT_REACT,PROC_REF(on_hit_react))
	RegisterSignal(parent,COMSIG_ITEM_EQUIPPED, PROC_REF(on_equipped))
	RegisterSignal(parent,COMSIG_ITEM_DROPPED, PROC_REF(on_dropped))

/datum/component/shielded/proc/apply_shield()
	if(is_shielded)
		return
	
	is_shielded = TRUE
	
	if(!current_owner)
		return

	if(is_charged)
		current_owner.add_overlay(cached_mutable_appearance)

/datum/component/shielded/proc/remove_shield()
	if(!is_shielded)
		return

	is_shielded = FALSE

	if(!current_owner)
		return
	
	if(is_charged)
		current_owner.cut_overlay(cached_mutable_appearance)
	
/datum/component/shielded/proc/drain_charge()
	if(!is_charged)
		return 
	current_charges--
	var/obj/item/item_parent = parent
	if(has_sparks)
		playsound(item_parent.loc, 'modular_dripstation/sound/shield_drained.ogg', 65, 1)
	if(current_charges <= 0)
		is_charged = FALSE
		if(!current_owner)
			return 
		current_owner.cut_overlay(cached_mutable_appearance)
		current_owner.visible_message(span_danger("[current_owner]'s shield overloads!"))

/datum/component/shielded/proc/recharge(change)
	if(!is_charged)
		current_owner.add_overlay(cached_mutable_appearance)
		is_charged = TRUE
	current_charges = clamp((current_charges + change), 0, max_charges)
	if(has_sparks)
		var/obj/item/item_parent = parent
		if(max_charges > 1 && current_charges == max_charges)
			playsound(item_parent.loc, 'modular_dripstation/sound/shield_charged.ogg', 35, 1)
		else
			playsound(item_parent.loc, 'modular_dripstation/sound/shield_charge.ogg', 50, 1)

/datum/component/shielded/process(seconds_per_tick)
	if(current_charges >= max_charges)
		STOP_PROCESSING(SSdcs, src)
		return

	if(!COOLDOWN_FINISHED(src, recently_hit_cd))
		return
	if(!COOLDOWN_FINISHED(src, charge_add_cd))
		return

	COOLDOWN_START(src, charge_add_cd, charge_increment_delay)
	recharge(recharge_rate) // set the number of charges to current + recovery per increment, clamped from zero to max_charges

/datum/component/shielded/proc/on_hit_react(datum/source, mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	SIGNAL_HANDLER

	COOLDOWN_START(src, recently_hit_cd, shield_recharge)
	
	if(!is_shielded || !is_charged)
		return
	if(has_sparks)
		if(current_owner)
			do_sparks(2, TRUE, current_owner)
			current_owner.visible_message(span_danger("[current_owner]'s shields deflect [attack_text] in a shower of sparks!"))
	else
		if(current_owner)
			current_owner.visible_message(span_danger("[current_owner]'s shields deflect [attack_text]!"))
	. = COMPONENT_HIT_REACTION_BLOCK
	drain_charge()
	if(!shield_recharge) // if recharge_start_delay is 0, we don't recharge
		return

	START_PROCESSING(SSdcs, src) // if we DO recharge, start processing so we can do that

/datum/component/shielded/proc/on_equipped(datum/source, mob/equipper, slot)
	current_owner = equipper
	if(target_slot && target_slot != slot)
		remove_shield()
		return
	apply_shield()

/datum/component/shielded/proc/on_dropped(datum/source,mob/dropper)
	remove_shield()
	current_owner =  null
