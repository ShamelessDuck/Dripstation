/obj/machinery/modular_computer/console
	icon = 'modular_dripstation/icons/obj/modular_console.dmi'
	var/icon_keyboard = "generic_key"

/obj/machinery/modular_computer/console/update_overlays()
	. = ..()
	if(stat & NOPOWER)
		. += mutable_appearance(icon, "[icon_keyboard]_off")
	else
		. += mutable_appearance(icon, icon_keyboard)
		. += emissive_appearance(icon, icon_keyboard, src)

/obj/machinery/modular_computer/update_appearance(updates)
	. = ..()
	set_light(cpu?.enabled ? light_strength : 0, l_range = light_strength)
