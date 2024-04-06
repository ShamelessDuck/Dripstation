/obj/machinery/button
	icon = 'modular_dripstation/icons/obj/stationobjs.dmi'
	var/light_mask
	var/panel_icon = "button-open"

/obj/machinery/button/update_overlays()
	. = ..()
	if(panel_open)
		return
	if(!(stat & BROKEN) && powered())
		if(!light_mask)
			return
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

/obj/machinery/button/windowtint
	name = "window tint control"
	icon_state = "ligh-c"
	desc = "A remote control switch for polarized windows."
	icon = 'modular_dripstation/icons/obj/power.dmi'
	panel_icon = "light-w"
	skin = "ligh-c"
	var/range = 7
	var/active = 0
	var/tint_id

/obj/machinery/button/windowtint/attack_hand(mob/user)
	if(..())
		return 1

	toggle_tint()

/obj/machinery/button/windowtint/proc/toggle_tint()
	use_power(5)

	active = !active
	update_icon()

	for(var/obj/structure/window/reinforced/fulltile/polarized/W in range(src,range))
		if(W.tint_id == src.tint_id || !W.tint_id)
			spawn(0)
				W.toggle()
				return
	for(var/obj/machinery/door/airlock/G in range(src,range))
		if(G.id_tag == src.tint_id)
			spawn(0)
				if(G.glass)
					G.airlock_material = null
					G.glass = FALSE
					G.update_icon()
					if(G.density)
						G.opacity = 1
				else
					G.airlock_material = "glass"
					G.glass = TRUE
					G.update_icon()
					G.opacity = 0
				return

/obj/machinery/button/windowtint/power_change()
	..()
	if(active && !powered(power_channel))
		toggle_tint()

/obj/machinery/button/windowtint/update_overlays()
	. = ..()
	if(stat & (NOPOWER|BROKEN))
		return
	if(panel_open)
		return
	. += mutable_appearance(icon, "[src.active ? "light1" : "light0"]")
	. += emissive_appearance(icon, "[src.active ? "light1" : "light0"]", src)

/obj/machinery/button/windowtint/update_icon_state()
	. = ..()
