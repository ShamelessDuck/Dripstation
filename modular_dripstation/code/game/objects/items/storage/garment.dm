/obj/item/storage/bag/garment
	name = "garment bag"
	icon = 'modular_dripstation/icons/obj/storage/garment.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_righthand.dmi'			
	icon_state = "garment_bag"
	item_state = "garment_bag"
	desc = "A bag for storing extra clothes and gloves."
	slot_flags = NONE
	resistance_flags = FLAMMABLE

/obj/item/storage/bag/garment/captain
	name = "captain's garment bag"
	desc = "A bag for storing extra clothes and gloves. This one belongs to the captain."
	icon_state = "garment_bag_captain"

/obj/item/storage/bag/garment/hop
	name = "head of personnel's garment bag"
	desc = "A bag for storing extra clothes and gloves. This one belongs to the head of personnel."
	icon_state = "garment_bag_hop"

/obj/item/storage/bag/garment/hos
	name = "head of security's garment bag"
	desc = "A bag for storing extra clothes and gloves. This one belongs to the head of security."
	icon_state = "garment_bag_hos"

/obj/item/storage/bag/garment/warden
	name = "warden's garment bag"
	desc = "A bag for storing extra clothes and gloves. This one belongs to the warden."
	icon_state = "garment_bag_hos"

/obj/item/storage/bag/garment/physician
	name = "brig physician's garment bag"
	desc = "A bag for storing extra clothes and gloves. This one belongs to the brig physician."
	icon_state = "garment_bag_hos"

/obj/item/storage/bag/garment/research_director
	name = "research director's garment bag"
	desc = "A bag for storing extra clothes and gloves. This one belongs to the research director."
	icon_state = "garment_bag_rd"

/obj/item/storage/bag/garment/chief_medical
	name = "chief medical officer's garment bag"
	desc = "A bag for storing extra clothes and gloves. This one belongs to the chief medical officer."
	icon_state = "garment_bag_cmo"

/obj/item/storage/bag/garment/engineering_chief
	name = "chief engineer's garment bag"
	desc = "A bag for storing extra clothes and gloves. This one belongs to the chief engineer."
	icon_state = "garment_bag_ce"

/obj/item/storage/bag/garment/quartermaster
	name = "quartermaster's garment bag"
	desc = "A bag for storing extra clothes and gloves. This one belongs to the quartermaster."
	icon_state = "garment_bag_qm"


/obj/item/storage/bag/garment/Initialize(mapload)
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.display_numerical_stacking = FALSE
	STR.max_combined_w_class = 200
	STR.max_items = 21
	STR.insert_preposition = "in"
	STR.set_holdable(list(
		/obj/item/clothing,
	))

// 1. uniform
// 2. suits
// 3. neck
// 4. head
// 5. gloves

/obj/item/storage/bag/garment/captain/PopulateContents()
	new /obj/item/clothing/under/rank/captain(src)
	new /obj/item/clothing/under/rank/captain/skirt(src)
	new /obj/item/clothing/under/rank/captain/formal(src)
	new /obj/item/clothing/under/rank/captain/formal/skirt(src)
	new /obj/item/clothing/under/yogs/victoriouscaptainuniform(src)
	new /obj/item/clothing/under/captainparade(src)
	new /obj/item/clothing/under/rank/captain/dress(src)
	new /obj/item/clothing/under/rank/captain/kilt(src)
	new /obj/item/clothing/suit/armor/vest/capcarapace(src)
	new /obj/item/clothing/suit/armor/vest/capcarapace/alt(src)
	new /obj/item/clothing/suit/armor/vest/capcarapace/jacket(src)
	new /obj/item/clothing/suit/toggle/capformal(src)
	new /obj/item/clothing/suit/captunic(src)
	new /obj/item/clothing/suit/hooded/wintercoat/captain/alt(src)	
	new /obj/item/clothing/neck/cloak/cap(src)
	new /obj/item/clothing/neck/mantle/capmantle(src)
	new /obj/item/clothing/head/caphat(src)
	new /obj/item/clothing/head/beret/captain(src)
	new /obj/item/clothing/head/beret/captain/white(src)
	new /obj/item/clothing/head/beret/captain/black(src)
	new /obj/item/clothing/gloves/color/captain(src)
	
/obj/item/storage/bag/garment/hop/PopulateContents()
	new /obj/item/clothing/under/rank/head_of_personnel(src)
	new /obj/item/clothing/under/rank/head_of_personnel/skirt(src)
	new /obj/item/clothing/under/rank/head_of_personnel/dress(src)
	new /obj/item/clothing/under/rank/head_of_personnel/parade(src)
	new /obj/item/clothing/under/rank/head_of_personnel/parade/skirt(src)
	new /obj/item/clothing/under/rank/head_of_personnel/turtleneck(src)
	new /obj/item/clothing/under/rank/head_of_personnel/skirt/turtleneck(src)
	new /obj/item/clothing/under/rank/head_of_personnel/paradefancy(src)
	new /obj/item/clothing/under/yogs/hopcasual(src)
	new /obj/item/clothing/suit/toggle/capformal/hop(src)
	new /obj/item/clothing/suit/hooded/wintercoat/hop(src)
	new /obj/item/clothing/suit/hooded/wintercoat/hop/formal(src)
	new /obj/item/clothing/neck/mantle/hopmantle(src)
	new /obj/item/clothing/neck/cloak/hop(src)
	new /obj/item/clothing/head/hopcap(src)
	new /obj/item/clothing/head/beret/hop(src)
	new /obj/item/clothing/head/hopcap/alt(src)
	new /obj/item/clothing/gloves/color/white(src)
	new /obj/item/clothing/gloves/color/black(src)

/obj/item/storage/bag/garment/hos/PopulateContents()
	new /obj/item/clothing/under/rank/head_of_security(src)
	new /obj/item/clothing/under/rank/head_of_security/skirt(src)
	new /obj/item/clothing/under/rank/head_of_security/corporate(src)
	new /obj/item/clothing/under/rank/head_of_security/corporate/skirt(src)
	new /obj/item/clothing/under/rank/head_of_security/alt(src)
	new /obj/item/clothing/under/rank/head_of_security/alt/skirt(src)
	new /obj/item/clothing/under/rank/head_of_security/grey(src)	
	new /obj/item/clothing/under/hosparademale(src)
	new /obj/item/clothing/under/hosparadefem(src)
	new /obj/item/clothing/under/yogs/dictatorhos(src)	
	new /obj/item/clothing/suit/toggle/capformal/hos(src)
	new /obj/item/clothing/suit/armor/vest/hosjacket(src)	
	new /obj/item/clothing/suit/armor/hos(src)
	new /obj/item/clothing/suit/armor/hos/trenchcoat(src)
	new /obj/item/clothing/suit/hooded/wintercoat/security/hos(src)
	new /obj/item/clothing/neck/mantle/hosmantle(src)
	new /obj/item/clothing/neck/cloak/hos(src)
	new /obj/item/clothing/head/HoS/beret(src)
	new /obj/item/clothing/head/HoS(src)
	new /obj/item/clothing/head/HoS/dictator(src)
	new /obj/item/clothing/mask/gas/sechailer/swat/hos(src)

/obj/item/storage/bag/garment/warden/PopulateContents()
	new /obj/item/clothing/under/rank/warden(src)
	new /obj/item/clothing/under/rank/warden/skirt(src)
	new /obj/item/clothing/under/rank/warden/corporate(src)
	new /obj/item/clothing/under/rank/warden/corporate/skirt(src)
	new /obj/item/clothing/under/yogs/ocelot(src)
	new /obj/item/clothing/under/rank/warden/navyblue(src)
	new /obj/item/clothing/under/rank/warden/classic(src)
	new /obj/item/clothing/suit/armor/wardenjacket(src)
	new /obj/item/clothing/suit/armor/vest/wardenjacket(src)
	new /obj/item/clothing/suit/armor/vest/warden/alt(src)
	new /obj/item/clothing/suit/armor/vest/warden/short(src)
	new /obj/item/clothing/suit/armor/vest/warden(src)
	new /obj/item/clothing/suit/armor/vest/warden/winter(src)
	new /obj/item/clothing/head/warden(src)
	new /obj/item/clothing/head/warden/drill(src)
	new /obj/item/clothing/head/beret/sec/navywarden(src)
	new /obj/item/clothing/head/beret/corpwarden(src)
	new /obj/item/clothing/mask/gas/sechailer/swat/warden(src)

/obj/item/storage/bag/garment/physician/PopulateContents()
	new /obj/item/clothing/under/yogs/rank/physician(src)
	new /obj/item/clothing/under/rank/medical/purple(src)
	new /obj/item/clothing/under/yogs/rank/physician/white(src)
	new /obj/item/clothing/under/yogs/rank/physician/white/skirt(src)
	new /obj/item/clothing/under/yogs/rank/physician/turtle(src)
	new /obj/item/clothing/under/yogs/rank/physician/turtle/skirt(src)
	new /obj/item/clothing/suit/toggle/labcoat/physician(src)
	new /obj/item/clothing/suit/toggle/labcoat/emt/physician(src)
	new /obj/item/clothing/gloves/color/latex/nitrile(src)
	new /obj/item/clothing/head/beret/med/phys(src)
	new /obj/item/clothing/head/beret/corpsec/phys(src)
	new /obj/item/clothing/head/soft/emt/phys(src)
	new /obj/item/clothing/glasses/hud/health/sunglasses(src)
	new /obj/item/clothing/glasses/hud/health(src)

/obj/item/storage/bag/garment/research_director/PopulateContents()
	new /obj/item/clothing/under/rank/research_director(src)
	new /obj/item/clothing/under/rank/research_director/skirt(src)
	new /obj/item/clothing/under/rank/research_director/dark(src)
	new /obj/item/clothing/under/rank/research_director/alt(src)
	new /obj/item/clothing/under/rank/research_director/alt/skirt(src)
	new /obj/item/clothing/under/rank/research_director/turtleneck(src)
	new /obj/item/clothing/under/rank/research_director/turtleneck/skirt(src)
	new /obj/item/clothing/suit/toggle/labcoat/science/rd(src)
	new /obj/item/clothing/suit/toggle/labcoat/science/brown(src)
	new /obj/item/clothing/suit/toggle/labcoat(src)
	new /obj/item/clothing/suit/hooded/wintercoat/science/rd(src)
	new /obj/item/clothing/neck/cloak/rd(src)
	new /obj/item/clothing/neck/mantle/rdmantle(src)
	new /obj/item/clothing/head/beret/sci(src)
	new /obj/item/clothing/head/beret/rd(src)	
	new /obj/item/clothing/head/beret/rd/white(src)
	new /obj/item/clothing/gloves/color/latex(src)	
	new /obj/item/clothing/gloves/color/black(src)	
	new /obj/item/clothing/glasses/hud/diagnostic/sunglasses/rd(src)
	new /obj/item/clothing/glasses/sunglasses/reagent/sci(src)
	new /obj/item/clothing/glasses/welding/superior(src)

/obj/item/storage/bag/garment/chief_medical/PopulateContents()
	new /obj/item/clothing/head/beret/cmo(src)
	new /obj/item/clothing/neck/cloak/cmo(src)
	new /obj/item/clothing/suit/toggle/labcoat/cmo(src)
	new /obj/item/clothing/suit/toggle/labcoat/cmo/alt(src)
	new /obj/item/clothing/suit/toggle/labcoat/cmo/long(src)
	new /obj/item/clothing/suit/hooded/wintercoat/medical/cmo/alt(src)
	new /obj/item/clothing/suit/hooded/wintercoat/medical/cmo/long(src)
	new /obj/item/clothing/gloves/color/latex/nitrile/advanced(src)
	new /obj/item/clothing/glasses/hud/health/sunglasses/cmo(src)
	new /obj/item/clothing/under/rank/chief_medical_officer(src)
	new /obj/item/clothing/under/rank/chief_medical_officer/skirt(src)
	new /obj/item/clothing/under/rank/chief_medical_officer/alt(src)
	new /obj/item/clothing/under/rank/chief_medical_officer/skirt/alt(src)
	new /obj/item/clothing/under/rank/chief_medical_officer/turtleneck(src)
	new /obj/item/clothing/under/rank/chief_medical_officer/turtleneck/alt(src)
	new /obj/item/clothing/under/rank/medical/scrcmo(src)
	new /obj/item/clothing/under/rank/medical/black(src)


/obj/item/storage/bag/garment/engineering_chief/PopulateContents()
	new /obj/item/clothing/under/rank/chief_engineer(src)
	new /obj/item/clothing/under/rank/chief_engineer/skirt(src)
	new /obj/item/clothing/under/rank/chief_engineer/alt(src)
	new /obj/item/clothing/under/rank/chief_engineer/gorka(src)
	new /obj/item/clothing/under/rank/chief_engineer/formal(src)
	new /obj/item/clothing/under/rank/chief_engineer/skirt/formal(src)
	new /obj/item/clothing/neck/cloak/ce(src)
	new /obj/item/clothing/head/hardhat/weldhat/white(src)
	new /obj/item/clothing/head/welding/engie(src)
	new /obj/item/clothing/gloves/atmos/ce(src)
	new /obj/item/clothing/under/yogs/ceturtleneck(src)
	new /obj/item/clothing/under/yogs/cecasual(src)
	new /obj/item/clothing/head/beret/ce(src)
	new /obj/item/clothing/suit/hazardvest/white(src)
	new /obj/item/clothing/suit/hooded/wintercoat/engineering/ce(src)
	new /obj/item/clothing/mask/gas/atmos(src)
	new /obj/item/clothing/glasses/meson/engine(src)
	new /obj/item/clothing/glasses/meson/sunglasses/ce(src)

/obj/item/storage/bag/garment/quartermaster/PopulateContents()
	new /obj/item/clothing/under/rank/cargo(src)
	new /obj/item/clothing/under/rank/cargo/turtleneck(src)
	new /obj/item/clothing/under/rank/cargo/turtleneck/alt(src)
	new /obj/item/clothing/under/rank/cargo/qmc(src)
	new /obj/item/clothing/under/rank/cargo/official(src)
	new /obj/item/clothing/under/rank/cargo/supply_chief(src)
	new /obj/item/clothing/under/rank/cargo/supply_chief/alt(src)
	new /obj/item/clothing/under/rank/cargo/skirt(src)
	new /obj/item/clothing/under/rank/cargo/skirt/turtleneck(src)
	new /obj/item/clothing/under/rank/cargo/skirt/supply_chief(src)
	new /obj/item/clothing/under/rank/cargo/skirt/supply_chief/alt(src)
	new /obj/item/clothing/gloves/fingerless/tactifool/qm(src)
	new /obj/item/clothing/gloves/cargo_gauntlet/qm(src)
	new /obj/item/clothing/suit/hazardvest(src)
	new /obj/item/clothing/suit/hooded/wintercoat/qm(src)
	new /obj/item/clothing/suit/trenchcoatqm(src)
	new /obj/item/clothing/head/soft(src)
	new /obj/item/clothing/head/welding/tagilla(src)
	new /obj/item/clothing/head/beret/quartermaster(src)
	new /obj/item/clothing/head/qmhat(src)
	new /obj/item/clothing/neck/cloak/qm(src)
