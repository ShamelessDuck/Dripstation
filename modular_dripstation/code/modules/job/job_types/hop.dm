/datum/job/hop
	description = "Alter access on ID cards, manage civil department, \
		protect Ian, run the station when the captain dies."
	head_announce = list(RADIO_CHANNEL_SERVICE)
	exp_requirements = 360 //6 hours on command jobs
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_COMMAND
	added_access = list(ACCESS_CAPTAIN)
	base_access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_COURT, ACCESS_WEAPONS,
			            ACCESS_MEDICAL, ACCESS_ENGINE, ACCESS_CHANGE_IDS, ACCESS_AI_UPLOAD, ACCESS_EVA, ACCESS_HEADS,
			            ACCESS_ALL_PERSONAL_LOCKERS, ACCESS_MAINT_TUNNELS, ACCESS_BAR, ACCESS_JANITOR, ACCESS_CONSTRUCTION, ACCESS_MORGUE,
			            ACCESS_CREMATORIUM, ACCESS_KITCHEN, ACCESS_MAILSORTING, ACCESS_HYDROPONICS, ACCESS_LAWYER,
						ACCESS_MECH_MINING, ACCESS_MECH_ENGINE, ACCESS_MECH_SCIENCE, ACCESS_MECH_SECURITY, ACCESS_MECH_MEDICAL,
			            ACCESS_THEATRE, ACCESS_CHAPEL_OFFICE, ACCESS_LIBRARY, ACCESS_RESEARCH, ACCESS_MINING, ACCESS_MINING_STATION,
			            ACCESS_HOP, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY, ACCESS_MINERAL_STOREROOM, ACCESS_MANUFACTURING) //yogs - added ACCESS_MANUFACTURING as it's the clerk's

/datum/outfit/job/hop
	backpack = /obj/item/storage/backpack/head_of_personnel
	satchel = /obj/item/storage/backpack/satchel/head_of_personnel
	duffelbag = /obj/item/storage/backpack/duffelbag/head_of_personnel

/datum/outfit/job/plasmaman/hop
	backpack = /obj/item/storage/backpack/head_of_personnel
	satchel = /obj/item/storage/backpack/satchel/head_of_personnel
	duffelbag = /obj/item/storage/backpack/duffelbag/head_of_personnel
