/obj/item/boh_shell
	var/insertion_output = /obj/item/storage/backpack/holding
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/backpacks.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_righthand.dmi'

/obj/item/boh_shell/attackby(obj/item/I, mob/user, params)
	..()
	if(istype(I, /obj/item/assembly/signaler/anomaly))
		to_chat(user, "[src] roars to life as you insert the anomaly core!")
		new insertion_output(get_turf(src))
		qdel(src)
		qdel(I)

/obj/item/storage/backpack/holding
	slot_flags = ITEM_SLOT_BACK	// yogs, I love and I hate you, THE FUCK YOU WOULD PUT ON YOUR HEAD BIG FUCKING TECHNOLOGICAL DEVICE THAT INVERTS SPACE INTO YOUR FUCKING BAG, WHATS WRONG WITH YOU?
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/backpacks.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_righthand.dmi'

/obj/item/boh_shell/duffel
	name = "duffel bag of holding shell"
	desc = "An inert shell, it looks like you could activate it with an anomaly core."
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'
	icon_state = "inertduffel"
	item_state = "brokenpack"
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	insertion_output = /obj/item/storage/backpack/holding/duffel

/obj/item/storage/backpack/holding/duffel
	name = "duffel bag of holding"
	desc = "A duffel bag that opens into a localized pocket of bluespace."
	icon_state = "holdingduffel"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/backpacks.dmi'

/datum/design/duffel_holding
	name = "Duffel bag of Holding shell"
	desc = "A duffel bag that opens into a localized pocket of bluespace. Requires an anomaly core to function."
	id = "duffel_holding"
	build_type = PROTOLATHE
	materials = list(/datum/material/gold = 3000, /datum/material/diamond = 1500, /datum/material/uranium = 250, /datum/material/bluespace = 2000)
	build_path = /obj/item/boh_shell/duffel
	category = list("Bluespace Designs")
	dangerous_construction = TRUE
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE		

/obj/item/boh_shell/satchel
	name = "satchel of holding shell"
	desc = "An inert shell, it looks like you could activate it with an anomaly core."
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'
	icon_state = "inertsatchel"
	item_state = "brokenpack"
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	insertion_output = /obj/item/storage/backpack/holding/satchel	

/obj/item/storage/backpack/holding/satchel
	name = "satchel of holding"
	desc = "A satchel that opens into a localized pocket of bluespace."
	icon_state = "holdingsatchel"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/backpacks.dmi'

/datum/design/satchel_holding
	name = "Satchel of Holding shell"
	desc = "A duffel bag that opens into a localized pocket of bluespace. Requires an anomaly core to function."
	id = "satchel_holding"
	build_type = PROTOLATHE
	materials = list(/datum/material/gold = 3000, /datum/material/diamond = 1500, /datum/material/uranium = 250, /datum/material/bluespace = 2000)
	build_path = /obj/item/boh_shell/satchel
	category = list("Bluespace Designs")
	dangerous_construction = TRUE
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE		
