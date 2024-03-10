/obj/machinery/mineral/stacking_unit_console
	icon = 'modular_dripstation/icons/obj/terminals.dmi'
	light_range = 2
	light_power = 1
	light_color = LIGHT_COLOR_GREEN

/obj/machinery/mineral/stacking_unit_console/update_overlays()
	. = ..()
	if(!(stat & (NOPOWER|BROKEN)))
		. += mutable_appearance(icon, "console_screen")
		. += emissive_appearance(icon, "console_screen", src)

/obj/machinery/mineral/stacking_unit_console/power_change()
	. = ..()
	if(!.)
		return // reduce unneeded light changes
	if(stat & NOPOWER)
		set_light(0)
	else
		set_light(1)

