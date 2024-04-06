/datum/design/digital_clock_frame
	name = "Digital Clock Frame"
	id = "digital_clock_frame"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*7, /datum/material/glass = SHEET_MATERIAL_AMOUNT*4)
	build_path = /obj/item/wallframe/digital_clock
	category = list("initial", "Construction", "Assemblies")
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING | DEPARTMENT_BITFLAG_SERVICE
