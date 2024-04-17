/obj/structure/chair
	icon = 'modular_dripstation/icons/obj/chairs.dmi'

/obj/structure/chair/comfy/brown
	color = rgb(141,70,0)

/obj/structure/chair/comfy/beige
	color = rgb(255,253,195)

/obj/structure/chair/comfy/teal
	color = rgb(0,234,250)

/obj/structure/chair/comfy/black
	color = rgb(60,60,60)

/obj/structure/chair/comfy/lime
	color = rgb(255,251,0)

/obj/structure/chair/office/Moved(atom/old_loc, movement_dir, forced, list/old_locs, momentum_change)
	. = ..()
	if(has_gravity())
		playsound(src, 'sound/effects/roll.ogg', 20, 1)
