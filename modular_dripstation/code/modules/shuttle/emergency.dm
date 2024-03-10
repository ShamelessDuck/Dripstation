/obj/machinery/computer/shuttle/pod
	icon = 'modular_dripstation/icons/obj/terminals.dmi'
	icon_state = "wallconsole"
	icon_screen = "wallconsole_navigation"
	light_color = LIGHT_COLOR_CYAN

/obj/machinery/computer/shuttle/pod/update_overlays()
	. = ..()
	if(stat & (NOPOWER|BROKEN))
		return

	. += mutable_appearance(icon, icon_screen)
	. += emissive_appearance(icon, icon_screen, src)
