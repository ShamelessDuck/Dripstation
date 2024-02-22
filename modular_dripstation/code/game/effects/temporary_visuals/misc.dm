/obj/effect/temp_visual/annoyed
	name = "annoyed"
	icon = 'modular_dripstation/icons/effects/effects.dmi'
	icon_state = "annoyed"
	duration = 25

/obj/effect/temp_visual/annoyed/Initialize(mapload)
	. = ..()
	pixel_x = rand(-4,0)
	pixel_y = rand(8,12)
	animate(src, pixel_y = pixel_y + 16, alpha = 0, time = duration)