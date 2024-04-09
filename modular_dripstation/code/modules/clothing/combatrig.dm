#define SEALED_RIG_TRAIT "sealed-rig"

//////Dual-mode hardsuits//////
//Starting with original sindi one
/obj/item/clothing/head/helmet/space/hardsuit/syndi
	name = "scarlet RIG helmet"
	desc = "A standardized dual-mode helmet derived from more advanced special operations helmets. Manufactured by Donk Co."
	icon_state = "scarlet_helm"
	//item_state = "scarlet_helm"
	hardsuit_type = "scarlet"
	armor = list(MELEE = 35, BULLET = 25, LASER = 30, ENERGY = 25, BOMB = 40, BIO = 100, RAD = 50, FIRE = 75, ACID = 75, WOUND = 25, ELECTRIC = 100)
	on = FALSE
	light_color = LIGHT_COLOR_GREEN
	var/light_status = FALSE
	var/mobility = TRUE
	var/processing = FALSE
	var/obj/item/clothing/suit/space/hardsuit/syndi/linkedsuit = null
	actions_types = list(/datum/action/item_action/toggle_helmet_mode, /datum/action/item_action/toggle_rig_light)
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE|HIDEFACIALHAIR
	visor_flags = STOPSPRESSUREDAMAGE
	min_cold_protection_temperature = FIRE_HELM_MIN_TEMP_PROTECT
	var/list/list_of_modes = null
	var/toggled_for_heat_protecting = TRUE	//tipically all that nonlightweight
	var/winter_mod = FALSE	//protects from cold when toggled in combat mode


/obj/item/clothing/head/helmet/space/hardsuit/syndi/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, LOCKED_HELMET_TRAIT)
	if(istype(loc, /obj/item/clothing/suit/space/hardsuit/syndi))
		linkedsuit = loc
	desc = initial(desc) + " It is in combat mode"
	clothing_flags &= ~visor_flags
	flags_cover &= ~(HEADCOVERSEYES | HEADCOVERSMOUTH)
	flags_inv &= ~visor_flags_inv
	if(!winter_mod)
		cold_protection &= ~HEAD
	if(toggled_for_heat_protecting)
		heat_protection &= ~HEAD

/obj/item/clothing/head/helmet/space/hardsuit/syndi/proc/spaceready(mob/user)
	name += " (sealed)"
	desc = initial(desc) + " It is in EVA mode"
	icon_state = "[initial(icon_state)]_sealed"
	clothing_flags |= visor_flags
	flags_cover |= HEADCOVERSEYES | HEADCOVERSMOUTH
	flags_inv |= visor_flags_inv
	if(!winter_mod)
		cold_protection |= HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	if(toggled_for_heat_protecting)
		heat_protection |= HEAD
	user.update_inv_head()
	on = TRUE
	toggle_hardsuit_mode(user)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/attack_self(mob/user) //Toggle hardsuit mode
	if(!isturf(user.loc))
		to_chat(user, span_warning("You cannot toggle your helmet while in this [user.loc]!") )
		return
	if(processing)
		user.balloon_alert(user, "still processing!")
		return
	processing = TRUE
	playsound(src.loc, 'modular_dripstation/sound/servo_motor.ogg', 50, 1)
	if(!do_after(user, 1.8 SECONDS, user, timed_action_flags = (mobility ? IGNORE_ALL : IGNORE_HELD_ITEM), extra_checks = CALLBACK(src, PROC_REF(CheckCanToggle), user)))
		user.balloon_alert(user, "interrupted!")
		return
	processing = FALSE
	on = !on
	if(on || force)
		to_chat(user, span_notice("You switch your hardsuit to EVA mode, sacrificing speed for space protection."))
		name += " (sealed)"
		desc = initial(desc) + " It is in EVA mode"
		icon_state = "[initial(icon_state)]_sealed"
		clothing_flags |= visor_flags
		flags_cover |= HEADCOVERSEYES | HEADCOVERSMOUTH
		flags_inv |= visor_flags_inv
		if(!winter_mod)
			cold_protection |= HEAD
		min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
		if(toggled_for_heat_protecting)
			heat_protection |= HEAD
	else
		to_chat(user, span_notice("You switch your hardsuit to atmospheric mode and can now run at full possible speed."))
		name = initial(name)
		desc = initial(desc) + " It is in combat mode"
		light_status = FALSE
		set_light_on(light_status)
		icon_state = initial(icon_state)
		clothing_flags &= ~visor_flags
		flags_cover &= ~(HEADCOVERSEYES | HEADCOVERSMOUTH)
		flags_inv &= ~visor_flags_inv
		if(!winter_mod)
			cold_protection &= ~HEAD
		min_cold_protection_temperature = FIRE_HELM_MIN_TEMP_PROTECT
		if(toggled_for_heat_protecting)
			heat_protection &= ~HEAD
	playsound(src.loc, 'sound/mecha/mechmove03.ogg', 50, 1)
	toggle_hardsuit_mode(user)
	user.update_inv_head()
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		C.head_update(src, forced = 1)
	for(var/X in actions)
		var/datum/action/A = X
		A.build_all_button_icons()


/obj/item/clothing/head/helmet/space/hardsuit/syndi/proc/CheckCanToggle(mob/user)
	var/obj/item/H = user.get_item_by_slot(ITEM_SLOT_HEAD)
	if(!H || !istype(H, linkedsuit.helmettype))
		to_chat(user, span_warning("You need your helmet be on!"))
		return
	return TRUE

/obj/item/clothing/head/helmet/space/hardsuit/syndi/AltClick(mob/user)
	light_toggling_proc(user)
	user.update_inv_head()

/obj/item/clothing/head/helmet/space/hardsuit/syndi/proc/light_toggling_proc(user)
	if(!on)
		return FALSE
	light_status = !light_status
	icon_state = "[initial(icon_state)]_sealed[light_status ? "_light":""]"
	set_light_on(light_status)

/datum/action/item_action/toggle_rig_light
	name = "Toggle Helmet Light"

/datum/action/item_action/toggle_rig_light/Trigger()
	var/obj/item/clothing/head/helmet/space/hardsuit/syndi/rig = target
	if(istype(rig))
		rig.light_toggling_proc(owner)
		//rig.update_appearance(UPDATE_ICON)
		owner.update_inv_head()

/datum/action/item_action/toggle_rig_light/IsAvailable(feedback = FALSE)
	var/obj/item/clothing/head/helmet/space/hardsuit/syndi/rig = target
	if(!istype(rig) || !rig.on)
		return FALSE
	return ..()

/obj/item/clothing/head/helmet/space/hardsuit/syndi/proc/toggle_hardsuit_mode(mob/user) //Helmet Toggles Suit Mode
	if(linkedsuit)
		if(on)
			linkedsuit.name += " (sealed)"
			linkedsuit.desc = "[initial(linkedsuit.desc)] It is in EVA mode."
			linkedsuit.slowdown = linkedsuit.eva_slowdown
			linkedsuit.clothing_flags |= STOPSPRESSUREDAMAGE
			if(!winter_mod)
				linkedsuit.cold_protection |= CHEST | GROIN | LEGS | FEET | ARMS | HANDS
			linkedsuit.min_cold_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
			if(toggled_for_heat_protecting)
				linkedsuit.heat_protection |= CHEST | GROIN | LEGS | FEET | ARMS | HANDS
			linkedsuit.strip_delay += 50
			ADD_TRAIT(linkedsuit, TRAIT_NODROP, SEALED_RIG_TRAIT)
		else
			linkedsuit.name = initial(linkedsuit.name)
			linkedsuit.desc = "[initial(linkedsuit.desc)] It is in combat mode."
			linkedsuit.slowdown = linkedsuit.combat_slowdown
			linkedsuit.clothing_flags &= ~STOPSPRESSUREDAMAGE
			if(!winter_mod)
				linkedsuit.cold_protection &= ~(CHEST | GROIN | LEGS | FEET | ARMS | HANDS)
			linkedsuit.min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
			if(toggled_for_heat_protecting)
				linkedsuit.heat_protection &= ~(CHEST | GROIN | LEGS | FEET | ARMS | HANDS)
			linkedsuit.strip_delay -= 50
			if(linkedsuit.lightweight)
				linkedsuit.flags_inv &= ~(HIDEGLOVES | HIDESHOES | HIDEJUMPSUIT)
			REMOVE_TRAIT(linkedsuit, TRAIT_NODROP, SEALED_RIG_TRAIT)

		linkedsuit.hardon = on	//Tracking current mode on suit
		linkedsuit.icon_state = "[linkedsuit.hardsuit_type]_rig[on ? "_sealed":""]"
		linkedsuit.update_appearance(UPDATE_ICON)
		user.update_inv_wear_suit()
		user.update_inv_w_uniform()



/obj/item/clothing/suit/space/hardsuit/syndi
	name = "scarlet RIG"
	desc = "A standardized dual-mode RIG derived from more advanced special operations hardsuits. Manufactured by Donk Co."
	icon_state = "scarlet_rig"
	//item_state = "scarlet_rig"
	hardsuit_type = "scarlet"
	w_class = WEIGHT_CLASS_NORMAL
	var/hardon = FALSE				//Tracking current mode on suit, handles by helmet on
	armor = list(MELEE = 35, BULLET = 25, LASER = 30, ENERGY = 25, BOMB = 40, BIO = 100, RAD = 50, FIRE = 75, ACID = 75, WOUND = 25, ELECTRIC = 100)
	allowed = list(/obj/item/gun, /obj/item/ammo_box,/obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/melee/transforming/energy/sword/saber, /obj/item/restraints/handcuffs, /obj/item/tank/internals)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi
	jetpack = null
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	var/toggled_for_heat_protecting = TRUE
	var/combat_slowdown = 0.5 //slowdown when in combat mode
	var/eva_slowdown = 1 //slowdown when in eva mode
	var/lightweight = 1 //used for flags when toggling
	var/winter_mod = FALSE	//protects from cold when toggled in combat mode
	var/complexity = 1	//how many modules can be attached

/obj/item/clothing/suit/space/hardsuit/syndi/Initialize()
	. = ..()
	SuitRestartHandle()

/obj/item/clothing/suit/space/hardsuit/syndi/proc/SuitRestartHandle()
	slowdown = combat_slowdown
	icon_state = "[hardsuit_type]_rig"
	clothing_flags &= ~STOPSPRESSUREDAMAGE
	if(!winter_mod)
		cold_protection &= ~(CHEST | GROIN | LEGS | FEET | ARMS | HANDS)
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	if(toggled_for_heat_protecting)
		heat_protection &= ~(CHEST | GROIN | LEGS | FEET | ARMS | HANDS)
	if(lightweight)
		flags_inv &= ~(HIDEGLOVES | HIDESHOES | HIDEJUMPSUIT)

////////////////////
////Known bugs
////////////////////
//When helmet desealed (processing) - removing helmet button will break hardsuit
//Nodrop trait hardly blocking suit, nothing for now can deseal it

///obj/item/clothing/suit/space/hardsuit/syndi/canStrip(mob/stripper, mob/owner)
//	SHOULD_BE_PURE(TRUE)
//	return !HAS_TRAIT_FROM(src, TRAIT_NODROP, SEALED_RIG_TRAIT)

///obj/item/clothing/suit/space/hardsuit/syndi/doStrip(mob/stripper, mob/owner)
//	SuitRestartHandle()
//	playsound(src.loc, 'modular_dripstation/sound/servo_motor.ogg', 50, 1)
//	return owner.dropItemToGround(src)


///obj/item/clothing/suit/space/hardsuit/syndi/ToggleHelmet()
//	var/mob/living/carbon/human/H = src.loc
//	if(!helmettype)
//		return
//	if(!helmet)
//		return
//	if(!suittoggled)
//		if(ishuman(src.loc))
//			if(H.wear_suit != src)
//				to_chat(H, span_warning("You must be wearing [src] to engage the helmet!"))
//				return
//			if(H.head)
//				to_chat(H, span_warning("You're already wearing something on your head!"))
//				return
//			else if(H.equip_to_slot_if_possible(helmet,ITEM_SLOT_HEAD,0,0,1))
//				to_chat(H, span_notice("You engage the helmet on the hardsuit."))
//				suittoggled = TRUE
//				H.update_inv_wear_suit()
//				playsound(src.loc, 'sound/mecha/mechmove03.ogg', 50, 1)
//	else
//		RemoveHelmet()

///obj/item/clothing/suit/space/hardsuit/syndi/RemoveHelmet()
//	if(!helmet)
//		return
//	suittoggled = FALSE
//	helmet.unequip_hat()
//	if(ishuman(helmet.loc))
//		var/mob/living/carbon/H = helmet.loc
//		if(helmet.on)
//			helmet.attack_self(H)
//		H.transferItemToLoc(helmet, src, TRUE)
//		H.update_inv_wear_suit()
//		to_chat(H, span_notice("The helmet on the hardsuit disengages."))
//		playsound(src.loc, 'sound/mecha/mechmove03.ogg', 50, 1)
//	else
//		helmet.forceMove(src)

//////////////////////////////////////////
/////////Shielded dualmod (no mode)///////

/*
/obj/item/clothing/suit/space/hardsuit/syndi/shielded
	var/current_charges = 3
	var/max_charges = 3 //How many charges total the shielding has
	var/recharge_delay = 200 //How long after we've been shot before we can start recharging. 20 seconds here
	var/recharge_cooldown = 0 //Time since we've last been shot
	var/recharge_rate = 1 //How quickly the shield recharges once it starts charging
	var/shield_state = "shield-red"
	var/shield_on = "shield-red"
	var/shield_off = "shield-flash"

/obj/item/clothing/suit/space/hardsuit/syndi/shielded/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	recharge_cooldown = world.time + recharge_delay
	if(current_charges > 0)
		var/datum/effect_system/spark_spread/s = new
		s.set_up(2, 1, src)
		s.start()
		owner.visible_message(span_danger("[owner]'s shields deflect [attack_text] in a shower of sparks!"))
		current_charges--
		if(recharge_rate)
			START_PROCESSING(SSobj, src)
		if(current_charges <= 0)
			owner.visible_message(span_danger("[owner]'s shield overloads!"))
			shield_state = "[shield_off]"
			owner.update_inv_wear_suit()
		return 1
	return 0


/obj/item/clothing/suit/space/hardsuit/syndi/shielded/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/clothing/suit/space/hardsuit/syndi/shielded/process()
	if(world.time > recharge_cooldown && current_charges < max_charges)
		current_charges = clamp((current_charges + recharge_rate), 0, max_charges)
		playsound(loc, 'sound/magic/charge.ogg', 50, 1)
		if(current_charges == max_charges)
			playsound(loc, 'sound/machines/ding.ogg', 50, 1)
			STOP_PROCESSING(SSobj, src)
		shield_state = "[shield_on]"
		if(ishuman(loc))
			var/mob/living/carbon/human/C = loc
			C.update_inv_wear_suit()

/obj/item/clothing/suit/space/hardsuit/syndi/shielded/worn_overlays(isinhands = FALSE)
	. = ..()
	if(!isinhands)
		. += mutable_appearance('modular_dripstation/icons/effects/shield.dmi', shield_state, MOB_LAYER+0.01)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/shielded
	light_color = LIGHT_COLOR_DEFAULT




/obj/item/clothing/head/helmet/space/hardsuit/syndi/shielded/bloodred
	name = "blood-red RIG helmet"
	desc = "A dual-mode advanced helmet designed for special operations. Property of Gorlex Marauders."
	icon_state = "bloodred_helm"
	//item_state = "bloodred_helm"
	hardsuit_type = "bloodred"
	light_range = 6
	light_color = LIGHT_COLOR_GREEN
	armor = list(MELEE = 40, BULLET = 50, LASER = 30, ENERGY = 25, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 90, WOUND = 25, ELECTRIC = 100)
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE
	toggled_for_heat_protecting = FALSE

/obj/item/clothing/suit/space/hardsuit/syndi/shielded/bloodred
	name = "blood-red shielded RIG"
	desc = "A dual-mode advanced RIG designed for special operations. Has inbuilt shielding module and advanced combat leg servomotors. Original design by Gorlex Marauders."
	icon_state = "bloodred_rig"
	//item_state = "bloodred_rig"
	hardsuit_type = "bloodred"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/shielded/bloodred
	jetpack = /obj/item/tank/jetpack/suit	//downgraded jet
	allowed = list(/obj/item/gun, /obj/item/ammo_box, /obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/melee/transforming/energy/sword/saber, /obj/item/restraints/handcuffs, /obj/item/tank/internals, /obj/item/tank/jetpack/oxygen/harness)
	armor = list(MELEE = 40, BULLET = 50, LASER = 30, ENERGY = 25, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 90, WOUND = 25, ELECTRIC = 100)
	combat_slowdown = -0.2
	lightweight = 0
	toggled_for_heat_protecting = FALSE
	current_charges = 1	//How many charges suit starting with
	max_charges = 1 //How many charges total the shielding has
	recharge_delay = 100 //How long after we've been shot before we can start recharging. 10 seconds here

////////////////////////////////////////////
/////////DEATHSQUAD SHIELDED DUAL-MOD///////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/shielded/deathsquad
	name = "elite emergency response team RIG helmet (blackops)"
	desc = "Advanced helmet issued to black ops team operator."
	icon_state = "nt_deathsquad_helm"
	//item_state = "nt_deathsquad_helm"
	hardsuit_type = "nt_deathsquad"
	armor = list(MELEE = 50, BULLET = 60, LASER = 50, ENERGY = 50, BOMB = 60, BIO = 100, RAD = 100, FIRE = 75, ACID = 75, WOUND = 25, ELECTRIC = 100)
	light_range = 7
	light_color = LIGHT_COLOR_LIGHT_CYAN
	heat_protection = HEAD
	resistance_flags = FIRE_PROOF|ACID_PROOF
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE
	toggled_for_heat_protecting = FALSE
	var/hit_reflect_chance = 50

/obj/item/clothing/head/helmet/space/hardsuit/syndi/shielded/deathsquad/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		var/datum/atom_hud/SHUD = GLOB.huds[DATA_HUD_SECURITY_MEDICAL]
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		SHUD.show_to(user)
		DHUD.show_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/shielded/deathsquad/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/SHUD = GLOB.huds[DATA_HUD_SECURITY_MEDICAL]
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		SHUD.hide_from(user)
		DHUD.hide_from(user)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/shielded/deathsquad/Initialize()
	. = ..()
	AddComponent(/datum/component/anti_magic, antimagic_flags = MAGIC_RESISTANCE_MIND, inventory_flags = ITEM_SLOT_OCLOTHING)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/shielded/deathsquad/IsReflect(def_zone)
	if(!(def_zone in list(BODY_ZONE_HEAD, BODY_ZONE_PRECISE_MOUTH, BODY_ZONE_PRECISE_EYES))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return FALSE
	if (prob(hit_reflect_chance))
		return TRUE

/obj/item/clothing/suit/space/hardsuit/syndi/shielded/deathsquad
	name = "elite emergency response team RIG (blackops)"
	desc = "Advanced RIG issued to black ops team operator. Made from superior materials, one of the latest in the modern combat rigs line. Has inbuilt shielding module."
	icon_state = "nt_deathsquad_rig"
	//item_state = "nt_deathsquad_rig"
	hardsuit_type = "nt_deathsquad"
	armor = list(MELEE = 50, BULLET = 60, LASER = 50, ENERGY = 50, BOMB = 60, BIO = 100, RAD = 100, FIRE = 75, ACID = 75, WOUND = 25, ELECTRIC = 100)
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	resistance_flags = FIRE_PROOF|ACID_PROOF
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	combat_slowdown = 0.3
	lightweight = 0
	toggled_for_heat_protecting = FALSE
	helmettype = /obj/item/clothing/suit/space/hardsuit/syndi/shielded/deathsquad
	var/hit_reflect_chance = 50
	combat_slowdown = 0.2
	shield_state = "shield-old"
	shield_on = "shield-old"

/obj/item/clothing/suit/space/hardsuit/syndi/shielded/deathsquad/Initialize()
	. = ..()
	AddComponent(/datum/component/anti_magic, antimagic_flags = MAGIC_RESISTANCE|MAGIC_RESISTANCE_HOLY, inventory_flags = ITEM_SLOT_OCLOTHING)

/obj/item/clothing/suit/space/hardsuit/syndi/shielded/deathsquad/IsReflect(def_zone)
	if(!(def_zone in list(BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return FALSE
	if (prob(hit_reflect_chance))
		return TRUE
*/

//The Owl Hardsuit
/obj/item/clothing/head/helmet/space/hardsuit/syndi/owl
	armor = list(MELEE = 40, BULLET = 50, LASER = 30, ENERGY = 25, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 90, WOUND = 25, ELECTRIC = 100)
	toggled_for_heat_protecting = FALSE
	light_color = LIGHT_COLOR_DEFAULT

/obj/item/clothing/suit/space/hardsuit/syndi/owl
	armor = list(MELEE = 40, BULLET = 50, LASER = 30, ENERGY = 25, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 90, WOUND = 25, ELECTRIC = 100)
	combat_slowdown = 0
	lightweight = 0
	toggled_for_heat_protecting = FALSE

////////////////////////////////
/////////NORMAL DUAL-MODS///////
////////////////////////////////
////////////////////////////////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/engineering
	name = "engineering RIG helmet"
	desc = "A modern helmet designed for isolation from the hazardous, low-pressure environment. Has radiation shielding."
	icon_state = "engineering_helm"
	//item_state = "engineering_helm"
	hardsuit_type = "engineering"
	armor = list(MELEE = 30, BULLET = 5, LASER = 10, ENERGY = 5, BOMB = 10, BIO = 100, RAD = 100, FIRE = 100, ACID = 75, WOUND = 10, ELECTRIC = 100)
	resistance_flags = FIRE_PROOF
	visor_flags_inv = HIDEEYES|HIDEFACE
	light_color = LIGHT_COLOR_DEFAULT

/obj/item/clothing/suit/space/hardsuit/syndi/engineering
	name = "engineering RIG"
	desc = "A modern rig designed for isolation from the hazardous, low pressure environments. Has radiation shielding."
	icon_state = "engineering_rig"
	//item_state = "engineering_rig"
	item_state = "eng_hardsuit"
	hardsuit_type = "engineering"
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals, /obj/item/t_scanner, /obj/item/construction/rcd, /obj/item/pipe_dispenser)
	armor = list(MELEE = 30, BULLET = 5, LASER = 10, ENERGY = 5, BOMB = 10, BIO = 100, RAD = 100, FIRE = 100, ACID = 75, WOUND = 10, ELECTRIC = 100)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/engineering
	resistance_flags = FIRE_PROOF

//mechanic
/obj/item/clothing/head/helmet/space/hardsuit/syndi/engineering/mechanic
	name = "mechanic RIG helmet"
	desc = "A modern helmet designed for isolation from the hazardous, low-pressure environment. Has radiation shielding and improved bulletproof covering."
	icon_state = "mechanic_helm"
	//item_state = "mechanic_helm"
	hardsuit_type = "mechanic"
	armor = list(MELEE = 30, BULLET = 15, LASER = 10, ENERGY = 5, BOMB = 10, BIO = 100, RAD = 100, FIRE = 50, ACID = 75, WOUND = 10, ELECTRIC = 100)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/engineering/mechanic/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_BASIC]
		DHUD.show_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/engineering/mechanic/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_BASIC]
		DHUD.hide_from(user)

/obj/item/clothing/suit/space/hardsuit/syndi/engineering/mechanic
	name = "mechanic RIG"
	desc = "A modern rig designed for isolation from the hazardous, low pressure environments. Has radiation shielding and improved bulletproof covering."
	icon_state = "engineering_rig"
	//item_state = "engineering_rig"
	hardsuit_type = "engineering"
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals, /obj/item/t_scanner, /obj/item/construction/rcd, /obj/item/pipe_dispenser)
	armor = list(MELEE = 30, BULLET = 15, LASER = 10, ENERGY = 5, BOMB = 10, BIO = 100, RAD = 100, FIRE = 50, ACID = 75, WOUND = 10, ELECTRIC = 100)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/engineering/mechanic

//Atmospherics
/obj/item/clothing/head/helmet/space/hardsuit/syndi/engineering/atmospheric
	name = "atmospheric RIG helmet"
	desc = "A modern helmet designed for isolation from the hazardous, low-pressure environment. Has thermal shielding."
	armor = list(MELEE = 30, BULLET = 5, LASER = 10, ENERGY = 5, BOMB = 10, BIO = 100, RAD = 25, FIRE = 100, ACID = 75, WOUND = 10, ELECTRIC = 100)
	icon_state = "atmospheric_helm"
	//item_state = "atmospheric_helm"
	hardsuit_type = "atmospheric"
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEEARS
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	light_color = LIGHT_COLOR_ELECTRIC_CYAN

/obj/item/clothing/suit/space/hardsuit/syndi/engineering/atmospheric
	name = "atmospheric RIG"
	desc = "A modern rig designed for isolation from the hazardous, low pressure environments. Has thermal shielding."
	armor = list(MELEE = 30, BULLET = 5, LASER = 10, ENERGY = 5, BOMB = 10, BIO = 100, RAD = 25, FIRE = 100, ACID = 75, WOUND = 10, ELECTRIC = 100)
	icon_state = "atmospheric_rig"
	//item_state = "atmospheric_rig"
	item_state = "atmo_hardsuit"
	hardsuit_type = "atmospheric"
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/engineering/atmospheric

//Atmospherics black
/obj/item/clothing/head/helmet/space/hardsuit/syndi/engineering/atmospheric/alt
	icon_state = "atmosphericalt_helm"
	//item_state = "atmosphericalt_helm"
	hardsuit_type = "atmosphericalt"

/obj/item/clothing/suit/space/hardsuit/syndi/engineering/atmospheric/alt
	icon_state = "atmosphericalt_rig"
	//item_state = "atmosphericalt_rig"
	hardsuit_type = "atmosphericalt"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/engineering/atmospheric/alt

//CE
/obj/item/clothing/head/helmet/space/hardsuit/syndi/engineering/elite
	name = "elite utility RIG helmet"
	desc = "An advanced helmet designed for work in a hazardous, low pressure environment. Shines with a high polish."
	icon_state = "ce_helm"
	//item_state = "ce_helm"
	hardsuit_type = "ce"
	armor = list(MELEE = 40, BULLET = 5, LASER = 10, ENERGY = 5, BOMB = 50, BIO = 100, RAD = 100, FIRE = 100, ACID = 90, WOUND = 10, ELECTRIC = 100)
	visor_flags_inv = null
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT

/obj/item/clothing/suit/space/hardsuit/syndi/engineering/elite
	name = "elite utility RIG"
	desc = "An advanced rig that protects against hazardous, low pressure environments. Shines with a high polish."
	icon_state = "ce_rig"
	//item_state = "ce_rig"
	item_state = "ce_hardsuit"
	hardsuit_type = "ce"
	armor = list(MELEE = 40, BULLET = 5, LASER = 10, ENERGY = 5, BOMB = 50, BIO = 100, RAD = 100, FIRE = 100, ACID = 90, WOUND = 10, ELECTRIC = 100)
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	jetpack = /obj/item/tank/jetpack/suit
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/engineering/elite

/////syndicate engineer 
/obj/item/clothing/head/helmet/space/hardsuit/syndi/engineering/syndicate
	name = "GEC RIG helmet"
	desc = "A modern helmet designed for isolation from the hazardous, low-pressure environment. Global Engineering Consortium production."
	icon_state = "sindengi_helm"
	//item_state = "sindengi_helm"
	hardsuit_type = "sindengi"
	light_range = 6
	armor = list(MELEE = 40, BULLET = 30, LASER = 30, ENERGY = 25, BOMB = 50, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 15, ELECTRIC = 100)
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/head/helmet/space/hardsuit/syndi/engineering/syndicate/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_BASIC]
		DHUD.show_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/engineering/syndicate/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_BASIC]
		DHUD.hide_from(user)

/obj/item/clothing/suit/space/hardsuit/syndi/engineering/syndicate
	name = "GEC RIG"
	desc = "A modern rig designed for isolation from the hazardous, low pressure environments. Global Engineering Consortium production. Unite for best working conditions."
	icon_state = "sindengi_rig"
	//item_state = "sindengi_rig"
	hardsuit_type = "sindengi"
	armor = list(MELEE = 40, BULLET = 30, LASER = 30, ENERGY = 25, BOMB = 50, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 15, ELECTRIC = 100)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/engineering/syndicate
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF
	combat_slowdown = 0.1


/obj/item/clothing/head/helmet/space/hardsuit/syndi/engineering/syndicate/winter
	name = "winter GEC RIG helmet"
	desc = "A modern helmet designed for isolation from the hazardous, low-pressure environment. Global Engineering Consortium production."
	icon_state = "sindengiwinter_helm"
	//item_state = "sindengiwinter_helm"
	hardsuit_type = "sindengiwinter"
	winter_mod = TRUE

/obj/item/clothing/suit/space/hardsuit/syndi/engineering/syndicate/winter
	name = "winter GEC RIG"
	icon_state = "sindengiwinter_rig"
	//item_state = "sindengiwinter_rig"
	hardsuit_type = "sindengiwinter"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/engineering/syndicate/winter
	winter_mod = TRUE

///////Medical dual-mods///////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/medical
	name = "medical RIG helmet"
	desc = "A standardized dual-mode helmet derived from more advanced special operations helmets. Designed for medical extractions in hasard areas."
	icon_state = "medical_helm"
	//item_state = "medical_helm"
	hardsuit_type = "medical"
	armor = list(MELEE = 30, BULLET = 5, LASER = 10, ENERGY = 5, BOMB = 10, BIO = 100, RAD = 60, FIRE = 60, ACID = 75, WOUND = 10, ELECTRIC = 100)
	clothing_flags = STOPSPRESSUREDAMAGE | THICKMATERIAL | SCAN_REAGENTS | HEADINTERNALS
	light_color = LIGHT_COLOR_BLUEGREEN

/obj/item/clothing/suit/space/hardsuit/syndi/medical
	name = "medical RIG"
	desc = "A standardized dual-mode RIG derived from more advanced special operations hardsuits. Built with lightweight materials for easier movement. Expensive in production and maintaining."
	icon_state = "medical_rig"
	//item_state = "medical_rig"
	item_state = "medical_hardsuit"
	hardsuit_type = "medical"
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals, /obj/item/storage/firstaid, /obj/item/healthanalyzer, /obj/item/stack/medical)
	armor = list(MELEE = 30, BULLET = 5, LASER = 10, ENERGY = 5, BOMB = 10, BIO = 100, RAD = 60, FIRE = 60, ACID = 75, WOUND = 10, ELECTRIC = 100)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/medical

/obj/item/clothing/head/helmet/space/hardsuit/syndi/medical/rescue
	name = "rescue RIG helmet"
	desc = "A standardized dual-mode helmet derived from more advanced special operations helmets. Designed for rescue attempts in hasard areas."
	icon_state = "rescue_helm"
	//item_state = "rescue_helm"
	hardsuit_type = "rescue"

/obj/item/clothing/head/helmet/space/hardsuit/syndi/medical/rescue/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		var/datum/atom_hud/MHUD = GLOB.huds[DATA_HUD_MEDICAL_BASIC]
		MHUD.show_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/medical/rescue/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/MHUD = GLOB.huds[DATA_HUD_MEDICAL_BASIC]
		MHUD.hide_from(user)

/obj/item/clothing/suit/space/hardsuit/syndi/medical/rescue
	name = "rescue RIG"
	desc = "A standardized dual-mode RIG derived from more advanced special operations hardsuits. Built with lightweight materials for easier movement. Expensive in production and maintaining."
	icon_state = "rescue_rig"
	//item_state = "rescue_rig"
	hardsuit_type = "rescue"
	slowdown = 0.4
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/medical/rescue

////////////////////////////
//////Mining Dual-mod//////
////////////////////////////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/mining
	name = "mining RIG helmet"
	desc = "A standardized dual-mode helmet derived from more advanced special operations helmets. Designed for mining operations in hasard areas."
	icon_state = "mining_helm"
	//item_state = "mining_helm"
	light_range = 7
	hardsuit_type = "mining"
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF
	armor = list(MELEE = 30, BULLET = 5, LASER = 10, ENERGY = 5, BOMB = 50, BIO = 100, RAD = 50, FIRE = 50, ACID = 75, WOUND = 15, ELECTRIC = 100)
	visor_flags_inv = HIDEEYES|HIDEFACE
	light_color = LIGHT_COLOR_YELLOW

/obj/item/clothing/head/helmet/space/hardsuit/syndi/mining/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/space/hardsuit/syndi/mining
	name = "mining RIG helmet"
	desc = "A standardized dual-mode RIG derived from more advanced special operations hardsuits. Used by mining groups across human space. Expensive in production and maintaining."
	icon_state = "mining_rig"
	//item_state = "mining_rig"
	item_state = "mining_hardsuit"
	hardsuit_type = "mining"
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF
	armor = list(MELEE = 30, BULLET = 5, LASER = 10, ENERGY = 5, BOMB = 50, BIO = 100, RAD = 50, FIRE = 50, ACID = 75, WOUND = 15, ELECTRIC = 100)
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals, /obj/item/storage/bag/ore, /obj/item/pickaxe)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/mining

/obj/item/clothing/suit/space/hardsuit/syndi/mining/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/armor_plate)


//////////////////////////////
//////Security Dual-mods//////
//////////////////////////////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/security
	name = "security RIG helmet"
	icon_state = "sec_helm"
	//item_state = "sec_helm"
	hardsuit_type = "sec"
	light_range = 5
	desc = "A standardized dual-mode helmet derived from more advanced special operations helmets. Designed for security operations in hasard AO`s."
	armor = list(MELEE = 30, BULLET = 25, LASER = 30, ENERGY = 10, BOMB = 40, BIO = 100, RAD = 50, FIRE = 75, ACID = 75, WOUND = 15, ELECTRIC = 100)
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE
	light_color = LIGHT_COLOR_RED

/obj/item/clothing/suit/space/hardsuit/syndi/security
	name = "security RIG"
	icon_state = "sec_rig"
	//item_state = "sec_rig"
	item_state = "sec_hardsuit"
	hardsuit_type = "sec"
	desc = "A standardized dual-mode RIG derived from more advanced special operations hardsuits. Used by paramilitary groups and PMC alike across human space. Expensive in production and maintaining."
	armor = list(MELEE = 30, BULLET = 25, LASER = 30, ENERGY = 10, BOMB = 40, BIO = 100, RAD = 50, FIRE = 75, ACID = 75, WOUND = 15, ELECTRIC = 100)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/security

/obj/item/clothing/suit/space/hardsuit/syndi/security/Initialize(mapload)
	. = ..()
	allowed = GLOB.security_hardsuit_allowed

/obj/item/clothing/head/helmet/space/hardsuit/syndi/security/brigmed
	name = "security brigmed RIG helmet"
	icon_state = "brigmed_helm"
	//item_state = "brigmed_helm"
	hardsuit_type = "brigmed"
	desc = "A standardized dual-mode helmet derived from more advanced special operations helmets. Designed for medical extractions from combat zones."
	armor = list(MELEE = 25, BULLET = 15, LASER = 20, ENERGY = 10, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 75, WOUND = 15, ELECTRIC = 100)

/obj/item/clothing/suit/space/hardsuit/syndi/security/brigmed
	name = "security brigmed RIG"
	icon_state = "brigmed_rig"
	//item_state = "brigmed_rig"
	hardsuit_type = "brigmed"
	desc = "A standardized dual-mode RIG derived from more advanced special operations hardsuits. Used by paramedics of paramilitary groups and PMC alike across human space. Expensive in production and maintaining."
	armor = list(MELEE = 25, BULLET = 15, LASER = 20, ENERGY = 10, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 75, WOUND = 15, ELECTRIC = 100)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/security/brigmed
	combat_slowdown = 0.4



//////Gorlex Sec suit//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/security/gorlex
	name = "\improper Gorlex security RIG helmet"
	icon_state = "secsyndi_helm"
	//item_state = "secsyndi_helm"
	hardsuit_type = "secsyndi"
	desc = "Bulletproof dual-mode helmet derived from more advanced special operations helmets. Designed for private military operations in hasard AO`s. Gorlex Security brunch property."
	armor = list(MELEE = 35, BULLET = 45, LASER = 15, ENERGY = 10, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 75, WOUND = 15, ELECTRIC = 100)
	light_color = LIGHT_COLOR_GREEN

/obj/item/clothing/suit/space/hardsuit/syndi/security/gorlex
	name = "\improper Gorlex security RIG"
	icon_state = "secsyndi_rig"
	//item_state = "secsyndi_rig"
	hardsuit_type = "secsyndi"
	desc = "Bulletproof dual-mode RIG derived from more advanced special operations hardsuits. Used by Gorlex Security groups across human space. Lacks laser protection. Expensive in production and maintaining."
	armor = list(MELEE = 30, BULLET = 40, LASER = 15, ENERGY = 10, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 75, WOUND = 15, ELECTRIC = 100)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/security/gorlex
	combat_slowdown = 0.3

//////Vahlen Sec suit//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/security/vahlen
	name = "vahlen corpsman RIG helmet"
	desc = "A dual-mode advanced helmet designed for medical extractions. Original design by Vahlen Pharmaceuticals."
	icon_state = "vahlencorpsman_helm"
	//item_state = "vahlencorpsman_helm"
	hardsuit_type = "vahlencorpsman"
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEEARS
	toggled_for_heat_protecting = FALSE
	armor = list(MELEE = 30, BULLET = 40, LASER = 40, ENERGY = 30, BOMB = 40, BIO = 100, RAD = 90, FIRE = 75, ACID = 90, WOUND = 20, ELECTRIC = 100)
	light_color = LIGHT_COLOR_DEFAULT

/obj/item/clothing/suit/space/hardsuit/syndi/security/vahlen
	name = "vahlen corpsman RIG"
	desc = "A dual-mode advanced RIG designed for medical extractions. Original design by Vahlen Pharmaceuticals."
	icon_state = "vahlencorpsman_rig"
	//item_state = "vahlencorpsman_rig"
	hardsuit_type = "vahlencorpsman"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/security/vahlen
	jetpack = /obj/item/tank/jetpack/suit
	armor = list(MELEE = 30, BULLET = 40, LASER = 40, ENERGY = 30, BOMB = 40, BIO = 100, RAD = 90, FIRE = 75, ACID = 90, WOUND = 20, ELECTRIC = 100)
	combat_slowdown = 0.3
	lightweight = 0
	toggled_for_heat_protecting = FALSE



/////////////////////////////////////////
//////Special Operations Dual-mods//////
/////////////////////////////////////////
/////////////////////////////////////////

//////Bloodred Syndie suit//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/bloodred
	name = "blood-red RIG helmet"
	desc = "A dual-mode advanced helmet designed for special operations. Property of Gorlex Marauders."
	icon_state = "bloodred_helm"
	//item_state = "bloodred_helm"
	hardsuit_type = "bloodred"
	light_range = 6
	armor = list(MELEE = 40, BULLET = 50, LASER = 30, ENERGY = 25, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 90, WOUND = 25, ELECTRIC = 100)
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE
	toggled_for_heat_protecting = FALSE

/obj/item/clothing/suit/space/hardsuit/syndi/bloodred
	name = "blood-red RIG"
	desc = "A dual-mode advanced RIG designed for special operations. Has inbuilt advanced combat leg servomotors and jetpack. Original design by Gorlex Marauders."
	icon_state = "bloodred_rig"
	//item_state = "bloodred_rig"
	hardsuit_type = "bloodred"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/bloodred
	jetpack = /obj/item/tank/jetpack/suit/bloodred
	allowed = list(/obj/item/gun, /obj/item/ammo_box, /obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/melee/transforming/energy/sword/saber, /obj/item/restraints/handcuffs, /obj/item/tank/internals, /obj/item/tank/jetpack/oxygen/harness)
	armor = list(MELEE = 40, BULLET = 50, LASER = 30, ENERGY = 25, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 90, WOUND = 25, ELECTRIC = 100)
	combat_slowdown = -0.2
	lightweight = 0
	toggled_for_heat_protecting = FALSE

/obj/item/tank/jetpack/suit/bloodred
	full_speed = TRUE
	icon_state = "jetpack-mini"
	classic = FALSE

/obj/item/clothing/head/helmet/space/hardsuit/syndi/bloodred/preview
	icon_state = "bloodred_helm_sealed_light"
	//item_state = "bloodred_helm_sealed_light"

/obj/item/clothing/suit/space/hardsuit/syndi/bloodred/preview
	icon_state = "bloodred_rig_sealed"
	//item_state = "bloodred_rig_sealed"


//////Winter bloodred Syndie suit//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/bloodred/winter
	name = "winter Gorlex RIG helmet"
	desc = "A dual-mode advanced helmet designed for special operations. Property of Gorlex Marauders."
	icon_state = "bloodwinter_helm"
	//item_state = "bloodwinter_helm"
	hardsuit_type = "bloodwinter"
	winter_mod = TRUE

/obj/item/clothing/suit/space/hardsuit/syndi/bloodred/winter
	name = "winter Gorlex RIG"
	desc = "A dual-mode advanced RIG designed for special operations. Has inbuilt advanced combat leg servomotors and improved cold resistant. Original design by Gorlex Marauders."
	icon_state = "bloodwinter_rig"
	//item_state = "bloodwinter_rig"
	hardsuit_type = "bloodwinter"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/bloodred/winter
	toggled_for_heat_protecting = FALSE
	winter_mod = TRUE

//////Bloodred Unathi suit//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/bloodred/unathi
	name = "blood-red unathi RIG helmet"
	desc = "A dual-mode advanced helmet designed for special operations. Moded for users with elongated skull proportions. Property of Gorlex Marauders."
	icon_state = "bloodred_unathi_helm"
	//item_state = "bloodred_unathi_helm"
	hardsuit_type = "bloodred_unathi"

/obj/item/clothing/suit/space/hardsuit/syndi/bloodred/unathi
	name = "blood-red unathi RIG"
	desc = "A dual-mode advanced RIG designed for special operations. Moded for users with digitigrade legs. Original design by Gorlex Marauders."
	icon_state = "bloodred_unathi_rig"
	//item_state = "bloodred_unathi_rig"
	hardsuit_type = "bloodred_unathi"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/bloodred/unathi
	mutantrace_variation = MUTANTRACE_VARIATION

//////Bloodred Waffle Co suit//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/bloodred/waffle
	name = "waffle specops RIG helmet"
	desc = "A dual-mode advanced helmet designed for special operations. Property of Waffle Co."
	icon_state = "wafflebloodred_helm"
	//item_state = "wafflebloodred_helm"
	hardsuit_type = "wafflebloodred"
	armor = list(MELEE = 30, BULLET = 50, LASER = 40, ENERGY = 25, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 90, WOUND = 25, ELECTRIC = 100)
	var/obj/item/clothing/suit/space/hardsuit/syndi/bloodred/waffle/magsuit = null

/obj/item/clothing/head/helmet/space/hardsuit/syndi/bloodred/waffle/Initialize()
	. = ..()
	if(istype(loc, /obj/item/clothing/suit/space/hardsuit/syndi/bloodred/waffle))
		magsuit = loc

/obj/item/clothing/head/helmet/space/hardsuit/syndi/bloodred/waffle/toggle_hardsuit_mode(mob/user) //Helmet Toggles Suit Mode
	. = ..()
	if(magsuit)
		if(on)
			magsuit.slowdown = magsuit.eva_slowdown + (magsuit.magpulse * magsuit.slowdown_magactive)
		else
			magsuit.slowdown = magsuit.combat_slowdown + (magsuit.magpulse * magsuit.slowdown_magactive)
		magsuit.icon_state = "[initial(magsuit.icon_state)][magsuit.hardon ? "_sealed" : ""][magsuit.magpulse ? "_active" : ""]"
		//magsuit.update_appearance(UPDATE_ICON)
		user.update_inv_wear_suit()

/obj/item/clothing/suit/space/hardsuit/syndi/bloodred/waffle
	name = "waffle specops RIG"
	desc = "A dual-mode advanced RIG designed for special operations with integrated track pulse system. Original design by Waffle Co."
	icon_state = "wafflebloodred_rig"
	//item_state = "wafflebloodred_rig"
	hardsuit_type = "wafflebloodred"
	armor = list(MELEE = 30, BULLET = 50, LASER = 40, ENERGY = 25, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 90, WOUND = 25, ELECTRIC = 100)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/bloodred/waffle
	combat_slowdown = 0.3
	eva_slowdown = 0.8
	var/slowdown_magactive = 1
	var/magpulse = 0

/obj/item/clothing/suit/space/hardsuit/syndi/bloodred/waffle/verb/toggle()
	set name = "Toggle Magboots"
	set category = "Object"
	set src in usr
	if(!can_use(usr))
		return
	AltClick(usr)

/obj/item/clothing/suit/space/hardsuit/syndi/bloodred/waffle/AltClick(mob/user)
	if(magpulse)
		clothing_flags &= ~NOSLIP
		slowdown -= slowdown_magactive
	else
		clothing_flags |= NOSLIP
		slowdown += slowdown_magactive
	magpulse = !magpulse
	icon_state = "[initial(icon_state)][hardon ? "_sealed" : ""][magpulse ? "_active" : ""]"
	//update_appearance(UPDATE_ICON)
	user.update_inv_wear_suit()
	to_chat(user, span_notice("You [magpulse ? "enable" : "disable"] the mag-pulse traction system."))
	user.update_gravity(user.has_gravity())
	for(var/X in actions)
		var/datum/action/A = X
		A.build_all_button_icons()

/obj/item/clothing/suit/space/hardsuit/syndi/bloodred/waffle/negates_gravity()
	return clothing_flags & NOSLIP

/obj/item/clothing/suit/space/hardsuit/syndi/bloodred/waffle/examine(mob/user)
	. = ..()
	. += "Its mag-pulse traction system appears to be [magpulse ? "enabled" : "disabled"]."


//////Bloodred Waffle Co Unathi suit//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/bloodred/waffle/unathi
	name = "blood-red unathi RIG helmet"
	desc = "A dual-mode advanced helmet designed for special operations. Moded for users with elongated skull proportions. Property of Waffle Co."
	icon_state = "wafflebloodred_unathi_helm"
	//item_state = "wafflebloodred_unathi_helm"
	hardsuit_type = "wafflebloodred_unathi"

/obj/item/clothing/suit/space/hardsuit/syndi/bloodred/waffle/unathi
	name = "blood-red unathi RIG"
	desc = "A dual-mode advanced RIG designed for special operations with integrated track pulse system. Moded for users with digitigrade legs. Original design by Waffle Co."
	icon_state = "wafflebloodred_unathi_rig"
	//item_state = "wafflebloodred_unathi_rig"
	hardsuit_type = "wafflebloodred_unathi"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/bloodred/waffle/unathi
	//mutantrace_variation = MUTANTRACE_VARIATION

//////Bloodred Waffle Co Unathi Breach suit//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/bloodred/waffle/unathi/breach
	name = "blood-red unathi Breach RIG helmet"
	desc = "A dual-mode advanced helmet designed for breach squads. Moded for users with elongated skull proportions. Property of Waffle Co."
	icon_state = "wafflebloodred_unathi_breacher_helm"
	//item_state = "wafflebloodred_unathi_breacher_helm"
	hardsuit_type = "wafflebloodred_unathi_breacher"
	armor = list(MELEE = 80, BULLET = 70, LASER = 50, ENERGY = 60, BOMB = 100, BIO = 100, RAD = 70, FIRE = 100, ACID = 100, WOUND = 30, ELECTRIC = 100)

/obj/item/clothing/suit/space/hardsuit/syndi/bloodred/waffle/unathi/breach
	name = "blood-red unathi Breach RIG"
	desc = "A dual-mode advanced RIG designed for breach squads with integrated track pulse system. Moded for users with digitigrade legs. Provides ability to breach through walls. Original design by Waffle Co."
	icon_state = "wafflebloodred_unathi_breacher_rig"
	//item_state = "wafflebloodred_unathi_breacher_rig"
	hardsuit_type = "wafflebloodred_unathi_breacher"
	armor = list(MELEE = 80, BULLET = 70, LASER = 50, ENERGY = 60, BOMB = 100, BIO = 100, RAD = 70, FIRE = 100, ACID = 100, WOUND = 30, ELECTRIC = 100)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/bloodred/waffle/unathi/breach
	//mutantrace_variation = MUTANTRACE_VARIATION

///obj/item/clothing/suit/space/hardsuit/syndi/bloodred/waffle/unathi/breach/equipped(mob/living/carbon/human/user, slot)
//	..()
//	if(slot == ITEM_SLOT_OCLOTHING)
//		RegisterSignal(user, COMSIG_ATOM_ATTACK_HAND, PROC_REF(on_attack_hand))

///obj/item/clothing/suit/space/hardsuit/syndi/bloodred/waffle/unathi/breach/dropped(mob/living/carbon/human/user, slot)
//	..()
//	if(slot == ITEM_SLOT_OCLOTHING)
//		UnregisterSignal(user, COMSIG_ATOM_ATTACK_HAND)

///obj/item/clothing/suit/space/hardsuit/syndi/bloodred/waffle/unathi/breach/proc/on_attack_hand(atom/target, mob/living/carbon/human/user, proximity)//don`t work
//	if(proximity) //no telekinetic breacher attack
//		return target.attack_hulk(user)


//////Elite hardsuit//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite
	name = "elite syndicate RIG helmet"
	desc = "An elite version of the syndicate helmet, with improved armour and fireproofing."
	icon_state = "relite_helm"
	//item_state = "relite_helm"
	hardsuit_type = "relite"
	light_range = 6
	armor = list(MELEE = 60, BULLET = 60, LASER = 50, ENERGY = 35, BOMB = 90, BIO = 100, RAD = 70, FIRE = 100, ACID = 100, WOUND = 25, ELECTRIC = 100)
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE
	toggled_for_heat_protecting = FALSE
	light_color = LIGHT_COLOR_DEFAULT

/obj/item/clothing/suit/space/hardsuit/syndi/elite
	name = "elite syndicate RIG"
	desc = "An elite version of the syndicate RIG, with improved armour and fireproofing."
	icon_state = "relite_rig"
	//item_state = "relite_rig"
	hardsuit_type = "relite"
	jetpack = /obj/item/tank/jetpack/suit
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite
	armor = list(MELEE = 60, BULLET = 60, LASER = 50, ENERGY = 30, BOMB = 90, BIO = 100, RAD = 70, FIRE = 100, ACID = 100, WOUND = 25, ELECTRIC = 100)
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF
	lightweight = 0
	toggled_for_heat_protecting = FALSE
	combat_slowdown = 0

/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/preview
	icon_state = "relite_helm_sealed"
	//item_state = "relite_helm_sealed"

/obj/item/clothing/suit/space/hardsuit/syndi/elite/preview
	icon_state = "relite_rig_sealed"
	//item_state = "relite_rig_sealed"

////Vahlen elite
/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/vahlen
	name = "elite Vahlen operative RIG helmet"
	icon_state = "vahlenop_helm"
	//item_state = "vahlenop_helm"
	hardsuit_type = "vahlenop"
	light_color = LIGHT_COLOR_GREEN

/obj/item/clothing/suit/space/hardsuit/syndi/elite/vahlen
	name = "elite Vahlen operative RIG"
	icon_state = "vahlenop_rig"
	//item_state = "vahlenop_rig"
	hardsuit_type = "vahlenop"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/vahlen

// Optical military
/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/optical
	name = "experimental elite helmet"
	icon_state = "optical_helm"
	//item_state = "optical_helm"
	hardsuit_type = "optical"
	desc = "Strange looking, smoothly contoured helmet. It looks a bit blurry."
	armor = list(MELEE = 35, BULLET = 60, LASER = 60, ENERGY = 50, BOMB = 90, BIO = 100, RAD = 70, FIRE = 100, ACID = 100, WOUND = 25, ELECTRIC = 100)
	var/hit_reflect_chance = 50

/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/optical/IsReflect(def_zone)
	if(!(def_zone in list(BODY_ZONE_HEAD, BODY_ZONE_PRECISE_MOUTH, BODY_ZONE_PRECISE_EYES))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return FALSE
	if (prob(hit_reflect_chance))
		return TRUE

/obj/item/clothing/suit/space/hardsuit/syndi/elite/optical
	name = "experimental elite rig"
	icon_state = "optical_rig"
	//item_state = "optical_rig"
	hardsuit_type = "optical"
	desc = "Strange black hardsuit, with some devices attached to it. It looks a bit blurry. Property of Cybersun Industries."
	armor = list(MELEE = 35, BULLET = 60, LASER = 60, ENERGY = 50, BOMB = 90, BIO = 100, RAD = 70, FIRE = 100, ACID = 100, WOUND = 25, ELECTRIC = 100)
	actions_types = list(/datum/action/item_action/toggle_helmet, /datum/action/item_action/toggle_optical)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/optical
	var/cloak = FALSE
	var/hit_reflect_chance = 50

/datum/action/item_action/toggle_optical
	name = "Toggle Optical Disruptor"

/datum/action/item_action/toggle_optical/Trigger(mob/user)
	var/mob/living/carbon/human/H = user
	if(!istype(H))
		return
	var/obj/item/OH = H.get_item_by_slot(ITEM_SLOT_HEAD)
	if(!OH || !istype(OH, /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/optical))
		to_chat(H, "<span class='notice'Cloak need helmet.</span>")
		return
	var/obj/item/clothing/suit/space/hardsuit/syndi/elite/optical/O = target
	O.cloak(H)

/obj/item/clothing/suit/space/hardsuit/syndi/elite/optical/IsReflect(def_zone)
	if(!(def_zone in list(BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_PRECISE_L_HAND, BODY_ZONE_PRECISE_R_HAND, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG, BODY_ZONE_PRECISE_R_FOOT, BODY_ZONE_PRECISE_L_FOOT))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return FALSE
	if (prob(hit_reflect_chance))
		return TRUE

/obj/item/clothing/suit/space/hardsuit/syndi/elite/optical/AltClick(mob/user)
	var/mob/living/carbon/human/H = user
	if(!istype(H))
		return
	var/obj/item/OH = H.get_item_by_slot(ITEM_SLOT_HEAD)
	if(!OH || !istype(OH, /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/optical))
		to_chat(H, "<span class='notice'Cloak need helmet.</span>")
		return
	cloak(H)

/obj/item/clothing/suit/space/hardsuit/syndi/elite/optical/proc/cloak(mob/living/carbon/human/H, sl)
	if(cloak)
		cloak = FALSE
		return 1

	to_chat(H, "<span class='notice'>Optical disruptor activated.</span>")
	cloak = TRUE
	animate(H,alpha = 255, alpha = 85, time = 10)

	var/remain_cloaked = TRUE
	while(remain_cloaked)
		sleep(1 SECONDS)
		if(!cloak)
			remain_cloaked = 0
		if(H.stat)
			remain_cloaked = 0
		var/obj/item/OH = H.get_item_by_slot(ITEM_SLOT_HEAD)
		if(!OH || !istype(OH, /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/optical))
			remain_cloaked = 0
	H.invisibility = initial(H.invisibility)
	H.visible_message("<span class='warning'>[H] suddenly fades in.</span>",
	"<span class='notice'>Optical disruptor deactivated.</span>")
	cloak = FALSE

	animate(H,alpha = 85, alpha = 255, time = 10)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/optical/cs
	name = "elite Cybersun Industries RIG helmet"
	desc = "An elite version of the syndicate helmet, with improved armour and fireproofing."
	icon_state = "cselite_helm"
	//item_state = "cselite_helm"
	hardsuit_type = "cselite"

/obj/item/clothing/suit/space/hardsuit/syndi/elite/optical/cs
	name = "elite Cybersun Industries RIG"
	desc = "An elite version of the syndicate RIG, with improved armour and fire shielding."
	icon_state = "cselite_rig"
	//item_state = "cselite_rig"
	hardsuit_type = "cselite"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/optical/cs


//////Medical Elite hardsuit//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/med
	name = "elite medical syndicate RIG helmet"
	desc = "An elite version of the syndicate helmet, with improved armour and fireproofing. This one has medical paint pattern."
	icon_state = "smedelite_helm"
	//item_state = "smedelite_helm"
	hardsuit_type = "smedelite"

/obj/item/clothing/suit/space/hardsuit/syndi/elite/med
	name = "elite medical syndicate RIG"
	desc = "An elite version of the syndicate RIG, with improved armour and fire shielding. This one has medical paint pattern."
	icon_state = "smedelite_rig"
	//item_state = "smedelite_rig"
	hardsuit_type = "smedelite"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/med


/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/med/cs
	name = "elite medical Cybersun Industries RIG helmet"
	desc = "An elite version of the syndicate helmet, with improved armour and fireproofing."
	icon_state = "cselite_med_helm"
	//item_state = "cselite_med_helm"
	hardsuit_type = "cselite_med"

/obj/item/clothing/suit/space/hardsuit/syndi/elite/med/cs
	name = "elite medical Cybersun Industries RIG"
	desc = "An elite version of the syndicate RIG, with improved armour and fire shielding."
	icon_state = "cselite_rig"
	//item_state = "cselite_rig"
	hardsuit_type = "cselite"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/med/cs


//////Bloody elite hardsuit//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/bloodred
	desc = "An elite version of the syndicate helmet, with improved armour and fireproofing. This one reminds deathsquad style."
	icon_state = "elite_bloodred_helm"
	//item_state = "elite_bloodred_helm"
	hardsuit_type = "elite_bloodred"

/obj/item/clothing/suit/space/hardsuit/syndi/elite/bloodred
	desc = "An elite version of the syndicate RIG, with improved armour and fire shielding. This one reminds deathsquad style."
	icon_state = "elite_bloodred_helm"
	//item_state = "elite_bloodred_helm"
	hardsuit_type = "elite_bloodred"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/bloodred


//////Strike team hardsuit//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/sbo
	name = "\improper Syndicate Black Ops RIG helmet"
	desc = "An elite version of the syndicate helmet, with improved armour and fireproofing. Classic black."
	armor = list(MELEE = 70, BULLET = 70, LASER = 50, ENERGY = 40, BOMB = 100, BIO = 100, RAD = 70, FIRE = 100, ACID = 100, WOUND = 30, ELECTRIC = 100)
	icon_state = "sbo_helm"
	//item_state = "sbo_helm"
	hardsuit_type = "sbo"
	light_range = 7

/obj/item/clothing/suit/space/hardsuit/syndi/elite/sbo
	name = "\improper Syndicate Black Ops syndicate RIG"
	desc = "An elite version of the syndicate RIG, with improved armour and fire shielding. Classic black."
	armor = list(MELEE = 70, BULLET = 70, LASER = 50, ENERGY = 40, BOMB = 100, BIO = 100, RAD = 70, FIRE = 100, ACID = 100, WOUND = 30, ELECTRIC = 100)
	icon_state = "sbo_rig"
	//item_state = "sbo_rig"
	hardsuit_type = "sbo"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/sbo

//////ComsOff hardsuit//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/sbo/commsoff
	name = "\improper Comms Officer elite syndicate RIG helmet"
	desc = "An elite version of the syndicate helmet, with improved armour and fireproofing. This one has contractor style."
	icon_state = "commsoff_helm"
	//item_state = "commsoff_helm"
	hardsuit_type = "commsoff"

/obj/item/clothing/suit/space/hardsuit/syndi/elite/sbo/commsoff
	name = "\improper Comms Officer elite syndicate RIG"
	desc = "An elite version of the syndicate RIG, with improved armour and fire shielding. This one has contractor style."
	icon_state = "commsoff_rig"
	//item_state = "commsoff_rig"
	hardsuit_type = "commsoff"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/sbo/commsoff


//////Military suit designes//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/military
	name = "military RIG helmet"
	desc = "An austere tactical helmet used by paramilitary groups and real soldiers alike across human space."
	icon_state = "military_helm"
	//item_state = "military_helm"
	hardsuit_type = "military"
	armor = list(MELEE = 45, BULLET = 60, LASER = 40, ENERGY = 35, BOMB = 60, BIO = 100, RAD = 70, FIRE = 75, ACID = 75, WOUND = 25, ELECTRIC = 100)
	light_range = 7
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE


/obj/item/clothing/suit/space/hardsuit/syndi/military
	name = "military RIG"
	desc = "An austere RIG used by paramilitary groups and real soldiers alike across human space."
	icon_state = "military_rig"
	//item_state = "military_rig"
	hardsuit_type = "military"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/military
	armor = list(MELEE = 45, BULLET = 60, LASER = 40, ENERGY = 25, BOMB = 60, BIO = 100, RAD = 70, FIRE = 75, ACID = 75, WOUND = 25, ELECTRIC = 100)
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	combat_slowdown = 0.3
	lightweight = 1

//////Emergency Response Team suits//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert
	name = "elite emergency response team RIG helmet (operative)"
	desc = "Advanced helmet issued to operative of emergency response team Gamma."
	icon_state = "nt_combat_helm"
	//item_state = "nt_combat_helm"
	hardsuit_type = "nt_combat"
	armor = list(MELEE = 50, BULLET = 60, LASER = 50, ENERGY = 50, BOMB = 60, BIO = 100, RAD = 100, FIRE = 75, ACID = 75, WOUND = 25, ELECTRIC = 100)
	strip_delay = 130
	light_range = 7
	light_color = LIGHT_COLOR_DEFAULT
	toggled_for_heat_protecting = FALSE

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert
	name = "elite emergency response team RIG (operative)"
	desc = "Advanced RIG issued to operative of emergency response team Gamma."
	icon_state = "nt_combat_rig"
	//item_state = "nt_combat_rig"
	hardsuit_type = "nt_combat"
	armor = list(MELEE = 50, BULLET = 60, LASER = 50, ENERGY = 40, BOMB = 60, BIO = 100, RAD = 100, FIRE = 75, ACID = 75, WOUND = 25, ELECTRIC = 100)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert
	jetpack = /obj/item/tank/jetpack/suit
	lightweight = 0
	toggled_for_heat_protecting = FALSE

//////Security//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/sec
	name = "elite emergency response team hardsuit helmet (security)"
	icon_state = "ert_security_helm"
	//item_state = "ert_security_helm"
	hardsuit_type = "ert_security"
	desc = "Advanced helmet issued to security specialist of emergency response team Gamma."

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/sec/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		var/datum/atom_hud/SHUD = GLOB.huds[DATA_HUD_SECURITY_BASIC]
		SHUD.show_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/sec/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/SHUD = GLOB.huds[DATA_HUD_SECURITY_BASIC]
		SHUD.hide_from(user)

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/sec
	name = "elite emergency response team RIG (security)"
	icon_state = "ert_security_rig"
	//item_state = "ert_security_rig"
	hardsuit_type = "ert_security"
	desc = "Advanced RIG issued to security specialist of emergency response team Gamma."
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/sec

//////Commander//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/com
	name = "elite emergency response team RIG helmet (squad leader)"
	icon_state = "ert_commander_helm"
	//item_state = "ert_commander_helm"
	hardsuit_type = "ert_commander"
	desc = "Advanced helmet issued to officer of emergency response team Gamma."
	armor = list(MELEE = 65, BULLET = 65, LASER = 70, ENERGY = 70, BOMB = 100, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 25, ELECTRIC = 100)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	var/hit_reflect_chance = 40

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/com/examine(mob/user)
	. = ..()
	if(user.mind && user.mind.has_antag_datum(/datum/antagonist/ert))
		. += "Engraved on the back: \
			In this particular shitshow you have to be armed to enforce your authority. \
			But you're not required to use your weapon under any circumstances."

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/com/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		var/datum/atom_hud/SHUD = GLOB.huds[DATA_HUD_SECURITY_MEDICAL]
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		SHUD.show_to(user)
		DHUD.show_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/com/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/SHUD = GLOB.huds[DATA_HUD_SECURITY_MEDICAL]
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		SHUD.hide_from(user)
		DHUD.hide_from(user)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/com/Initialize()
	. = ..()
	AddComponent(/datum/component/anti_magic, antimagic_flags = MAGIC_RESISTANCE_MIND, inventory_flags = ITEM_SLOT_OCLOTHING)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/com/IsReflect(def_zone)
	if(!(def_zone in list(BODY_ZONE_HEAD, BODY_ZONE_PRECISE_MOUTH, BODY_ZONE_PRECISE_EYES))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return FALSE
	if (prob(hit_reflect_chance))
		return TRUE

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/com
	name = "elite emergency response team RIG (squad leader)"
	desc = "Advanced RIG issued to officer of emergency response team Gamma. Made from superior materials, one of the latest in the modern combat rigs line."
	armor = list(MELEE = 65, BULLET = 65, LASER = 70, ENERGY = 60, BOMB = 100, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 25, ELECTRIC = 100)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	icon_state = "ert_commander_rig"
	//item_state = "ert_commander_rig"
	hardsuit_type = "ert_commander"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/com
	var/hit_reflect_chance = 40
	eva_slowdown = 0.7

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/com/Initialize()
	. = ..()
	AddComponent(/datum/component/anti_magic, antimagic_flags = MAGIC_RESISTANCE|MAGIC_RESISTANCE_HOLY, inventory_flags = ITEM_SLOT_OCLOTHING)

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/com/IsReflect(def_zone)
	if(!(def_zone in list(BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return FALSE
	if (prob(hit_reflect_chance))
		return TRUE


//////Deathsquad//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/deathsquad
	name = "elite emergency response team RIG helmet (blackops)"
	desc = "Advanced helmet issued to black ops team operator."
	icon_state = "nt_deathsquad_helm"
	//item_state = "nt_deathsquad_helm"
	hardsuit_type = "nt_deathsquad"
	var/hit_reflect_chance = 50
	light_color = LIGHT_COLOR_LIGHT_CYAN

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/deathsquad/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		var/datum/atom_hud/SHUD = GLOB.huds[DATA_HUD_SECURITY_MEDICAL]
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		SHUD.show_to(user)
		DHUD.show_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/deathsquad/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/SHUD = GLOB.huds[DATA_HUD_SECURITY_MEDICAL]
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		SHUD.hide_from(user)
		DHUD.hide_from(user)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/deathsquad/Initialize()
	. = ..()
	AddComponent(/datum/component/anti_magic, antimagic_flags = MAGIC_RESISTANCE_MIND, inventory_flags = ITEM_SLOT_OCLOTHING)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/deathsquad/IsReflect(def_zone)
	if(!(def_zone in list(BODY_ZONE_HEAD, BODY_ZONE_PRECISE_MOUTH, BODY_ZONE_PRECISE_EYES))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return FALSE
	if (prob(hit_reflect_chance))
		return TRUE

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/deathsquad
	name = "elite emergency response team RIG (blackops)"
	desc = "Advanced RIG issued to black ops team operator. Made from superior materials, one of the latest in the modern combat rigs line."
	icon_state = "nt_deathsquad_rig"
	//item_state = "nt_deathsquad_rig"
	hardsuit_type = "nt_deathsquad"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/deathsquad
	var/hit_reflect_chance = 50
	combat_slowdown = 0.2

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/deathsquad/Initialize()
	. = ..()
	AddComponent(/datum/component/anti_magic, antimagic_flags = MAGIC_RESISTANCE|MAGIC_RESISTANCE_HOLY, inventory_flags = ITEM_SLOT_OCLOTHING)

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/deathsquad/IsReflect(def_zone)
	if(!(def_zone in list(BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return FALSE
	if (prob(hit_reflect_chance))
		return TRUE


//////Engineer//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/engi
	name = "elite emergency response team RIG helmet (field engineer)"
	icon_state = "ert_engineer_helm"
	//item_state = "ert_engineer_helm"
	hardsuit_type = "ert_engineer"
	armor = list(MELEE = 55, BULLET = 60, LASER = 50, ENERGY = 50, BOMB = 60, BIO = 100, RAD = 100, FIRE = 100, ACID = 75, WOUND = 25, ELECTRIC = 100)
	resistance_flags = FIRE_PROOF

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/engi/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		DHUD.show_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/engi/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		DHUD.hide_from(user)

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/engi
	name = "elite emergency response team RIG (field engineer)"
	icon_state = "ert_engineer_rig"
	//item_state = "ert_engineer_rig"
	hardsuit_type = "ert_engineer"
	armor = list(MELEE = 55, BULLET = 60, LASER = 50, ENERGY = 40, BOMB = 60, BIO = 100, RAD = 100, FIRE = 100, ACID = 75, WOUND = 25, ELECTRIC = 100)
	resistance_flags = FIRE_PROOF
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/engi


//////Medic//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/med
	name = "elite emergency response team RIG helmet (field medic)"
	icon_state = "ert_medical_helm"
	//item_state = "ert_medical_helm"
	hardsuit_type = "ert_medical"
	armor = list(MELEE = 45, BULLET = 60, LASER = 50, ENERGY = 50, BOMB = 60, BIO = 100, RAD = 100, FIRE = 75, ACID = 100, WOUND = 25, ELECTRIC = 100)
	resistance_flags = ACID_PROOF
	clothing_flags = THICKMATERIAL | SCAN_REAGENTS | HEADINTERNALS

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/med/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		var/datum/atom_hud/MHUD = GLOB.huds[DATA_HUD_MEDICAL_ADVANCED]
		DHUD.show_to(user)
		MHUD.show_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/med/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		var/datum/atom_hud/MHUD = GLOB.huds[DATA_HUD_MEDICAL_ADVANCED]
		DHUD.hide_from(user)
		MHUD.hide_from(user)

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/med
	name = "elite emergency response team RIG (field medic)"
	icon_state = "ert_medical_rig"
	//item_state = "ert_medical_rig"
	hardsuit_type = "ert_medical"
	armor = list(MELEE = 45, BULLET = 60, LASER = 50, ENERGY = 40, BOMB = 60, BIO = 100, RAD = 100, FIRE = 75, ACID = 100, WOUND = 25, ELECTRIC = 100)
	resistance_flags = ACID_PROOF
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/med


//////Paradimentional//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/paradimentional
	name = "elite emergency response team RIG helmet (paradimentional specialist)"
	icon_state = "ert_paradimentional_helm"
	//item_state = "ert_paradimentional_helm"
	hardsuit_type = "ert_paradimentional"
	armor = list(MELEE = 60, BULLET = 60, LASER = 50, ENERGY = 50, BOMB = 80, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 25, ELECTRIC = 100)
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/paradimentional/Initialize()
	. = ..()
	AddComponent(/datum/component/anti_magic, antimagic_flags = MAGIC_RESISTANCE_MIND, inventory_flags = ITEM_SLOT_OCLOTHING)

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/paradimentional
	name = "elite emergency response team RIG (paradimentional specialist)"
	armor = list(MELEE = 60, BULLET = 60, LASER = 50, ENERGY = 40, BOMB = 80, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 25, ELECTRIC = 100)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	icon_state = "ert_paradimentional_rig"
	//item_state = "ert_paradimentional_rig"
	hardsuit_type = "ert_paradimentional"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/paradimentional

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/paradimentional/Initialize()
	. = ..()
	AddComponent(/datum/component/anti_magic, antimagic_flags = MAGIC_RESISTANCE|MAGIC_RESISTANCE_HOLY, inventory_flags = ITEM_SLOT_OCLOTHING)


//////Specialists//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/jani
	name = "elite emergency response team RIG helmet (field janitor)"
	icon_state = "ert_janitor_helm"
	//item_state = "ert_janitor_helm"
	hardsuit_type = "ert_janitor"

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/jani
	name = "elite emergency response team RIG (field janitor)"
	icon_state = "ert_janitor_rig"
	//item_state = "ert_janitor_rig"
	hardsuit_type = "ert_janitor"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/jani

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/clown
	name = "elite emergency response team RIG helmet (honksquad operative)"
	icon_state = "ert_clown_helm"
	//item_state = "ert_clown_helm"
	hardsuit_type = "ert_clown"

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/clown
	name = "elite emergency response team RIG (honksquad operative)"
	icon_state = "ert_clown_rig"
	//item_state = "ert_clown_rig"
	hardsuit_type = "ert_clown"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/clown