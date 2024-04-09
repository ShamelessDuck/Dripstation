/obj/item/clothing/shoes/magboots
	alternate_worn_layer = BELT_LAYER
	var/magpulse_name = "mag-pulse traction system"
	item_state = "magboots"
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/shoes_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/shoes_righthand.dmi'

/obj/item/clothing/shoes/magboots/attack_self(mob/user)
	if(magpulse)
		clothing_flags &= ~NOSLIP
		slowdown = SHOES_SLOWDOWN
	else
		clothing_flags |= NOSLIP
		slowdown = slowdown_active
	magpulse = !magpulse
	icon_state = "[magboot_state][magpulse]"
	to_chat(user, span_notice("You [magpulse ? "enable" : "disable"] the [magpulse_name]."))
	user.update_inv_shoes()	//so our mob-overlays update
	user.update_gravity(user.has_gravity())
	for(var/X in actions)
		var/datum/action/A = X
		A.build_all_button_icons()

/obj/item/clothing/shoes/magboots/security
	armor = list(MELEE = 15, BULLET = 10, LASER = 5, ENERGY = 10, BOMB = 15, BIO = 20, RAD = 0, FIRE = 20, ACID = 50)

/obj/item/clothing/shoes/magboots/security/advanced
	name = "SWAT magboots"
	desc = "High speed, no drag combat-edition magboots issued by Nanotrasen Black Ops for extravehicular missions."
	armor = list(MELEE = 40, BULLET = 30, LASER = 25, ENERGY = 25, BOMB = 50, BIO = 100, RAD = 30, FIRE = 90, ACID = 50, ELECTRIC = 100)
	icon_state = "advcmag0"
	magboot_state = "advcmag"
	slowdown_active = 0.5
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/shoes/magboots/security/advanced/attack_self(mob/user)
	. = ..()
	if(magpulse)
		clothing_flags &= ~NOSLIP | ~NOSLIP_ICE
	else
		clothing_flags |= NOSLIP | NOSLIP_ICE

/obj/item/clothing/shoes/magboots/security/advanced/synd
	name = "Syndicate Black Ops magboots"
	desc = "High speed, no drag combat-edition magboots issued by Syndicate Black Ops for extravehicular missions. DEFINITELY not stolen from a rival corporation."
	slowdown_active = 0.8
	icon_state = "advsyndiemag0"
	magboot_state = "advsyndiemag"

/obj/item/clothing/shoes/magboots/security/captain
	desc = "A relic predating magboots, these ornate greaves have retractable spikes in the soles to maintain grip."
	name = "captain's greaves"
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'	
	icon_state = "capboots0"
	magboot_state = "capboots"
	magpulse_name = "anchoring spikes"
	slowdown_active = 2	

/obj/item/clothing/shoes/magboots/syndie
	name = "suspecious magboots"
	slowdown_active = 1.5
	var/morphable = TRUE
	actions_types = list(/datum/action/item_action/adjust)

/obj/item/clothing/shoes/magboots/syndie/ui_action_click(mob/user)
	if(!istype(user) || user.incapacitated())
		return
	var/list/options = list()
	var/list/radial_display = list()
	for(var/obj/item/clothing/shoes/magboots/syndie/all_magboots as anything in typesof(/obj/item/clothing/shoes/magboots/syndie))
		if(!initial(all_magboots.morphable))
			continue
		options[initial(all_magboots.name)] = all_magboots
		var/datum/radial_menu_choice/option = new
		option.image = image(icon = initial(all_magboots.icon), icon_state = initial(all_magboots.icon_state))
		option.info = "[initial(all_magboots.name)] - [span_boldnotice(initial(all_magboots.desc))]"
		radial_display[initial(all_magboots.name)] = option

	var/choice = show_radial_menu(user, user, radial_display)
	var/obj/item/clothing/shoes/magboots/syndie/chosen_magboots = options[choice]
	if(QDELETED(src) || QDELETED(user))
		return FALSE
	if(!chosen_magboots)
		to_chat(user, span_announce("You choose not to choose."))
		return
	if(src && chosen_magboots && !user.incapacitated() && in_range(user,src))
		name = chosen_magboots.name
		desc = chosen_magboots.desc
		item_state = chosen_magboots.item_state
		icon_state = chosen_magboots.icon_state
		user.update_inv_belt()
		for(var/X in actions)
			var/datum/action/A = X
			A.build_all_button_icons()
		to_chat(user, span_notice("Your webbing has now morphed into [chosen_magboots.name]!"))
		return TRUE

/obj/item/clothing/shoes/magboots/syndie/elite
	name = "elite magboots"
	icon_state = "gsyndiemag"

/obj/item/clothing/shoes/magboots/syndie/blred
	name = "blood-red magboots"
	icon_state = "brsyndiemag"

/obj/item/clothing/shoes/magboots/paramedic
	name = "paramedic magboots"
	desc = "Magnetic boots, often used during extravehicular activity to ensure the user remains safely attached to the vehicle. This ones painted in paramedic colors."
	item_state = "para_magboots"
	slowdown_active = 1.8

/obj/item/clothing/shoes/magboots/wizard
	name = "paramedic magboots"
	desc = "Magnetic boots, often used during extravehicular activity to ensure the user remains safely attached to the vehicle. This ones enchanted."
	item_state = "wizmag"
	slowdown_active = 1
