/obj/machinery/seed_extractor
	icon = 'modular_dripstation/icons/obj/hydroponics/equipment.dmi'
	light_color = LIGHT_COLOR_CYAN
	var/active_screen_icon = "sextractor_on"

/obj/machinery/seed_extractor/update_appearance(updates=ALL)
	. = ..()
	if(stat & (NOPOWER|BROKEN))
		set_light(0)
		return
	set_light(powered() ? MINIMUM_USEFUL_LIGHT_RANGE : 0)

/obj/machinery/seed_extractor/update_overlays()
	. = ..()
	if(!(stat & (NOPOWER|BROKEN)))
		switch(panel_open)
			if(TRUE)
				active_screen_icon = "sextractor_open_screen"
			if(FALSE)
				active_screen_icon = "sextractor_on"
		. += active_screen_icon
		. += emissive_appearance(icon, active_screen_icon, src)
