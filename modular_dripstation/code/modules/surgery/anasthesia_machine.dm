/obj/machinery/anesthetic_machine
	icon = 'modular_dripstation/icons/obj/iv_drip.dmi'

/obj/machinery/anesthetic_machine/Moved(atom/old_loc, movement_dir, forced, list/old_locs, momentum_change)
	. = ..()
	if(has_gravity())
		playsound(src, 'sound/effects/roll.ogg', 30, 1)
