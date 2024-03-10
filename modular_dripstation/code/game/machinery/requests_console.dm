/obj/machinery/requests_console
	icon = 'modular_dripstation/icons/obj/terminals.dmi'
	icon_state = "req_comp_off"
	base_icon_state = "req_comp"
	light_range = 2
	light_power = 1
	light_color = LIGHT_COLOR_GREEN

/obj/machinery/requests_console/update_overlays()
	. = ..()

	if(open)
		. += mutable_appearance(icon, "req_comp_open")

	if(open || (stat & NOPOWER))
		return

	var/screen_state
	if(emergency || (newmessagepriority == REQ_EXTREME_MESSAGE_PRIORITY))
		screen_state = "[base_icon_state]3"
		light_color = LIGHT_COLOR_INTENSE_RED
	else if(newmessagepriority == REQ_HIGH_MESSAGE_PRIORITY)
		screen_state = "[base_icon_state]2"
		light_color = LIGHT_COLOR_GREEN
	else if(newmessagepriority == REQ_NORMAL_MESSAGE_PRIORITY)
		screen_state = "[base_icon_state]1"
		light_color = LIGHT_COLOR_GREEN
	else
		screen_state = "[base_icon_state]0"
		light_color = LIGHT_COLOR_GREEN
	. += mutable_appearance(icon, screen_state)
	. += emissive_appearance(icon, screen_state, src, alpha = src.alpha)

/obj/machinery/gulag_item_reclaimer/power_change()
	. = ..()
	if(!.)
		return // reduce unneeded light changes
	if(stat & NOPOWER)
		set_light(1)
	else
		set_light(0)

/obj/machinery/requests_console/examine(mob/user)
	. = ..()
	if(!open)
		. += span_notice("It looks like you can pry open the panel with <b>a crowbar</b>.")
	else
		. += span_warning("The panel was pried open, you can close it with <b>a crowbar</b>.")

	if(hackState)
		. += span_warning("The console seems to have been tampered with!")
