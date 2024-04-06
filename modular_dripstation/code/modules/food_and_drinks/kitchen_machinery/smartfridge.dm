/obj/machinery/smartfridge
	icon = 'modular_dripstation/icons/obj/vending.dmi'
	light_color = LIGHT_COLOR_LIGHT_CYAN
	var/light_mask = "smartfridge-light-mask"
	var/panel_type = "smartfridge-panel"

/obj/machinery/smartfridge/update_overlays()
	. = ..()
	if(light_mask && !(stat & BROKEN) && powered())
		. += emissive_appearance(icon, light_mask, src)
	if(panel_open)
		. += mutable_appearance(icon, panel_type)
		. += emissive_blocker(icon, panel_type, src, alpha = src.alpha)

/obj/machinery/smartfridge/disks
	icon = 'modular_dripstation/icons/obj/vending.dmi'
	supports_retrieval_state = FALSE
	supports_capacity_indication = FALSE
	panel_type = "disktoaster_panel"
	light_mask = "disktoaster-light-mask"


/obj/machinery/smartfridge/disks/proc/visible_items()
	return contents.len - 1 // Circuitboard

/obj/machinery/smartfridge/disks/update_overlays()
	. = ..()
	var/shown_contents_length = visible_items()
	var/content_level = "[initial(icon_state)]"
	switch(shown_contents_length)
		if(1 to 4)
			content_level += "1"
		if(5 to 9)
			content_level += "2"
		if(10 to 14)
			content_level += "3"
		if(15 to INFINITY)
			content_level += "4"
	. += mutable_appearance(icon, content_level)

	if(stat & (NOPOWER|BROKEN))
		return
	else
		. += emissive_appearance(icon, light_mask, src)

/obj/machinery/smartfridge/idbox
	name = "identification card compartmentalizer"
	desc = "A machine capable of storing identification cards and PDAs. It's great for lost and terminated cards."
	icon = 'modular_dripstation/icons/obj/vending.dmi'
	icon_state = "idbox"
	product_slogans = "These cards aren't from dead people...Right?"
	panel_type = "idbox_panel"
	light_mask = "idbox_lightmask"
	// circuit = /obj/item/circuitboard/machine/smartfridge/idbox
	pass_flags = PASSTABLE
	pitches = FALSE
	supports_retrieval_state = FALSE

/obj/machinery/smartfridge/idbox/accept_check(obj/item/O)
	if(istype(O, /obj/item/card))
		return TRUE
	if(istype(O, /obj/item/modular_computer/tablet/pda))
		return TRUE
	if(istype(O, /obj/item/modular_computer/tablet/phone))
		return TRUE
	else
		return FALSE

/obj/machinery/smartfridge/circuits
	name = "\improper Circuit Board Storage"
	desc = "A storage unit for circuits."
	icon = 'modular_dripstation/icons/obj/vending.dmi'
	icon_state = "circuits"
	panel_type = "circuits_panel"
	light_mask = "circuits-light-mask"
	max_n_of_items = 10
	product_slogans = "Contains all the 'Doomsday AI Scenario' solutions!"
	pitches = FALSE

/obj/machinery/smartfridge/circuits/accept_check(obj/item/O)
	if(istype(O, /obj/item/aiModule))
		return TRUE
	if(istype(O, /obj/item/circuitboard))
		return TRUE
	else
		return FALSE

/obj/machinery/smartfridge/circuits/aiupload
	name = "\improper AI Laws Storage"
	desc = "A storage unit filled with circuits to be uploaded to an Artificial Intelligence."

/obj/machinery/smartfridge/circuits/aiupload/experimental
	name = "\improper Experimental Laws Storage"
	initial_contents = list(
		/obj/item/aiModule/core/full/hippocratic = 1,
		/obj/item/aiModule/core/full/hippocratic = 1,
		/obj/item/aiModule/core/full/paladin_devotion = 1,
		/obj/item/aiModule/core/full/chapai = 1,
		/obj/item/aiModule/core/full/silicop = 1,
		/obj/item/aiModule/core/full/robocop = 1,
		/obj/item/aiModule/core/full/researcher = 1,
		/obj/item/aiModule/core/full/mother = 1,
		/obj/item/aiModule/core/full/druid = 1
	)

/obj/machinery/smartfridge/circuits/aiupload/highrisk
	name = "\improper High-Risk Laws Storage"
	initial_contents = list(
		/obj/item/aiModule/reset/purge = 1,
		/obj/item/aiModule/core/freeformcore = 1,
		/obj/item/aiModule/core/full/antimov = 1,
		/obj/item/aiModule/supplied/protectStation = 1,
		/obj/item/aiModule/core/full/tyrant = 1,
		/obj/item/aiModule/core/full/custom = 1,
		/obj/item/aiModule/zeroth/oneHuman = 1,
		/obj/item/aiModule/supplied/quarantine = 1,
		/obj/item/aiModule/supplied/oxygen = 1
	)

/obj/machinery/smartfridge/circuits/aiupload/standard
	name = "\improper Standard Laws Storage"
	initial_contents = list(
		/obj/item/aiModule/core/full/asimov = 1,
		/obj/item/aiModule/core/full/asimovpp = 1,
		/obj/item/aiModule/core/full/crewsimov = 1,
		/obj/item/aiModule/core/full/paladin = 1,
		/obj/item/aiModule/core/full/maintain = 1,
		/obj/item/aiModule/core/full/ceo = 1,
		/obj/item/aiModule/reset = 1,
	)

/obj/machinery/smartfridge/chemistry/syndie
	name = " suspicious smart chemical storage"
	icon_state = "syndi_smartfridge"

/obj/machinery/smartfridge/syndie
	name = " suspicious smartfridge"
	icon_state = "syndi_smartfridge"

/obj/machinery/smartfridge/extract/syndie
	name = "suspicious slime extract storage"
	icon_state = "syndi_smartfridge"

/obj/machinery/smartfridge/food
	name = "food fridge"
	icon_state = "smartfridge_food"
	light_mask = "smartfridge_food-light-mask"
	retrieval_state = "smartfridge_food-retrieve"

/obj/machinery/smartfridge/chemistry/virology
	icon_state = "virofridge"
