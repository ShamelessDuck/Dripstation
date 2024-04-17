/obj/item/storage/lockbox/medal
	icon = 'modular_dripstation/icons/obj/storage.dmi'

/obj/item/storage/lockbox/vialbox
	icon = 'modular_dripstation/icons/obj/vial_box.dmi'
	item_state = "vialbox"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/equipment/chemistry_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/equipment/chemistry_righthand.dmi'
	drop_sound = 'sound/items/handling/cardboardbox_drop.ogg'
	pickup_sound =  'sound/items/handling/cardboardbox_pickup.ogg'

/obj/item/storage/lockbox/vialbox/Initialize(mapload)
	. = ..()
	update_appearance(UPDATE_OVERLAYS)

/obj/item/storage/lockbox/vialbox/attackby(obj/item/W, mob/user, params)
	. = ..()
	update_appearance(UPDATE_OVERLAYS)

/obj/item/storage/lockbox/vialbox/AltClick(mob/user)
	..()
	update_appearance(UPDATE_OVERLAYS)

/obj/item/storage/lockbox/vialbox/update_overlays()
	. = ..()
	var/locked = SEND_SIGNAL(src, COMSIG_IS_STORAGE_LOCKED)
	var/slot = 1
	for(var/obj/item/reagent_containers/glass/G in contents)
		var/mutable_appearance/vial = mutable_appearance(icon, "vialboxvial[slot]")
		var/mutable_appearance/filling = mutable_appearance(icon, "vialboxvial[slot]-")
		if(G.reagents.total_volume)
			var/percent = round((G.reagents.total_volume / G.volume) * 100)
			switch(percent)
				if(75 to 79)
					filling.icon_state = "vialboxvial[slot]-75"
				if(80 to 90)
					filling.icon_state = "vialboxvial[slot]-80"
				if(91 to INFINITY)
					filling.icon_state = "vialboxvial[slot]-100"

			filling.color = mix_color_from_reagents(G.reagents.reagent_list)
		. += vial
		. += filling
		slot++
	if(!broken)
		. += mutable_appearance(icon, "led[locked]")
		. += emissive_appearance(icon, "led[locked]", src)
		if(locked == TRUE)
			. += mutable_appearance(icon, "vialbox_cap")
			item_state = "vialbox_secure"
		else
			item_state = "vialbox"
