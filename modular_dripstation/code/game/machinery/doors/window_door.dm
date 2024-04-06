/obj/machinery/door/window
	var/cancolor = TRUE

/obj/machinery/door/window/Initialize(mapload, set_dir, unres_sides)
	. = ..()
	if(!color && cancolor)
		color = color_windows(src)

/obj/machinery/door/window/clockwork
	cancolor = FALSE


