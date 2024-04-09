////Sneakers////
/obj/item/clothing/shoes/sneakers

/obj/item/clothing/shoes/sneakers/brown
	greyscale_colors = "#592d01#ffffff"

/obj/item/clothing/shoes/sneakers/black
	greyscale_colors = "#1B1B1B#ffffff"

/obj/item/clothing/shoes/sneakers/orange
	greyscale_colors = "#ef8100#ffffff"

/datum/greyscale_config/sneakers
	name = "Sneakers"
	icon_file = 'modular_dripstation/icons/obj/clothing/shoes.dmi'

/datum/greyscale_config/sneakers_worn
	name = "Worn Sneakers"
	icon_file = 'modular_dripstation/icons/mob/clothing/shoes.dmi'

////Combat////
/obj/item/clothing/shoes/combat
	icon_state = "combat"
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'

/obj/item/clothing/shoes/combat/noble
	name = "noble boots"
	desc = "The boots are economically designed to balance function and comfort, so that you can step on peasants without having to worry about blisters. The leather also resists unwanted blood stains."
	icon_state = "noble"

/obj/item/clothing/shoes/xeno_wraps/jackboots/combat
	name = "combat footwraps"
	desc = "Tactical footwraps that make your feet feel snug and secure, while still being breathable and light."
	icon_state = "footwraps_c"
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'
	strip_delay = 2.5 SECONDS // Half time to take off
	equip_delay_other = 2.5 SECONDS // Half time
	armor = list(MELEE = 15, BULLET = 15, LASER = 15, ENERGY = 15, BOMB = 25, BIO = 30, RAD = 0, FIRE = 35, ACID = 20, ELECTRIC = 0)

////Jackboots////
/obj/item/clothing/shoes/jackboots
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'

/obj/item/clothing/shoes/bhop
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'

/obj/item/clothing/shoes/workboots
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'

/obj/item/clothing/shoes/workboots/mining
	custom_premium_price = 80
	icon = 'icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'icons/mob/clothing/feet/feet.dmi'

/obj/item/clothing/shoes/workboots/cargo
	name = "cargo boots"
	desc = "Steel-toed Nanotrasen-issue Cargo lace-up work boots for operating in hazardous environments. Electrically insulated and very good at keeping toes uncrushed."
	icon_state = "cargoboots"
	clothing_flags = NOSLIP_ICE
	resistance_flags = FIRE_PROOF
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'
	custom_premium_price = 80

/obj/item/clothing/shoes/workboots/cargo/aerostatic
	name = "aerostatic boots"
	desc = "Steel-toed Nanotrasen-issue Cargo lace-up work boots for operating in hazardous environments. This ones perform more fashion, being pre-polished!"
	icon_state = "aerostatic"

/obj/item/clothing/shoes/galoshes
	slowdown = SHOES_SLOWDOWN+0.75
	clothing_flags = THICKMATERIAL|NOSLIP
	body_parts_covered = LEGS|FEET
	resistance_flags = ACID_PROOF
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 100, RAD = 80, FIRE = 40, ACID = 100, ELECTRIC = 100)

/obj/item/clothing/shoes/galoshes/general
	desc = "A pair of yellow rubber boots, designed to protect against biological contamination."
	name = "standart galoshes"
	slowdown = SHOES_SLOWDOWN+0.1
	clothing_flags = THICKMATERIAL
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'

/obj/item/clothing/shoes/galoshes/cyan
	desc = "A pair of cyan rubber boots, designed to protect against biological contamination."
	name = "cyan galoshes"
	icon_state = "galoshes_cyan"
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'
	slowdown = SHOES_SLOWDOWN+0.1
	clothing_flags = THICKMATERIAL|NOSLIP
	armor = list(MELEE = 20, BULLET = 0, LASER = 0, ENERGY = 30, BOMB = 0, BIO = 100, RAD = 80, FIRE = 40, ACID = 100, ELECTRIC = 100)

/obj/item/clothing/shoes/galoshes/white
	desc = "A pair of white rubber boots, designed to protect against biological contamination."
	name = "white galoshes"
	icon_state = "galoshes_white"
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'
	slowdown = SHOES_SLOWDOWN+0.1
	clothing_flags = THICKMATERIAL

/obj/item/clothing/shoes/galoshes/sec
	desc = "A pair of black rubber boots, designed to protect against biological contamination."
	name = "galoshes"
	icon_state = "galoshes_sec"
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'
	slowdown = SHOES_SLOWDOWN+0.1
	clothing_flags = THICKMATERIAL
	armor = list(MELEE = 10, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 100, RAD = 80, FIRE = 40, ACID = 100, ELECTRIC = 100)