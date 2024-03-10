/obj/machinery/holopad
	icon = 'modular_dripstation/icons/obj/stationobjs.dmi'

/obj/machinery/holopad/update_overlays()
	. = ..()
	var/total_users = LAZYLEN(masters) + LAZYLEN(holo_calls)
	if(ringing)
		. += mutable_appearance(icon, "holopad_ringing_lightmask")
		. += emissive_appearance(icon, "holopad_ringing_lightmask", src)
	else if(total_users || replay_mode)
		. += mutable_appearance(icon, "holopad1_lightmask")
		. += emissive_appearance(icon, "holopad1_lightmask", src)
