/obj/effect/explosion/delamination
	name = "delamination"
	icon_state = "sm_shatter"
	plane = ABOVE_LIGHTING_PLANE
	appearance_flags = PIXEL_SCALE

/obj/effect/explosion/delamination/Initialize(mapload)
	. = ..()
	QDEL_IN(src, 18)

/obj/effect/explosion/delamination/inner
	icon = 'modular_dripstation/icons/effects/512x512.dmi'
	pixel_x = -240
	pixel_y = -240

/obj/effect/explosion/delamination/outer
	icon = 'modular_dripstation/icons/effects/1024x1024.dmi'
	pixel_x = -496
	pixel_y = -496

/datum/effect_system/explosion/delamination

/datum/effect_system/explosion/delamination/start()
	new /obj/effect/explosion/delamination/inner(location)
	new /obj/effect/explosion/delamination/outer(location)
