/obj/item/module
	name = "module"
	desc = "module"
	icon = 'modular_dripstation/icons/obj/rig_modules.dmi'
	icon_state = "module"
	var/complexity = 1	//how complex module is

/obj/item/module/examine(mob/user)
	. = ..()
	. += "You can insert it into rig. It has [complexity] complexity."

/obj/item/module/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	if(!proximity_flag)
		return ..()
	if(istype(target,/obj/item/clothing/suit/space/hardsuit/syndi))
		var/obj/item/clothing/suit/space/hardsuit/syndi/rig = target
		if(rig.complexity - complexity < 0)
			return
		rig.complexity -= complexity
		apply_effect(rig)
		visible_message("[user] inserts [src] into [rig]")
		qdel(src)
		return
	return ..()

/obj/item/module/proc/apply_effect()

/obj/item/module/shield
	name = "advanced shield module"
	desc = "Insert module into rig to give it a rechargeable shield."
	icon_state = "shield"
	var/max_charges = 3 //How many charges total the shielding has
	var/recharge_delay = 20 SECONDS //How long after we've been shot before we can start recharging. 20 seconds here
	var/recharge_delay_after_charge = 1 SECONDS //How long after we've been recharged before we can start recharging. 1 second here
	var/recharge_rate = 1 //How quickly the shield recharges once it starts charging
	var/starting_charge = 0	//if null starts with max_charges
	var/shield_state = "shield-old"

/obj/item/module/shield/apply_effect(atom/target)
	target.AddComponent(/datum/component/shielded,'modular_dripstation/icons/effects/shield.dmi', shield_state, recharge_delay, ITEM_SLOT_OCLOTHING, charge_i_d = recharge_delay_after_charge, max_charge = max_charges, starting_charges = starting_charge, recharge_rating = recharge_rate, sparks_enable = TRUE)

/obj/item/module/shield/syndicate
	name = "syndicate shield module"
	max_charges = 1
	recharge_delay = 10 SECONDS
	shield_state = "shield-red"
	icon_state = "shield-syndie"

/obj/item/module/shield/nt
	name = "nanotrasen shield module"
	recharge_delay_after_charge = 10 SECONDS
	recharge_delay = 30 SECONDS
	icon_state = "shield-nt"

/obj/item/module/shield/wizard
	name = "magic shield rune"
	max_charges = 3
	starting_charge = 1
	recharge_rate = 0
	recharge_delay = 0 SECONDS
	shield_state = "mageshield"