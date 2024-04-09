/obj/item/clothing/suit/bio_suit
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	icon_state = "hazmat_suit"
	slowdown = 0.33
	body_parts_covered = HEAD|CHEST|GROIN
	flags_inv = HIDEJUMPSUIT|HIDEHAIR|HIDEEARS
	dynamic_hair_suffix = ""

/obj/item/clothing/suit/bio_suit/general
	icon_state = "hazmat_suit_general"
    
/obj/item/clothing/suit/bio_suit/virology
	icon_state = "hazmat_virology"

/obj/item/clothing/suit/bio_suit/security
	icon_state = "hazmat_sec"

/obj/item/clothing/suit/bio_suit/janitor
	icon_state = "hazmat_janitor"

/obj/item/clothing/suit/bio_suit/scientist
	icon_state = "hazmat_scientist"

/obj/item/clothing/suit/bio_suit/cmo
	icon_state = "hazmat_cmo"

/obj/item/clothing/suit/bio_suit/cyan
	icon_state = "hazmat_cyan"

/obj/item/clothing/suit/bio_suit/white
	icon_state = "hazmat_white"

/obj/item/clothing/suit/bio_suit/plaguedoctorsuit
	icon = 'icons/obj/clothing/suits/suits.dmi'
	mob_overlay_icon = 'icons/mob/clothing/suit/suit.dmi'

/obj/item/clothing/suit/poncho
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/suits_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/suits_righthand.dmi'

/obj/item/clothing/suit/poncho/purple
	name = "purple poncho"
	desc = "A simple, comfortable cloak without sleeves. This one is purple."
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'		
	icon_state = "purpleponcho"
	item_state = "purpleponcho"

/obj/item/clothing/suit/poncho/blue
	name = "blue poncho"
	desc = "A simple, comfortable cloak without sleeves. This one is blue."
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'		
	icon_state = "blueponcho"
	item_state = "blueponcho"

/obj/item/clothing/suit/poncho/sec
	name = "security poncho"
	desc = "A simple, comfortable cloak without sleeves. This one is black and red, standard NanoTrasen Security colors."
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'	
	icon_state = "secponcho"
	item_state = "secponcho"	
	armor = list(MELEE = 30, BULLET = 30, LASER = 30, ENERGY = 10, BOMB = 25, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 15)
	allowed = list(/obj/item/gun/energy, /obj/item/melee/baton, /obj/item/restraints/handcuffs, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant)

/obj/item/clothing/suit/poncho/eng
	name = "engineering poncho"
	desc = "A simple, comfortable cloak without sleeves. This one is yellow and orange, standard Engineering colors."
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'	
	icon_state = "engiponcho"
	item_state = "engiponcho"
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 10, FIRE = 20, ACID = 40, WOUND = 0)
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant, /obj/item/t_scanner, /obj/item/radio, /obj/item/extinguisher/mini)

/obj/item/clothing/suit/poncho/med
	name = "medical poncho"
	desc = "A simple, comfortable cloak without sleeves. This one is white with green and blue tint, standard Medical colors."
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'	
	icon_state = "medponcho"
	item_state = "medponcho"
	allowed = list(/obj/item/stack/medical, /obj/item/dnainjector, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/autoinjector, /obj/item/healthanalyzer, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/pill, /obj/item/storage/pill_bottle, /obj/item/paper, /obj/item/soap, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant, /obj/item/hypospray)
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 35, RAD = 0, FIRE = 35, ACID = 35)

/obj/item/clothing/suit/poncho/sci
	name = "science poncho"
	desc = "A simple, comfortable cloak without sleeves. This one is white with purple trim, standard NanoTrasen Science colors."
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'	
	icon_state = "sciponcho"
	item_state = "sciponcho"
	allowed = list(/obj/item/analyzer, /obj/item/dnainjector, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/autoinjector, /obj/item/flashlight/pen, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/pill, /obj/item/storage/pill_bottle, /obj/item/paper, /obj/item/sensor_device, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant)
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 35, RAD = 0, FIRE = 35, ACID = 35)

/obj/item/clothing/suit/poncho/cargo
	name = "cargo poncho"
	desc = "A simple, comfortable cloak without sleeves. This one is tan and grey, the colors of Cargo."
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'	
	icon_state = "cargoponcho"
	item_state = "cargoponcho"
	allowed = list(/obj/item/clipboard, /obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter, /obj/item/radio)

/obj/item/clothing/suit/judgerobe
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'	
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	flags_inv = null

/obj/item/clothing/head/judge_wig
	name = "\improper judge wig"
	desc = "Judgement is here."
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'	
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	icon_state = "jwig"
	item_state = "pwig"

/obj/item/clothing/under/maid
	name = "maid costume"
	desc = "Maid in USSP."

/obj/item/clothing/suit/maiddress
	name = "maid dress"
	desc = "Classic maid dress for working woman."
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'	
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	icon_state = "maiddress"
	item_state = "maid"

/obj/item/clothing/suit/apron/maid
	name = "green apron"
	desc = "You can put it on your naked body!"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'	
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	icon_state = "apron_green"
	item_state = "maidapron"
	allowed = list(/obj/item/kitchen)

/obj/item/clothing/suit/apron/maid/red
	name = "red apron"
	icon_state = "apron_red"

/obj/item/clothing/suit/apron/maid/purple
	name = "purple apron"
	icon_state = "apron_purple"

/obj/item/clothing/suit/apron/maid/teal
	name = "teal apron"
	icon_state = "apron_teal"

/obj/item/clothing/suit/apron/maid/yellow
	name = "yellow apron"
	icon_state = "apron_yellow"