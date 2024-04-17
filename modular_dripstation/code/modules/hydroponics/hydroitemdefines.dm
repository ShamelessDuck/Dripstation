/obj/item/reagent_containers/glass/bottle/nutrient
	name = "plastic jug"
	icon_state = "plastic_jug"
	disp_icon = "disp_pjug"
	label_image = "label_plastic_jug"
	lid_image = "lid_plastic_jug"
	volume = 80
	resistance_flags = null
	w_class = WEIGHT_CLASS_NORMAL
	item_state = "pjug"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/equipment/chemistry_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/equipment/chemistry_righthand.dmi'
	pickup_sound = 'sound/items/handling/cardboardbox_pickup.ogg'
	drop_sound = 'modular_dripstation/sound/item/handling/jug_empty_impact.ogg'
	possible_transfer_amounts = list(5,10,20,40,80)

/obj/item/reagent_containers/glass/bottle/nutrient/on_reagent_change()
	. = ..()
	update_appearance(UPDATE_OVERLAYS)
	if(reagents.total_volume)
		var/fraction = reagents.total_volume / volume
		force = max(5 * fraction, 1)
		throwforce = max(5 * fraction, 1)
		hitsound = 'modular_dripstation/sound/item/handling/jug_filled_impact.ogg'
		drop_sound = 'modular_dripstation/sound/item/handling/jug_filled_impact.ogg'
	else
		force = 1
		throwforce = 1
		hitsound = 'modular_dripstation/sound/item/handling/jug_empty_impact.ogg'
		drop_sound = 'modular_dripstation/sound/item/handling/jug_empty_impact.ogg'

/obj/item/reagent_containers/glass/bottle/nutrient/update_overlays()
	. = ..()
	if(lid_state == TRUE)
		. += "lid_plastic_jug"

	if(label_state == TRUE)
		. += "label_plastic_jug"

/obj/item/reagent_containers/glass/bottle/nutrient/l4z
	icon_state = "plastic_jug_l4z"
	item_state = "pjugl4z"
	disp_icon = "disp_pjug_l4z"
	lid_state = TRUE
	list_reagents = list(/datum/reagent/plantnutriment/left4zednutriment = 80)

/obj/item/reagent_containers/glass/bottle/nutrient/ez
	icon_state = "plastic_jug_ez"
	item_state = "pjugez"
	disp_icon = "disp_pjug_ez"	
	lid_state = TRUE
	list_reagents = list(/datum/reagent/plantnutriment/eznutriment = 80)

/obj/item/reagent_containers/glass/bottle/nutrient/rh
	icon_state = "plastic_jug_rh"
	item_state = "pjugrh"	
	disp_icon = "disp_pjug_rh"	
	lid_state = TRUE
	list_reagents = list(/datum/reagent/plantnutriment/robustharvestnutriment = 80)

/obj/item/reagent_containers/glass/bottle/nutrient/empty
	name = "plastic jug"

/obj/item/reagent_containers/glass/bottle/killer
	label_state = TRUE
	lid_state = TRUE
