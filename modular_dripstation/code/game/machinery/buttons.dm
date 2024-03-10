/obj/machinery/button
	icon = 'modular_dripstation/icons//obj/stationobjs.dmi'
	var/light_mask
	var/panel_icon = "button-open"

/obj/machinery/button/update_overlays()
	. = ..()
	if(panel_open)
		return
	if(!(stat & BROKEN) && powered())
		. += emissive_appearance(icon, light_mask, src)

/obj/machinery/button/flasher
	light_mask = "launcher_light_mask"
	panel_icon = "launcher-open"
	light_color = COLOR_SOFT_RED

/obj/machinery/button/door
	light_mask = "doorctrl_light_mask"

/obj/machinery/button/massdriver
	light_mask = "launcher_light_mask"
	panel_icon = "launcher-open"
	light_color = COLOR_SOFT_RED

/obj/machinery/button/ignition 
	light_mask = "launcher_light_mask"
	panel_icon = "launcher-open"
	light_color = COLOR_SOFT_RED

/obj/machinery/button/crematorium
	light_mask = "launcher_light_mask"
	panel_icon = "launcher-open"
	light_color = COLOR_SOFT_RED

/obj/machinery/button/holosign
	light_mask = "doorctrl_light_mask"
