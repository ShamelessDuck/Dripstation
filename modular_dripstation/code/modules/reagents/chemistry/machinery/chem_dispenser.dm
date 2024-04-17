/obj/machinery/chem_dispenser
	icon = 'modular_dripstation/icons/obj/chemical.dmi'
	nopower_state = null
	working_state = null

/obj/machinery/chem_dispenser/proc/display_beaker()
	var/mutable_appearance/beaker_overlay = mutable_appearance(icon, beaker.disp_icon)
	beaker_overlay.pixel_y = -1
	beaker_overlay.pixel_x = rand(-8, 8)
	return beaker_overlay

/obj/machinery/chem_dispenser/drinks
	icon = 'modular_dripstation/icons/obj/chemical.dmi'
	has_panel_overlay = TRUE

/obj/machinery/chem_dispenser/drinks/display_beaker()
	var/mutable_appearance/beaker_overlay = mutable_appearance(icon, beaker.disp_icon)
	switch(dir)
		if(NORTH)
			beaker_overlay.pixel_y = 7
			beaker_overlay.pixel_x = rand(-9, 9)
		if(EAST)
			beaker_overlay.pixel_x = 4
			beaker_overlay.pixel_y = rand(-5, 7)
		if(WEST)
			beaker_overlay.pixel_x = -5
			beaker_overlay.pixel_y = rand(-5, 7)
		else//SOUTH
			beaker_overlay.pixel_y = -7
			beaker_overlay.pixel_x = rand(-9, 9)
	return beaker_overlay

/obj/machinery/chem_dispenser/drinks/beer
	icon = 'modular_dripstation/icons/obj/chemical.dmi'

/obj/machinery/chem_dispenser/update_overlays()
	. = ..()
	if(!(stat & (BROKEN|NOPOWER)))
		. += mutable_appearance(icon, "[icon_state]_lights")
		. += emissive_appearance(icon, "[icon_state]_lights", src)

/obj/machinery/chem_dispenser/mutagen/display_beaker()
	var/mutable_appearance/beaker_overlay = mutable_appearance(icon, beaker.disp_icon)
	beaker_overlay.pixel_y = 8
	beaker_overlay.pixel_x = rand(-8, 8)
	return beaker_overlay
