GLOBAL_LIST_INIT(closet_cutting_types, typecacheof(list(
	/obj/item/gun/energy/plasmacutter)))

/obj/structure/closet
	icon = 'modular_dripstation/icons/obj/closet.dmi'
	var/locked_state = "locked"
	var/unlocked_state = "unlocked"
	//var/emagged_state = "emagged"

/obj/structure/closet/secure_closet/freezer
	locked_state = "freezer_locked"
	unlocked_state = "freezer_unlocked"
	//var/emagged_state = "freezer_emagged"

/obj/structure/closet/secure_closet/psych
	locked_state = "cabinet_locked"
	unlocked_state = "cabinet_unlocked"

/obj/structure/closet/secure_closet/personal/cabinet
	locked_state = "cabinet_locked"
	unlocked_state = "cabinet_unlocked"
	door_anim_time = 0 // no animation

/obj/structure/closet/secure_closet/detective
	locked_state = "cabinet_locked"
	unlocked_state = "cabinet_unlocked"

/obj/structure/closet/secure_closet/bar
	locked_state = "cabinet_locked"
	unlocked_state = "cabinet_unlocked"

/obj/structure/closet/secure_closet/lethalshots
	icon_state = "armory"

/obj/structure/closet/attackby(obj/item/attacking_item, mob/user, params)
	if(user in src)
		return
	if(user.a_intent == INTENT_HARM)
		return ..()
	if(attacking_item.GetID())
		togglelock(user)
		return TRUE
	if(istype(attacking_item, /obj/item/card/emag))
		return ..()
	if(opened && user.transferItemToLoc(attacking_item, drop_location()))
		return TRUE
	return ..()

/obj/structure/closet/welder_act(mob/living/user, obj/item/tool)
	if(is_type_in_typecache(tool, GLOB.closet_cutting_types) && user.a_intent == INTENT_HARM)
		to_chat(user, span_notice("You try too cut off electronic lock of \the [src]..."))
		if(tool.tool_behaviour == cutting_tool)
			if(!tool.tool_start_check(user, amount=0))
				return
			user.visible_message(span_notice("[user] started cutting lock of \the [src]."),
							span_notice("You begin cutting \the [src]`s lock with \the [tool]."),
							span_italics("You hear welding."))
			if(tool.use_tool(src, user, 40, volume=50))
				if(opened)
					return
				user.visible_message(span_notice("[user] melts the lock of \the [src]."),
						span_notice("You melting the lock of \the [src] with \the [tool]."),
						span_italics("You hear welding."))
				atom_integrity -= 40
		if(atom_integrity <= integrity_failure)
			bust_open()
		return TRUE
	if(user.a_intent == INTENT_HARM)
		return FALSE
	if(!tool.tool_start_check(user, amount=0))
		return FALSE
	if(opened && !(flags_1 & NODECONSTRUCT_1))
		if(tool.tool_behaviour != cutting_tool)
			return FALSE // the wrong tool
		to_chat(user, span_notice("You begin cutting \the [src] apart..."))
		if(tool.use_tool(src, user, 4 SECONDS, volume=50))
			if(!opened)
				return TRUE
			user.visible_message(span_notice("[user] slices apart \the [src]."),
				span_notice("You cut \the [src] apart with \the [tool]."),
				span_italics("You hear welding."))
			deconstruct(TRUE)
		return TRUE
	if(can_weld_shut)
		to_chat(user, span_notice("You begin [welded ? "unwelding":"welding"] \the [src]..."))
		if(tool.use_tool(src, user, 4 SECONDS, volume=50))
			if(opened)
				return
			welded = !welded
			after_weld(welded)
			update_airtightness()
			user.visible_message(span_notice("[user] [welded ? "welds shut" : "unwelded"] \the [src]."),
				span_notice("You [welded ? "weld" : "unwelded"] \the [src] with \the [tool]."),
				span_italics("You hear welding."))
			update_appearance()
		return TRUE
	return FALSE

// ###### HOS ######
/obj/structure/closet/secure_closet/hos
	anchored = TRUE	//i`ve commited crime with this

/obj/structure/closet/secure_closet/hos/PopulateContents()
	..()
	new /obj/item/cartridge/hos(src)
	new /obj/item/radio/headset/heads/hos/alt(src)
	new /obj/item/radio/headset/heads/hos(src)
	new /obj/item/storage/lockbox/medal/sec(src)
	new /obj/item/megaphone/sec(src)
	new /obj/item/holosign_creator/security(src)
	new /obj/item/storage/lockbox/loyalty(src)
	new /obj/item/storage/box/flashbangs(src)
	new /obj/item/gun/energy/e_gun/hos(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/pinpointer/nuke(src)
	new /obj/item/clothing/shoes/combat(src)
	new /obj/item/clothing/gloves/combat(src)
	new /obj/item/storage/belt/security/chief/full(src)
	new /obj/item/clothing/glasses/hud/security/sunglasses/hos(src)	
	new /obj/item/clothing/shoes/xeno_wraps/jackboots/combat(src)
	new /obj/item/circuitboard/machine/techfab/department/armory(src)
	new /obj/item/storage/backpack/security(src)
	new /obj/item/storage/backpack/satchel/sec(src)
	new /obj/item/storage/backpack/duffelbag/sec(src)
	new /obj/item/storage/photo_album/HoS(src)
	new /obj/item/clipboard/yog/paperwork/hos(src)
	new /obj/item/radio/security(src)
	new /obj/item/storage/bag/garment/hos(src)

// ###### WARDEN ######
/obj/structure/closet/secure_closet/warden
	anchored = TRUE	//i`ve commited crime with this

/obj/structure/closet/secure_closet/warden/PopulateContents()
	..()
	new /obj/item/radio/headset/headset_sec(src)
	new /obj/item/clothing/glasses/hud/security/sunglasses(src)
	new /obj/item/holosign_creator/security(src)
	new /obj/item/storage/box/zipties(src)
	new /obj/item/megaphone/sec(src)
	new /obj/item/storage/box/flashbangs(src)
	new /obj/item/storage/belt/security/full(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/clothing/gloves/krav_maga/sec(src)
	new /obj/item/clothing/shoes/jackboots(src)
	new /obj/item/clothing/shoes/jackboots/warden(src)
	new /obj/item/door_remote/head_of_security(src)
	new /obj/item/gun/ballistic/shotgun/automatic/combat/compact(src)
	new /obj/item/clipboard/yog/paperwork/warden(src)
	new /obj/item/radio/security(src)
	new /obj/item/storage/bag/garment/warden(src)

// ###### SEC OFFICER ######
/obj/structure/closet/secure_closet/security/PopulateContents()
	..()
	new /obj/item/clothing/suit/armor/vest/alt(src)
	new /obj/item/clothing/head/helmet/sec(src)
	new /obj/item/radio/headset/headset_sec(src)
	new /obj/item/radio/headset/headset_sec/alt(src)
	new /obj/item/clothing/glasses/hud/security/sunglasses(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/radio/security(src)
	new /obj/item/clipboard/yog/paperwork/security(src)
	new /obj/item/barrier_taperoll/police(src)

/obj/structure/closet/secure_closet/detective/PopulateContents()
	..()
	new /obj/item/melee/classic_baton(src)
	new /obj/item/clothing/shoes/laceup(src)
	new /obj/item/clothing/shoes/laceup/brown(src)
	new /obj/item/storage/box/evidence(src)
	new /obj/item/radio/headset/headset_sec(src)
	new /obj/item/detective_scanner(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/holosign_creator/security(src)
	new /obj/item/reagent_containers/spray/pepper(src)
	new /obj/item/clothing/suit/armor/vest/det_suit(src)
	new /obj/item/storage/belt/holster/full(src)
	new /obj/item/pinpointer/crew(src)
	new /obj/item/binoculars(src)
	new /obj/item/barrier_taperoll/police(src)

// ###### HOP ######
/obj/structure/closet/secure_closet/hop
	anchored = TRUE	//i`ve commited crime with this

/obj/structure/closet/secure_closet/hop/PopulateContents()
	..()
	if(prob(50))
		new /obj/item/storage/backpack/head_of_personnel(src)
	else
		new /obj/item/storage/backpack/satchel/head_of_personnel(src)
	new /obj/item/storage/backpack/duffelbag/head_of_personnel(src)
	new /obj/item/storage/lockbox/medal/service(src)
	new /obj/item/cartridge/hop(src)
	new /obj/item/radio/headset/heads/hop(src)
	new /obj/item/storage/box/ids(src)
	new /obj/item/storage/box/ids(src)
	new /obj/item/megaphone/command(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/clothing/glasses/sunglasses(src)
	new /obj/item/clothing/glasses/hud/personnel(src)
	new /obj/item/restraints/handcuffs/cable/zipties(src)
	new /obj/item/clothing/neck/petcollar(src)
	new /obj/item/clothing/suit/armor/vest/light(src)		
	new /obj/item/pet_carrier(src)
	new /obj/item/door_remote/civillian(src)
	new /obj/item/circuitboard/machine/techfab/department/service(src)
	new /obj/item/storage/photo_album/HoP(src)
	new /obj/item/clipboard/yog/paperwork/hop(src)
	new /obj/item/gun/energy/e_gun/mini(src)
	new /obj/item/storage/bag/garment/hop(src)
	new /obj/item/clothing/shoes/leather(src)
	new /obj/item/clothing/shoes/laceup(src)

// ###### CAPTAIN ######
/obj/structure/closet/secure_closet/captains
	anchored = TRUE	//i`ve commited crime with this

/obj/structure/closet/secure_closet/captains/PopulateContents()
	..()
	if(prob(50))
		new /obj/item/storage/backpack/captain(src)
	else
		new /obj/item/storage/backpack/satchel/cap(src)
	new /obj/item/storage/backpack/duffelbag/captain(src)
	new /obj/item/clothing/neck/petcollar(src)
	new /obj/item/pet_carrier(src)
	new /obj/item/cartridge/captain(src)
	new /obj/item/storage/box/silver_ids(src)
	new /obj/item/radio/headset/heads/captain/alt(src)
	new /obj/item/radio/headset/heads/captain(src)
	new /obj/item/restraints/handcuffs/cable/zipties(src)
	new /obj/item/storage/belt/sabre(src)
	new /obj/item/clothing/glasses/hud/personnel(src)
	new /obj/item/door_remote/captain(src)
	new /obj/item/storage/photo_album/Captain(src)
	new /obj/item/clipboard/yog/paperwork/captain(src)
	new /obj/item/radio/security(src)
	new /obj/item/storage/bag/garment/captain(src)
	new /obj/item/clothing/shoes/laceup/brown(src)
	new /obj/item/clothing/shoes/laceup/cap(src)

// ###### RD ######
/obj/structure/closet/secure_closet/RD
	anchored = TRUE	//i`ve commited crime with this

/obj/structure/closet/secure_closet/RD/PopulateContents()
	..()
	new /obj/item/cartridge/rd(src)
	new /obj/item/radio/headset/heads/rd(src)
	new /obj/item/tank/internals/air(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/megaphone/command(src)
	new /obj/item/storage/lockbox/medal/sci(src)
	new /obj/item/reactive_armor_shell/random(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/door_remote/research_director(src)
	new /obj/item/circuitboard/machine/techfab/department/science(src)
	new /obj/item/storage/photo_album/RD(src)
	new /obj/item/clipboard/yog/paperwork/rd(src)
	new /obj/item/storage/bag/garment/research_director(src)
	new /obj/item/clothing/shoes/laceup(src)
	new /obj/item/clothing/shoes/sneakers/white(src)
	new /obj/item/multitool/tricorder(src)

// ###### MIME ######
/obj/structure/closet/secure_closet/mime
	name = "mime's locker"
	icon = 'modular_dripstation/icons/obj/closet.dmi'
	req_access = list(ACCESS_MIME)
	icon_state = "mime"

/obj/structure/closet/secure_closet/mime/PopulateContents()
	new /obj/item/cane(src)
	new /obj/item/reagent_containers/food/drinks/bottle/wine(src)
	new /obj/item/reagent_containers/food/snacks/baguette(src)
	new /obj/item/cartridge/virus/mime(src)
	new /obj/item/instrument/violin(src)
	// new /obj/item/food/grown/rose(src)
	new /obj/item/radio/headset/headset_srv(src)
	// new /obj/item/perfume/rose(src)
	new /obj/item/reagent_containers/food/drinks/bottle/bottleofnothing(src)
	new /obj/item/toy/crayon/spraycan/mimecan(src)
	new /obj/item/storage/crayons(src)
	new /obj/item/instrument/accordion(src)
	// new /obj/item/clothing/suit/hooded/wintercoat/mime(src)
	..()

// ###### CLOWN ######
/obj/structure/closet/secure_closet/clown
	name = "clown's locker"
	icon = 'modular_dripstation/icons/obj/closet.dmi'
	req_access = list(ACCESS_CLOWN)
	icon_state = "clown"

/obj/structure/closet/secure_closet/clown/PopulateContents()
	new /obj/item/seeds/banana(src)
	// new /obj/item/reagent_containers/food/drinks/bottle/bananajug(src)
	new /obj/item/bikehorn(src)
	new /obj/item/radio/headset/headset_srv(src)
	new /obj/item/instrument/bikehorn(src)
	new /obj/item/reagent_containers/spray/waterflower(src)
	new /obj/item/megaphone/clown(src)
	new /obj/item/storage/box/donkpockets/donkpockethonk(src)
	new /obj/item/pneumatic_cannon/pie(src)
	new /obj/item/reagent_containers/food/drinks/soda_cans/canned_laughter(src)
	new /obj/item/storage/crayons(src)
	// new /obj/item/clothing/suit/hooded/wintercoat/clown(src)
	..()

// ###### MEDICAL DOCTOR ######
/obj/structure/closet/secure_closet/medical3
	icon = 'modular_dripstation/icons/obj/closet.dmi'

/obj/structure/closet/secure_closet/medical3/PopulateContents()
	..()
	new /obj/item/radio/headset/headset_med(src)
	new /obj/item/defibrillator/loaded(src)
	new /obj/item/clothing/gloves/color/latex(src)
	new /obj/item/storage/belt/medical(src)
	new /obj/item/clothing/glasses/hud/health(src)
	new /obj/item/gun/syringe(src)


// ###### MINING MEDIC ######
/obj/structure/closet/secure_closet/mmedical/PopulateContents()
	..()
	new /obj/item/storage/backpack/emt(src)
	new /obj/item/storage/backpack/satchel/emt(src)
	new /obj/item/storage/backpack/duffelbag/emt(src)
	new /obj/item/defibrillator/loaded(src)
	new /obj/item/clothing/suit/toggle/labcoat/emt/explorer(src)
	new /obj/item/clothing/head/beret/emt/mining(src)
	new /obj/item/clothing/under/rank/miner/mmedic/alt(src)
	new /obj/item/clothing/under/rank/miner/mmedic/alt(src)
	new /obj/item/clothing/under/rank/miner/mmedic/alt/skirt(src)
	new /obj/item/clothing/under/yogs/rank/miner/medic(src)
	new /obj/item/clothing/suit/toggle/labcoat/explorer(src)
	new /obj/item/storage/belt/medical/mining(src)
	new /obj/item/clothing/glasses/hud/health/meson(src)
	new /obj/item/clothing/gloves/color/latex/fireproof(src)
	new /obj/item/clothing/shoes/sneakers/white(src)
	new	/obj/item/radio/headset/headset_medcargo(src)
	new /obj/item/clothing/mask/gas/explorer(src)
	new /obj/item/storage/firstaid/hypospray/qmc(src)
	new /obj/item/binoculars(src)
	new /obj/item/pinpointer/crew(src)
	new /obj/item/sensor_device(src)
	new /obj/item/bodybag/environmental(src)
	new /obj/item/extinguisher/mini(src)
	new /obj/item/reagent_containers/medspray/synthflesh(src)
	var/obj/item/key/K = new(src)
	K.name = "ATV key"
	K.desc = "It's a small grey key. Don't let those goddamn ashwalkers or plantpeople get it."

// ###### BRIG PHYSICIAN ######
/obj/structure/closet/secure_closet/physician
	icon = 'modular_dripstation/icons/obj/closet.dmi'
	icon_state = "brigphys"

/obj/structure/closet/secure_closet/physician/PopulateContents()
	..()
	new /obj/item/storage/bag/garment/physician(src)
	new /obj/item/cartridge/medical(src)
	new /obj/item/radio/headset/headset_medsec(src)
	new /obj/item/storage/belt/medical(src)
	new /obj/item/pinpointer/crew(src)
	new /obj/item/sensor_device(src)
	new /obj/item/storage/box/bodybags(src)
	new /obj/item/tank/internals/anesthetic(src)
	new /obj/item/clothing/mask/breath/medical(src)
	new /obj/item/defibrillator/loaded(src)
	new /obj/item/modular_computer/laptop/preset/paramedic/brig_physician(src)
	new /obj/item/storage/backpack/bmed(src)
	new /obj/item/storage/backpack/satchel/bmed(src)
	new /obj/item/storage/backpack/duffelbag/bmed(src)
	new /obj/item/clothing/shoes/jackboots(src)
	new /obj/item/clothing/shoes/xeno_wraps/jackboots(src)

// ###### CHAPLAIN ######
/obj/structure/closet/secure_closet/chaplain
	name = "chaplain's locker"
	desc = "A lockable storage unit for Nanotrasen-approved religious attire."
	icon = 'modular_dripstation/icons/obj/closet.dmi'
	req_access = list(ACCESS_CHAPEL_OFFICE)
	icon_state = "chaplain"

/obj/structure/closet/secure_closet/chaplain/PopulateContents()
	new /obj/item/choice_beacon/holy(src)
	new /obj/item/clothing/accessory/pocketprotector/cosmetology(src)
	new /obj/item/clothing/under/rank/chaplain(src)
	new /obj/item/clothing/shoes/sneakers/black(src)
	new /obj/item/clothing/suit/chaplainsuit/nun(src)
	new /obj/item/clothing/head/nun_hood(src)
	new /obj/item/clothing/suit/chaplainsuit/holidaypriest(src)
	new /obj/item/storage/backpack/cultpack(src)
	//new /obj/item/storage/box/fancy/candle_box(src)
	//new /obj/item/storage/box/fancy/candle_box(src)

// ###### POD PILOT ######
/obj/structure/closet/secure_closet/pod_pilot
	name = "pod pilot's locker"
	icon = 'modular_dripstation/icons/obj/closet.dmi'
	req_access = list(ACCESS_POD_PILOT)
	icon_state = "pod_pilot"

/obj/structure/closet/secure_closet/pod_pilot/PopulateContents()
	//new /obj/item/clothing/suit/toggle/bomber/secbomber(src)
	new /obj/item/clothing/head/beret/corpsec(src)
	new /obj/item/radio/headset/headset_sec(src)
	new /obj/item/radio/headset/headset_sec/alt(src)
	new /obj/item/storage/belt/security/full(src)
	new /obj/item/storage/firstaid/emergency(src)
	new /obj/item/clothing/glasses/hud/security/sunglasses(src)
	new /obj/item/spacepod_key/sec(src)
	new /obj/item/spacepod_equipment/weaponry/laser(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/radio/security(src)
	new /obj/item/barrier_taperoll/police(src)
	new /obj/item/bodybag/environmental/prisoner(src)
	new /obj/item/bodybag/environmental/prisoner(src)

// ###### HAZARD TECHNICIAN ######
/obj/structure/closet/secure_closet/hazard_tech
	name = "hazard technician's locker"
	icon = 'modular_dripstation/icons/obj/closet.dmi'
	req_access = list(ACCESS_HAZARD_TECH)
	icon_state = "haz_secure"

// ###### BLUESHIELD ######
/obj/structure/closet/secure_closet/blueshield
	name = "blueshield's locker"
	icon = 'modular_dripstation/icons/obj/closet.dmi'
	req_access = list(ACCESS_BLUESHIELD)
	icon_state = "bs"

// ###### NT REPRESENTATIVE ######
/obj/structure/closet/secure_closet/ntrep
	name = "\improper Nanotrasen Representative's locker"
	icon = 'modular_dripstation/icons/obj/closet.dmi'
	req_access = list(ACCESS_NTREP)
	icon_state = "cc"

// ###### MAGISTRATE ######
/obj/structure/closet/secure_closet/magistrate
	name = "\improper Magistrate's locker"
	icon = 'modular_dripstation/icons/obj/closet.dmi'
	req_access = list(ACCESS_MAGISTRATE)
	icon_state = "cc"

// ###### QUARTERMASTER ######
/obj/structure/closet/secure_closet/quartermaster
	anchored = TRUE	//i`ve commited crime with this

/obj/structure/closet/secure_closet/quartermaster/PopulateContents()
	..()
	new /obj/item/storage/lockbox/medal/cargo(src)
	new /obj/item/clothing/shoes/workboots/cargo/aerostatic(src)
	new /obj/item/clothing/shoes/jackboots(src)
	new /obj/item/radio/headset/qm(src)
	new /obj/item/megaphone/cargo(src)
	new /obj/item/tank/internals/emergency_oxygen(src)
	new /obj/item/export_scanner(src)
	new /obj/item/cargo_teleporter(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/door_remote/quartermaster(src)
	new /obj/item/storage/bag/garment/quartermaster(src)
	new /obj/item/storage/backpack/cargo/tactical(src)
	new /obj/item/circuitboard/machine/techfab/department/cargo(src)
	new /obj/item/storage/photo_album/QM(src)
	new /obj/item/circuitboard/machine/ore_silo(src)
	new /obj/item/card/id/departmental_budget/car(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/clothing/suit/fire/firefighter(src)

/obj/structure/closet/secure_closet/CMO
	anchored = TRUE	//i`ve commited crime with this

/obj/structure/closet/secure_closet/CMO/PopulateContents()
	..()
	if(prob(50))
		new /obj/item/storage/backpack/cmo(src)
	else
		new /obj/item/storage/backpack/satchel/cmo(src)
	new /obj/item/storage/backpack/duffelbag/cmo(src)
	new /obj/item/cartridge/cmo(src)
	new /obj/item/radio/headset/heads/cmo(src)
	new /obj/item/megaphone/command(src)
	new /obj/item/defibrillator/compact/advanced/loaded(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/storage/firstaid/hypospray/deluxe/cmo(src)
	new /obj/item/autosurgeon/cmo(src)
	new /obj/item/door_remote/chief_medical_officer(src)
	new /obj/item/clothing/neck/petcollar(src)
	new /obj/item/pet_carrier(src)
	new /obj/item/wallframe/defib_mount(src)
	new /obj/item/circuitboard/machine/techfab/department/medical(src)
	new /obj/item/storage/photo_album/CMO(src)
	new /obj/item/clipboard/yog/paperwork/cmo(src)
	new /obj/item/storage/bag/garment/chief_medical(src)
	new /obj/item/clothing/suit/bio_suit/cmo(src)
	new /obj/item/clothing/head/bio_hood/cmo(src)
	new /obj/item/clothing/shoes/galoshes/white(src)
	new /obj/item/clothing/gloves/color/latex/hazmat/white(src)
	new /obj/item/clothing/shoes/sneakers/brown	(src)
	new /obj/item/clothing/shoes/laceup/brown(src)
	new /obj/item/clothing/shoes/xeno_wraps/command(src)
	new /obj/item/storage/belt/medical/chief/full(src)
	new /obj/item/storage/lockbox/medal/med(src)

/obj/structure/closet/secure_closet/engineering_chief
	anchored = TRUE	//i`ve commited crime with this

/obj/structure/closet/secure_closet/engineering_chief/PopulateContents()
	..()
	new /obj/item/tank/jetpack/suit(src)
	new /obj/item/cartridge/ce(src)
	new /obj/item/radio/headset/heads/ce(src)
	new /obj/item/storage/toolbox/mechanical(src)
	new /obj/item/megaphone/command(src)
	new /obj/item/areaeditor/blueprints(src)
	new /obj/item/airlock_painter(src)
	new /obj/item/holosign_creator/atmos(src)
	new /obj/item/multitool/tricorder(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/construction/rcd/loaded(src)
	new /obj/item/door_remote/chief_engineer(src)
	new /obj/item/pipe_dispenser(src)
	new /obj/item/inducer(src)
	new /obj/item/storage/belt/utility/chief/full(src)
	new /obj/item/circuitboard/machine/techfab/department/engineering(src)
	new /obj/item/extinguisher/advanced(src)
	new /obj/item/storage/photo_album/CE(src)
	new /obj/item/energy_harvester(src)
	new /obj/item/clipboard/yog/paperwork/ce(src)
	new /obj/item/poster/firstsingularity(src)
	new /obj/item/storage/bag/garment/engineering_chief(src)
	new /obj/item/clothing/shoes/sneakers/brown(src)
	new /obj/item/clothing/shoes/xeno_wraps/command(src)
	new /obj/item/storage/lockbox/medal/eng(src)
	new /obj/item/barrier_taperoll/engineering(src)
	new /obj/item/multisurgeon/magboots(src)

/obj/structure/closet/l3closet/PopulateContents()
	new /obj/item/storage/bag/bio(src)
	new /obj/item/clothing/suit/bio_suit/general(src)
	new /obj/item/clothing/head/bio_hood/general(src)
	new /obj/item/clothing/shoes/galoshes/general(src)
	new /obj/item/clothing/gloves/color/latex/hazmat(src)
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/tank/internals/oxygen(src)


/obj/structure/closet/l3closet/virology
	icon_state = "bio_viro"

/obj/structure/closet/l3closet/virology/PopulateContents()
	new /obj/item/storage/bag/bio(src)
	new /obj/item/clothing/suit/bio_suit/virology(src)
	new /obj/item/clothing/head/bio_hood/virology(src)
	new /obj/item/clothing/shoes/galoshes/white(src)
	new /obj/item/clothing/gloves/color/latex/hazmat/white(src)
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/tank/internals/oxygen(src)


/obj/structure/closet/l3closet/security
	icon_state = "bio_sec"

/obj/structure/closet/l3closet/security/PopulateContents()
	new /obj/item/clothing/suit/bio_suit/security(src)
	new /obj/item/clothing/head/bio_hood/security(src)
	new /obj/item/clothing/shoes/galoshes/sec(src)
	new /obj/item/clothing/gloves/color/latex/hazmat/sec(src)
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/tank/internals/oxygen(src)


/obj/structure/closet/l3closet/janitor
	icon_state = "bio_jan"

/obj/structure/closet/l3closet/janitor/PopulateContents()
	new /obj/item/clothing/suit/bio_suit/janitor(src)
	new /obj/item/clothing/head/bio_hood/janitor(src)
	new /obj/item/clothing/shoes/galoshes/white(src)
	new /obj/item/clothing/gloves/color/latex/hazmat/white(src)
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/tank/internals/oxygen(src)


/obj/structure/closet/l3closet/scientist
	icon_state = "bio_viro"

/obj/structure/closet/l3closet/scientist/PopulateContents()
	new /obj/item/storage/bag/bio(src)
	new /obj/item/clothing/suit/bio_suit/scientist(src)
	new /obj/item/clothing/head/bio_hood/scientist(src)
	new /obj/item/clothing/shoes/galoshes/white(src)
	new /obj/item/clothing/gloves/color/latex/hazmat/white(src)
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/tank/internals/oxygen(src)

/obj/structure/closet/l3closet/vahlen
	icon_state = "bio_viro"

/obj/structure/closet/l3closet/vahlen/PopulateContents()
	new /obj/item/storage/bag/bio(src)
	new /obj/item/clothing/suit/bio_suit/cyan(src)
	new /obj/item/clothing/head/bio_hood/cyan(src)
	new /obj/item/clothing/shoes/galoshes/cyan(src)
	new /obj/item/clothing/gloves/color/latex/hazmat/cyan(src)
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/tank/internals/oxygen(src)
