/datum/reagents
	var/next_react = 0

/datum/reagent/proc/handle_state_change(turf/T, volume, atom)
	if(!QDELETED(src))	//otherwise it starts getting called on null holders
		var/touch_msg
		var/mob/living/touch_mob
		if(!istype(T))
			return
		if(is_type_in_typecache(T, GLOB.statechange_turf_blacklist))
			return
		if(!volume)
			return
		if(volume * 0.5 < 1)
			return
		if(atom)
			if(is_type_in_typecache(atom, GLOB.no_reagent_statechange_typecache))
				return
			if(istype(atom, /obj/item))
				var/obj/item/I = atom
				touch_mob = I.fingerprintslast
				if(istype(touch_mob))
					touch_msg = get_mob_by_key(touch_mob)
					touch_msg = "[ADMIN_LOOKUPFLW(touch_msg)]"

		if(is_type_in_typecache(src, GLOB.statechange_reagent_blacklist)) //Reagent states are interchangeable, so one blacklist to rule them all.
			return
		if(reagent_state == LIQUID) //LIQUID
			if(is_type_in_typecache(src, GLOB.vaporchange_reagent_blacklist)) //this is to prevent lube and clf3 from making chempiles
				return
			if(atom && istype(atom, /obj/effect/particle_effect))
				volume *= LIQUID_PARTICLE_EFFECT_EFFICIENCY//big nerf to smoke and foam duping

			for(var/obj/effect/decal/cleanable/chempile/c in T.contents)//handles merging existing chempiles
				if(c.reagents)
					if(touch_msg)
						c.add_fingerprint(touch_mob)
					c.reagents.add_reagent(type, volume * 0.25)
					var/mixcolor = mix_color_from_reagents(c.reagents.reagent_list)
					c.add_atom_colour(mixcolor, FIXED_COLOUR_PRIORITY)
					if(c.reagents && c.reagents.total_volume < 5 & NO_REACT)
						DISABLE_BITFIELD(c.reagents.flags, NO_REACT)
					return TRUE

			var/obj/effect/decal/cleanable/chempile/C = new (T)//otherwise makes a new one
			if(C.reagents)
				if(touch_msg)
					C.add_fingerprint(touch_mob)
				C.reagents.add_reagent(type, volume * 0.25)
				var/mixcolor = mix_color_from_reagents(C.reagents.reagent_list)
				C.add_atom_colour(mixcolor, FIXED_COLOUR_PRIORITY)

		if(reagent_state == SOLID) //SOLID
			if(is_type_in_typecache(src, GLOB.solidchange_reagent_blacklist))
				return
			if(atom && istype(atom, /obj/effect/particle_effect))
				volume *= SOLID_PARTICLE_EFFECT_EFFICIENCY//big nerf to smoke and foam duping

			for(var/obj/item/reagent_containers/food/snacks/solid_reagent/SR in T.contents)
				if(SR.reagents && SR.reagent_type == type && SR.reagents.total_volume < 200)
					if(touch_msg)
						SR.add_fingerprint(touch_mob)
					SR.reagents.add_reagent(type, volume * 0.25)
					return TRUE

			var/obj/item/reagent_containers/food/snacks/solid_reagent/Sr = new (T)
			if(touch_msg)
				Sr.add_fingerprint(touch_mob)
			Sr.reagents.add_reagent(type, volume * 0.25)
			Sr.reagent_type = type
			Sr.name = "solidified [src]"
			Sr.add_atom_colour(color, FIXED_COLOUR_PRIORITY)
			Sr.filling_color = color
		else
			return
