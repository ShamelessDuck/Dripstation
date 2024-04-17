/obj/machinery/chem_master
	icon = 'modular_dripstation/icons/obj/chemical.dmi'
	icon_state = "mixer"
	light_color = LIGHT_COLOR_CYAN
	integrity_failure = 50

/obj/machinery/chem_master/Initialize(mapload)
	. = ..()
	update_appearance(UPDATE_OVERLAYS)

/obj/machinery/chem_master/update_overlays()
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

/obj/machinery/chem_master/power_change()
	..()
	if(!(stat & BROKEN))
		if(powered())
			stat &= ~NOPOWER
			START_PROCESSING(SSmachines, src)
			set_light(powered() ? MINIMUM_USEFUL_LIGHT_RANGE : 0)
		else
			stat |= NOPOWER
			set_light(0)

/obj/machinery/chem_master/condimaster
	icon_state = "condimaster"
