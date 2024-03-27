/obj/item/wallframe/newscaster
	icon = 'modular_dripstation/icons/obj/frame.dmi'

/obj/machinery/newscaster
	icon = 'modular_dripstation/icons/obj/terminals.dmi'
	icon_state = "newscaster_off"
	light_range = 2
	light_power = 1
	light_color = LIGHT_COLOR_GREEN	
	base_icon_state = "newscaster"

/obj/machinery/newscaster/power_change()
	. = ..()
	if(!.)
		return // reduce unneeded light changes
	if(stat & NOPOWER)
		set_light(0)
	else
		set_light(1)

/obj/machinery/newscaster/update_overlays()
	. = ..()


	if(!(stat & (NOPOWER|BROKEN)))
		var/state = "[base_icon_state]_[GLOB.news_network.wanted_issue.active ? "wanted" : "normal"]"
		. += mutable_appearance(icon, state)
		. += emissive_appearance(icon, state, src, alpha = src.alpha)

		if(GLOB.news_network.wanted_issue.active && alert)
			. += mutable_appearance(icon, "[base_icon_state]_alert")
			. += emissive_appearance(icon, "[base_icon_state]_alert", src, alpha = src.alpha,)

	var/hp_percent = atom_integrity  * 100 / max_integrity
	switch(hp_percent)
		if(75 to 100)
			return
		if(50 to 75)
			. += "crack1"
			. += emissive_blocker(icon, "crack1", src, alpha = src.alpha)
		if(25 to 50)
			. += "crack2"
			. += emissive_blocker(icon, "crack2", src, alpha = src.alpha)
		else
			. += "crack3"
			. += emissive_blocker(icon, "crack3", src, alpha = src.alpha)
