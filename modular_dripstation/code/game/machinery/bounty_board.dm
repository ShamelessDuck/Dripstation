/obj/item/wallframe/bounty_board
	icon = 'modular_dripstation/icons/obj/frame.dmi'
	icon_state = "bounty_kiost"

/obj/machinery/bounty_board
	icon = 'modular_dripstation/icons/obj/terminals.dmi'
	icon_state = "bounty_off"
	light_range = 2
	light_power = 1
	light_color = LIGHT_COLOR_YELLOW
	var/icon_screen = "bounty"

/obj/machinery/bounty_board/update_overlays()
	. = ..()
	if(!(stat & (NOPOWER|BROKEN)))
		. += mutable_appearance(icon, icon_screen)
		. += emissive_appearance(icon, icon_screen, src)

/obj/machinery/bounty_board/power_change()
	. = ..()
	if(!.)
		return // reduce unneeded light changes
	if(stat & NOPOWER)
		set_light(0)
	else
		set_light(1)
