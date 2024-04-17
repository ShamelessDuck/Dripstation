/obj/machinery/iv_drip
	icon = 'modular_dripstation/icons/obj/iv_drip.dmi'
	var/datum/beam/current_beam
	base_pixel_x = 9

/obj/machinery/iv_drip/proc/update_beam()
	if(current_beam && !attached)
		QDEL_NULL(current_beam)
	else if(!current_beam && attached && !QDELETED(src))
		current_beam = Beam(attached, "iv_tube", 'modular_dripstation/icons/effects/beam.dmi', beam_type = /obj/effect/ebeam/ivdrip, emissive = FALSE, override_origin_pixel_x = base_pixel_x)

/obj/machinery/iv_drip/Moved(atom/old_loc, movement_dir, forced, list/old_locs, momentum_change)
	. = ..()
	if(has_gravity())
		playsound(src, 'sound/effects/roll.ogg', 30, 1)

/obj/effect/ebeam/ivdrip
	layer = OBJ_LAYER
