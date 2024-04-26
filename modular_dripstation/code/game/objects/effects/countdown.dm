/obj/effect/countdown
	plane = TEXT_EFFECT_PLANE

/obj/effect/countdown/supermatter/get_value()
	var/obj/machinery/power/supermatter_crystal/S = attached_to
	if(!istype(S))
		return
	return "<div align='center' valign='bottom' style='position:relative; top:0px; left:0px'>[round(S.get_integrity(), 1)]%</div>"
