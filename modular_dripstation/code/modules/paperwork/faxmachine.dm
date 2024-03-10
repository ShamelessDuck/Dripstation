/obj/machinery/photocopier/faxmachine
	icon = 'modular_dripstation/icons/obj/library.dmi'
	light_color = LIGHT_COLOR_ELECTRIC_GREEN

/obj/machinery/photocopier/faxmachine/update_icon_state()
	. = ..()
	if(stat & (BROKEN|NOPOWER))
		icon_state = "fax_nopower"
		set_light(0)
	else
		icon_state = "fax"
		set_light(powered() ? MINIMUM_USEFUL_LIGHT_RANGE : 0)

/obj/machinery/photocopier/faxmachine/update_overlays()
	. = ..()
	if(!(stat & (BROKEN|NOPOWER)))
		. += emissive_appearance(icon, "fax_overlay", src)
