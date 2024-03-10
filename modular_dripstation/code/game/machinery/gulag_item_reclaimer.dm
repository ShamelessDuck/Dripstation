/obj/machinery/gulag_item_reclaimer
	icon = 'modular_dripstation/icons/obj/terminals.dmi'
	icon_state = "gulag_off"
	light_range = 2
	light_power = 1
	light_color = LIGHT_COLOR_BLUE
	///Icon of the current screen status
	var/screen_icon = "gulag_on"

/obj/machinery/gulag_item_reclaimer/update_overlays()
	. = ..()
	if(stat & (NOPOWER|BROKEN))
		return

	. += mutable_appearance(icon, screen_icon)
	. += emissive_appearance(icon, screen_icon, src)

/obj/machinery/gulag_item_reclaimer/power_change()
	. = ..()
	if(!.)
		return // reduce unneeded light changes
	if(stat & NOPOWER)
		set_light(0)
	else
		set_light(1)
