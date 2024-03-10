////////////////////HOLOSIGN///////////////////////////////////////
/obj/machinery/holosign
	icon = 'modular_dripstation/icons/obj/holosign.dmi'

/obj/machinery/holosign/update_overlays()
	. = ..()
	if(!lit)
		set_light(0)
	else
		. += mutable_appearance(icon, on_icon)
		. += emissive_appearance(icon, on_icon, src)
		set_light(1, 0.5, l_color = light_color)

/obj/machinery/holosign/surgery
	light_color = COLOR_BLUE_LIGHT

/obj/machinery/holosign/virology
	name = "virology holosign"
	desc = "Small wall-mounted holographic projector. This one reads BIOHAZARD."
	on_icon = "virology"
	light_color = LIGHT_COLOR_ELECTRIC_GREEN

/obj/machinery/holosign/morgue
	name = "morgue holosign"
	desc = "Small wall-mounted holographic projector. This one reads MORGUE."
	on_icon = "morgue"
	light_color = COLOR_BLUE_LIGHT
