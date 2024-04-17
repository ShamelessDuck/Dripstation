/obj/item/reagent_containers/blood
	icon = 'modular_dripstation/icons/obj/bloodpack.dmi'

/obj/item/reagent_containers/blood/Initialize(mapload)
	. = ..()
	update_appearance(UPDATE_OVERLAYS)

/obj/item/reagent_containers/blood/update_overlays()
	. = ..()

	var/v = min(round(reagents.total_volume / volume * 10), 10)
	if(v > 0)
		var/mutable_appearance/filling = mutable_appearance('icons/obj/reagentfillings.dmi', "bloodpack1")
		filling.icon_state = "bloodpack[v]"
		filling.color = mix_color_from_reagents(reagents.reagent_list)
		. += filling

	if(blood_type)
		. += "[blood_type]"

/obj/item/reagent_containers/blood/ethereal/update_overlays()
	. = ..()
	. += "LE"

/obj/item/reagent_containers/blood/ethereal/update_name()
	. = ..()
	if(!labelled)
		name = "blood pack - LE"
