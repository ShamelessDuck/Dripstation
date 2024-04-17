/datum/reagent/reaction_turf(turf/T, reac_volume)
	if(reagent_state == LIQUID) //LIQUID
		for(var/obj/effect/decal/cleanable/chempile/c in T.contents)//handles merging existing chempiles
			if(c.reagents)
				c.reagents.add_reagent(type, volume * 0.5)
				var/mixcolor = mix_color_from_reagents(c.reagents.reagent_list)
				c.add_atom_colour(mixcolor, FIXED_COLOUR_PRIORITY)
				if(c.reagents && c.reagents.total_volume < 5 & NO_REACT)
					DISABLE_BITFIELD(c.reagents.flags, NO_REACT)
				return TRUE

		var/obj/effect/decal/cleanable/chempile/C = new (T)//otherwise makes a new one
		if(C.reagents)
			C.reagents.add_reagent(type, volume * 0.5)
			var/mixcolor = mix_color_from_reagents(C.reagents.reagent_list)
			C.add_atom_colour(mixcolor, FIXED_COLOUR_PRIORITY)

	if(reagent_state == SOLID) //SOLID
		for(var/obj/item/reagent_containers/food/snacks/solid_reagent/SR in T.contents)
			if(SR.reagents && SR.reagent_type == type && SR.reagents.total_volume < 200)
				SR.reagents.add_reagent(type, volume * 0.5)
				return TRUE

		var/obj/item/reagent_containers/food/snacks/solid_reagent/Sr = new (T)
		Sr.reagents.add_reagent(type, volume * 0.5)
		Sr.reagent_type = type
		Sr.name = "solidified [src]"
		Sr.add_atom_colour(color, FIXED_COLOUR_PRIORITY)
		Sr.filling_color = color
	else
		return
