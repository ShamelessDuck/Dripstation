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
