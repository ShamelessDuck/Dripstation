/obj/machinery/plantgenes
	icon_state = "dnamod"
	icon = 'modular_dripstation/icons/obj/hydroponics/equipment.dmi'

/obj/machinery/plantgenes/update_overlays()
	. = ..()
	if(stat & (BROKEN|NOPOWER))
		set_light(0)
	else
		. += "dnamod-on"
		. += emissive_appearance(icon, "dnamod-on", src)
		light_color = LIGHT_COLOR_ELECTRIC_GREEN
		set_light(powered() ? MINIMUM_USEFUL_LIGHT_RANGE : 0)
		if(seed)
			. += "dnamod-dna"
			. += emissive_appearance(icon, "dnamod-dna", src)
			light_color = LIGHT_COLOR_BLUEGREEN
	if(disk)
		. += "dnamod-disk"
	if(panel_open)
		. += "dnamod-open"
