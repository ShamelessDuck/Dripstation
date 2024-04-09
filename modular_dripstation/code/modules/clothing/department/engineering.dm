// ###### hazard vests ######
/obj/item/clothing/suit/hazardvest
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	//lefthand_file = 'modular_dripstation/icons/mob/inhands/suits_lefthand.dmi'
	//righthand_file = 'modular_dripstation/icons/mob/inhands/suits_righthand.dmi'

/obj/item/clothing/suit/hazardvest/white
	name = "white hazard vest"
	desc = "A high-visibility vest used in work zones. This one bears the symbol of a disaster relief team!"
	icon_state = "hazard_w"	
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 30, FIRE = 40, ACID = 10)

/obj/item/clothing/suit/hazardvest/green
	name = "green hazard vest"
	desc = "A high-visibility vest used by emergency responders."
	icon_state = "hazard_g"

/obj/item/clothing/suit/hazardvest/blue
	name = "blue hazard vest"
	desc = "A high-visibility vest used in work zones. This one is blue!"
	icon_state = "hazard_b"

// ###### Engineer ######
/obj/item/clothing/under/rank/engineer
	icon = 'modular_dripstation/icons/obj/clothing/uniform/engineering/engineer.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/engineering/engineer.dmi'

/obj/item/clothing/under/rank/engineer/skirt
	can_adjust = TRUE

/obj/item/clothing/under/rank/engineer/gorka
	name = "engineer`s gorka"
	desc = "Gorka undersuit for hard work."
	icon_state = "engine_gorka"
	can_adjust = FALSE
	mutantrace_variation = NO_MUTANTRACE_VARIATION

// ###### Atmostech ######
/obj/item/clothing/under/rank/atmospheric_technician
	icon = 'modular_dripstation/icons/obj/clothing/uniform/engineering/atmos.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/engineering/atmos.dmi'

/obj/item/clothing/under/rank/atmospheric_technician/skirt
	can_adjust = TRUE

/obj/item/clothing/under/rank/atmospheric_technician/gorka
	name = "atmospheric technician`s gorka"
	desc = "Gorka undersuit for hard work."
	icon_state = "atmos_gorka"
	can_adjust = FALSE
	mutantrace_variation = NO_MUTANTRACE_VARIATION

// ######  Signaltech ######
/obj/item/clothing/under/yogs/rank/network_admin
	icon = 'modular_dripstation/icons/obj/clothing/uniform/engineering/signaltech.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/engineering/signaltech.dmi'

/obj/item/clothing/under/rank/network_admin/skirt
	can_adjust = TRUE

/obj/item/clothing/under/rank/network_admin/gorka
	name = "network admin`s gorka"
	desc = "Gorka undersuit for hard work."
	icon_state = "signaltech_gorka"
	can_adjust = FALSE
	mutantrace_variation = NO_MUTANTRACE_VARIATION
	icon = 'modular_dripstation/icons/obj/clothing/uniform/engineering/signaltech.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/engineering/signaltech.dmi'

/obj/item/clothing/suit/hooded/wintercoat/engineering/tcomms
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'

// ###### Chief Engineer ######
/obj/item/clothing/under/rank/chief_engineer
	icon = 'modular_dripstation/icons/obj/clothing/uniform/engineering/chief.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/engineering/chief.dmi'

/obj/item/clothing/under/rank/chief_engineer/skirt
	can_adjust = TRUE

/obj/item/clothing/under/rank/chief_engineer/alt
	icon_state = "chiefengineer_alt"

/obj/item/clothing/under/rank/chief_engineer/gorka
	name = "chief`s gorka"
	desc = "Gorka undersuit for hard work."
	icon_state = "chiefengineer_gorka"
	can_adjust = FALSE
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/chief_engineer/formal
	name = "chief engineer's official uniform"
	desc = "It's an official version of high visibility uniform given to the finest engineers. It has minor radiation shielding."
	name = "network admin`s gorka"
	desc = "Gorka undersuit for hard work."
	icon_state = "chiefengineer_formal"

/obj/item/clothing/under/rank/chief_engineer/skirt/formal
	name = "chief engineer's official skirt"
	desc = "It's an official version of high visibility skirt given to the finest engineers. It has minor radiation shielding."
	icon_state = "chiefengineer_formal"


////////Wardrobs/////////
/obj/machinery/vending/wardrobe/engi_wardrobe
	products = list(/obj/item/clothing/accessory/pocketprotector = 3,
					/obj/item/storage/backpack/duffelbag/engineering = 3,
					/obj/item/storage/backpack/industrial = 3,
					/obj/item/storage/backpack/satchel/eng = 3,
					/obj/item/clothing/suit/hooded/wintercoat/engineering = 3,
					/obj/item/clothing/under/rank/engineer = 3,
					/obj/item/clothing/under/rank/engineer/skirt = 3,
					/obj/item/clothing/under/rank/engineer/hazard = 3,
					/obj/item/clothing/under/rank/engineer/gorka = 3,
					/obj/item/clothing/suit/hazardvest = 3,
					/obj/item/clothing/shoes/workboots = 3,
					/obj/item/clothing/shoes/xeno_wraps/engineering = 3,
					/obj/item/clothing/head/beret/eng = 3,
					/obj/item/clothing/head/hardhat = 3,
					/obj/item/clothing/head/welding/demon = 1,
					/obj/item/clothing/head/welding/knight = 1,
					/obj/item/clothing/head/welding/engie = 1,
					/obj/item/clothing/head/hardhat/weldhat = 1)
	contraband = list(/obj/item/clothing/under/syndicate/tacticool/engineer = 1)


/obj/machinery/vending/wardrobe/atmos_wardrobe
	products = list(/obj/item/clothing/accessory/pocketprotector = 2,
					/obj/item/storage/backpack/duffelbag/engineering/atmos = 2,
					/obj/item/storage/backpack/satchel/atmos = 2,
					/obj/item/storage/backpack/industrial/atmos = 2,
					/obj/item/clothing/suit/hooded/wintercoat/engineering/atmos = 2,
					/obj/item/clothing/head/beret/atmos = 2,
					/obj/item/clothing/under/rank/atmospheric_technician = 2,
					/obj/item/clothing/under/rank/atmospheric_technician/skirt = 2,
					/obj/item/clothing/under/rank/atmospheric_technician/gorka = 2,
					/obj/item/clothing/shoes/workboots = 2)
	contraband = list(/obj/item/clothing/under/syndicate/tacticool/atmos = 1)

/obj/machinery/vending/wardrobe/sig_wardrobe
	products = list(/obj/item/storage/backpack/duffelbag/engineering/signal = 1,
					/obj/item/storage/backpack/industrial/signal = 1,
					/obj/item/storage/backpack/satchel/signal = 1,
					/obj/item/clothing/suit/hooded/wintercoat/engineering/tcomms = 1,
					/obj/item/clothing/under/yogs/rank/network_admin = 1,
					/obj/item/clothing/shoes/workboots = 1,
					/obj/item/clothing/under/yogs/rank/network_admin/skirt = 1,
					/obj/item/clothing/under/rank/network_admin/gorka = 1)
	contraband = list(/obj/item/clothing/under/syndicate/tacticool/sig = 1)