// ###### CMO ######
/obj/item/clothing/under/rank/chief_medical_officer
	icon_state = "cmo"
	icon = 'modular_dripstation/icons/obj/clothing/uniform/medical/cmo.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/medical/cmo.dmi'
	mutantrace_variation = MUTANTRACE_VARIATION	

/obj/item/clothing/under/rank/chief_medical_officer/skirt
	icon_state = "cmo_skirt"
	can_adjust = TRUE

/obj/item/clothing/under/rank/chief_medical_officer/alt
	icon_state = "cmo_alt"
	can_adjust = TRUE
	mutantrace_variation = MUTANTRACE_VARIATION	

/obj/item/clothing/under/rank/chief_medical_officer/skirt/alt
	icon_state = "cmo_alt_skirt"
	can_adjust = TRUE

/obj/item/clothing/under/rank/chief_medical_officer/turtleneck
	icon_state = "cmoturtle"
	can_adjust = TRUE
	mutantrace_variation = NO_MUTANTRACE_VARIATION	

/obj/item/clothing/under/rank/chief_medical_officer/turtleneck/alt
	icon_state = "cmoturtle_blue"
	can_adjust = TRUE
	mutantrace_variation = NO_MUTANTRACE_VARIATION	

/obj/item/clothing/head/beret/cmo
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	icon_state = "beretcmowhite"

/obj/item/clothing/suit/hooded/wintercoat/medical/cmo
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'		
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'

/obj/item/clothing/head/hooded/winterhood/medical/cmo
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'

/obj/item/clothing/suit/hooded/wintercoat/medical/cmo/long
	icon_state = "coatcmo_alt"
	hoodtype = /obj/item/clothing/head/hooded/winterhood/medical/cmo/long

/obj/item/clothing/head/hooded/winterhood/medical/cmo/long
	icon_state = "winterhood_cmo_alt"

/obj/item/clothing/suit/hooded/wintercoat/medical/cmo/alt
	icon_state = "coatalt_cmo"
	hoodtype = /obj/item/clothing/head/hooded/winterhood/medical/cmo/alt

/obj/item/clothing/head/hooded/winterhood/medical/cmo/alt
	icon_state = "winterhoodalt_cmo"

// ###### PARAMED ######
/obj/item/clothing/under/rank/medical/paramedic
	can_adjust = TRUE
	icon = 'modular_dripstation/icons/obj/clothing/uniform/medical/paramedic.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/medical/paramedic.dmi'
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/medical/paramedic/skirt
	name = "paramedic jumpskirt"
	desc = "It's made of a special fiber that provides minor protection against biohazards. It has a dark blue cross on the chest denoting that the wearer is a trained paramedic."
	icon_state = "paramed_skirt"
	mutantrace_variation = NO_MUTANTRACE_VARIATION
	fitted = FEMALE_UNIFORM_TOP

/obj/item/clothing/under/rank/medical/paramedic/emt
	desc = "It's made of a special fiber that provides minor protection against biohazards. It has a dark blue cross on the chest denoting that the wearer is a trained emergency medical technician."
	name = "em technician jumpsuit"
	icon_state = "emt"

/obj/item/clothing/under/rank/medical/paramedic/emt/skirt
	name = "em technician jumpskirt"
	desc = "It's made of a special fiber that provides minor protection against biohazards. It has a dark blue cross on the chest denoting that the wearer is a trained emergency medical technician."
	icon_state = "emt_skirt"
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/medical/paramedic/recovery
	name = "emergency medical technician's recovery undersuit"
	desc = "A verstile blue and white uniform honored to hard working recovery medics in hazardous environments. It has minor protection against biohazards."
	mutantrace_variation = MUTANTRACE_VARIATION

/obj/machinery/vending/wardrobe/para_wardrobe
	name = "\improper ParaDrobe"
	desc = "A vending machine rumoured to be capable of dispensing clothing for paramedical personnel."
	product_ads = "Make those blood stains look fashionable!!"
	vend_reply = "Thank you for using the ParaDrobe!"
	default_price = 50
	icon_vend = "medidrobe-vend"
	icon_deny = "medidrobe-deny"
	req_access = list(ACCESS_PARAMEDIC)
	products = list(/obj/item/clothing/under/rank/medical/paramedic = 2,
					/obj/item/clothing/under/rank/medical/paramedic/skirt = 2,
					/obj/item/clothing/under/rank/medical/paramedic/emt = 1,
					/obj/item/clothing/under/rank/medical/paramedic/emt/skirt = 1,
					/obj/item/clothing/under/rank/medical/paramedic/recovery = 1,
					/obj/item/clothing/suit/toggle/labcoat/emt/paramedic = 2,
					/obj/item/clothing/suit/toggle/labcoat/emt = 1,
					/obj/item/clothing/suit/toggle/labcoat/emt/green = 1,
					/obj/item/clothing/suit/toggle/emt_vest = 2,
					/obj/item/clothing/suit/toggle/emt_vest/jacket = 2,
					/obj/item/clothing/suit/hooded/wintercoat/medical/paramedic = 2,
					/obj/item/clothing/head/beret/emt = 1,
					/obj/item/clothing/head/beret/emt/green = 1,
					/obj/item/clothing/head/beret/emt/paramed = 1,
					/obj/item/clothing/head/soft/emt = 1,
					/obj/item/clothing/head/soft/emt/green = 1,
					/obj/item/clothing/head/soft/emt/paramed = 1,
					/obj/item/clothing/gloves/color/latex = 2,
					/obj/item/clothing/shoes/sneakers/black = 2,
					/obj/item/clothing/shoes/xeno_wraps/medical = 2,
					/obj/item/storage/backpack/emt = 1,
					/obj/item/storage/backpack/satchel/emt = 1,
					/obj/item/storage/backpack/duffelbag/emt = 1)
	refill_canister = /obj/item/vending_refill/wardrobe/medi_wardrobe
	payment_department = ACCOUNT_MED

// ###### Genecist ######
/obj/item/clothing/under/rank/geneticist
	icon = 'modular_dripstation/icons/obj/clothing/uniform/medical/genetics.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/medical/genetics.dmi'

/obj/item/clothing/under/rank/geneticist/skirt
	can_adjust = TRUE

// ###### Virology ######
/obj/item/clothing/under/rank/virologist
	icon = 'modular_dripstation/icons/obj/clothing/uniform/medical/virology.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/medical/virology.dmi'

/obj/item/clothing/under/rank/virologist/skirt
	can_adjust = TRUE
	icon_state = "virology_skirt"


// ###### Chemistry ######
/obj/item/clothing/under/rank/chemist
	icon_state = "chemistry"
	icon = 'modular_dripstation/icons/obj/clothing/uniform/medical/chemistry.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/medical/chemistry.dmi'

/obj/item/clothing/under/rank/chemist/skirt
	icon_state = "chem_skirt"
	can_adjust = TRUE

/obj/item/clothing/under/rank/chemist/pharma
	desc = "It's made of a special fiber that gives special protection against biohazards. It has a pharmacist rank stripe on it."
	name = "pharmacist's jumpsuit"
	icon_state = "pharma"

/obj/item/clothing/under/rank/chemist/utility
	desc = "It's made of a special fiber that gives special protection against biohazards."
	name = "chemical protection undersuit"
	icon_state = "chem_protect"

/obj/machinery/vending/wardrobe/chem_wardrobe
	products = list(/obj/item/clothing/under/rank/chemist = 2,
					/obj/item/clothing/under/rank/chemist/skirt = 2,
					/obj/item/clothing/under/rank/chemist/pharma = 1,
					/obj/item/clothing/under/rank/chemist/utility = 1,
					/obj/item/clothing/suit/toggle/labcoat/chemist = 2,
					/obj/item/clothing/suit/hooded/wintercoat/medical/chemistry = 2,
					/obj/item/clothing/head/beret/chem = 2,
					/obj/item/clothing/shoes/sneakers/white = 2,
					/obj/item/clothing/shoes/xeno_wraps/medical = 2,
					/obj/item/clothing/gloves/color/latex = 2,
					/obj/item/storage/backpack/chemistry = 2,
					/obj/item/storage/backpack/satchel/chem = 2,
					/obj/item/storage/bag/chemistry = 4)

// ###### MD ######
/obj/item/clothing/under/rank/nursesuit

/obj/item/clothing/under/rank/medical
	icon = 'modular_dripstation/icons/obj/clothing/uniform/medical/medical.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/medical/medical.dmi'

/obj/item/clothing/under/rank/medical/blue
	icon = 'icons/obj/clothing/uniforms.dmi'
	mob_overlay_icon = 'icons/mob/clothing/uniform/uniform.dmi'

/obj/item/clothing/under/rank/medical/green
	icon = 'icons/obj/clothing/uniforms.dmi'
	mob_overlay_icon = 'icons/mob/clothing/uniform/uniform.dmi'

/obj/item/clothing/under/rank/medical/purple
	icon = 'icons/obj/clothing/uniforms.dmi'
	mob_overlay_icon = 'icons/mob/clothing/uniform/uniform.dmi'

/obj/item/clothing/under/rank/medical/black
	name = "medical scrubs"
	desc = "It's made of a special fiber that provides minor protection against biohazards. This one is in black."
	icon_state = "scrubsblack"
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/medical/scrcmo
	name = "medical scrubs"
	desc = "It's made of a special fiber that provides minor protection against biohazards. This one is in CMO colors."
	icon_state = "scrubscmo"
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/medical/skirt
	can_adjust = TRUE

/obj/item/clothing/under/rank/psych
	icon = 'icons/obj/clothing/uniforms.dmi'
	mob_overlay_icon = 'icons/mob/clothing/uniform/uniform.dmi'

/obj/machinery/vending/wardrobe/medi_wardrobe
	extra_price = 150
	products = list(/obj/item/clothing/accessory/pocketprotector = 4,
					/obj/item/storage/backpack/duffelbag/med = 4,
					/obj/item/storage/backpack/medic = 4,
					/obj/item/storage/backpack/satchel/med = 4,
					/obj/item/clothing/head/beret/med = 4,
					/obj/item/clothing/suit/hooded/wintercoat/medical = 4,
					/obj/item/clothing/under/rank/nursesuit = 4,
					/obj/item/clothing/head/nursehat = 4,
					/obj/item/clothing/under/yogs/nursedress = 4,
					/obj/item/clothing/under/rank/medical/skirt= 4,
					/obj/item/clothing/under/rank/medical/blue = 4,
					/obj/item/clothing/under/rank/medical/green = 4,
					/obj/item/clothing/under/rank/medical/purple = 4,
					/obj/item/clothing/under/rank/medical = 4,
					/obj/item/clothing/suit/toggle/labcoat/md = 4,
					/obj/item/clothing/shoes/sneakers/white = 4,
					/obj/item/clothing/shoes/xeno_wraps/medical = 4,
					/obj/item/clothing/gloves/color/latex = 4,
					/obj/item/clothing/suit/apron/surgical = 4,
					/obj/item/clothing/mask/surgical = 4,
					/obj/item/clothing/accessory/armband/medblue = 2)
	premium = list(/obj/item/clothing/gloves/color/latex/nitrile = 2)