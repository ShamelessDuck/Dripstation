/obj/machinery/power/supermatter_crystal
	icon = 'modular_dripstation/icons/obj/supermatter.dmi'
	appearance_flags = PIXEL_SCALE // no tile bound to allow distortion to render outside of direct view
	///Effect holder for the displacement filter to distort the SM based on its activity level
	var/atom/movable/distortion_effect/distort

	var/last_status

/atom/movable/distortion_effect
	name = ""
	plane = GRAVITY_PULSE_PLANE
	appearance_flags = PIXEL_SCALE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	icon = 'modular_dripstation/icons/effects/96x96.dmi'
	icon_state = "SM_base"
	pixel_x = -32
	pixel_y = -32

/obj/machinery/power/supermatter_crystal/Destroy()
	investigate_log("has been destroyed.", INVESTIGATE_SUPERMATTER)
	SSair.stop_processing_machine(src)
	QDEL_NULL(radio)
	GLOB.poi_list -= src
	QDEL_NULL(countdown)
	if(is_main_engine && GLOB.main_supermatter_engine == src)
		GLOB.main_supermatter_engine = null
	QDEL_NULL(soundloop)
	distort.icon = 'modular_dripstation/icons/effects/32x32.dmi'
	distort.icon_state = "SM_remnant"
	distort.pixel_x = 0
	distort.pixel_y = 0
	distort.forceMove(get_turf(src))
	distort = null
	return ..()

/obj/machinery/power/supermatter_crystal/proc/update_displacement()
	cut_overlay(distort)
	switch(last_status)
		if(SUPERMATTER_INACTIVE)
			distort.icon = 'modular_dripstation/icons/effects/96x96.dmi'
			distort.icon_state = "SM_base"
			distort.pixel_x = -32
			distort.pixel_y = -32
		if(SUPERMATTER_NORMAL, SUPERMATTER_NOTIFY, SUPERMATTER_WARNING)
			distort.icon = 'modular_dripstation/icons/effects/96x96.dmi'
			distort.icon_state = "SM_base_active"
			distort.pixel_x = -32
			distort.pixel_y = -32
		if(SUPERMATTER_DANGER)
			distort.icon = 'modular_dripstation/icons/effects/160x160.dmi'
			distort.icon_state = "SM_delam_1"
			distort.pixel_x = -64
			distort.pixel_y = -64
		if(SUPERMATTER_EMERGENCY)
			distort.icon = 'modular_dripstation/icons/effects/224x224.dmi'
			distort.icon_state = "SM_delam_2"
			distort.pixel_x = -96
			distort.pixel_y = -96
		if(SUPERMATTER_DELAMINATING)
			distort.icon = 'modular_dripstation/icons/effects/288x288.dmi'
			distort.icon_state = "SM_delam_3"
			distort.pixel_x = -128
			distort.pixel_y = -128
	add_overlay(distort)
