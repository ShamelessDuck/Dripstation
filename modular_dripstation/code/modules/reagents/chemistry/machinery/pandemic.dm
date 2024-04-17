/obj/machinery/computer/pandemic
	icon = 'modular_dripstation/icons/obj/chemical.dmi'
	icon_state = "pandemic"
	light_color = LIGHT_COLOR_CYAN
	icon_keyboard = null
	icon_screen = null
	integrity_failure = 50

/obj/machinery/computer/pandemic/update_overlays()
	. = ..()
	if(stat & BROKEN)
		. += "[icon_state]_broken"
	if(!(stat & (NOPOWER|BROKEN)) && !beaker)
		. += mutable_appearance(icon, "[icon_state]_0")
		. += emissive_appearance(icon, "[icon_state]_0", src)
	if(beaker)
		. += "[icon_state]_beaker"
		if(!(stat & (NOPOWER|BROKEN)))
			. += mutable_appearance(icon, "[icon_state]_1")
			. += emissive_appearance(icon, "[icon_state]_1", src)
	if(wait)
		. += mutable_appearance(icon, "[icon_state]_waitlight")
		. += emissive_appearance(icon, "[icon_state]__waitlight", src)

/obj/machinery/computer/pandemic/power_change()
	..()
	if(!(stat & BROKEN))
		if(powered())
			stat &= ~NOPOWER
			START_PROCESSING(SSmachines, src)
			set_light(powered() ? MINIMUM_USEFUL_LIGHT_RANGE : 0)
		else
			stat |= NOPOWER
			set_light(0)
