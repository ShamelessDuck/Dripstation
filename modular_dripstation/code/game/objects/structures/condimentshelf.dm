///////////////////
//Condiment Shelf//
///////////////////
// Placed in the kitchen
/obj/item/wallframe/condiment_shelf
	name = "condiment shelf"
	desc = "Its a small wooden shelf for spices and seasonings. All you need is to place it onto the wall. Buon appetito!"
	icon = 'modular_dripstation/icons/obj/cond_shelf.dmi'
	icon_state = "cond_shelf_item"
	item_state = "cond_shelf_item"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/food/kitchen_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/food/kitchen_righthand.dmi'
	result_path = /obj/structure/condiment_shelf
	w_class = WEIGHT_CLASS_SMALL
	force = 8
	throwforce = 10
	throw_speed = 2
	throw_range = 3
	attack_verb = list("bashed", "battered", "bludgeoned", "thrashed", "whacked")

/obj/structure/condiment_shelf //tau ceti port, custom sprites by me, as well as code edits
	name = "condiment shelf"
	desc = "Its a small wooden shelf for spices and seasonings. Buon appetito!"
	icon = 'modular_dripstation/icons/obj/cond_shelf.dmi'
	icon_state = "cond_shelf"
	anchored = TRUE
	density = FALSE
	opacity = FALSE

	var/max_items_inside = 6
	var/list/can_be_placed = list(/obj/item/reagent_containers/food/condiment,
								/obj/item/reagent_containers/food/condiment/sugar,
								/obj/item/reagent_containers/food/condiment/rice,
								/obj/item/reagent_containers/food/condiment/flour,
								/obj/item/reagent_containers/food/condiment/cinnamon,
								/obj/item/reagent_containers/food/condiment/pcandidum,
								/obj/item/reagent_containers/food/condiment/thermophilic,
								/obj/item/reagent_containers/food/condiment/proqueforti,
								/obj/item/reagent_containers/food/condiment/mesophilic,
								/obj/item/reagent_containers/food/condiment/mayonnaise,
								/obj/item/reagent_containers/food/condiment/soymilk,
								/obj/item/reagent_containers/food/condiment/milk,
								/obj/item/reagent_containers/food/condiment/soysauce,
								/obj/item/reagent_containers/food/condiment/enzyme,
								/obj/item/reagent_containers/food/condiment/saltshaker,
								/obj/item/reagent_containers/food/condiment/pack,
								/obj/item/reagent_containers/food/condiment/pack/ketchup,
								/obj/item/reagent_containers/food/condiment/pack/hotsauce,
								/obj/item/reagent_containers/food/condiment/pack/astrotame,
								/obj/item/reagent_containers/food/condiment/pack/chocolate,
								/obj/item/reagent_containers/food/condiment/pack/creamer,
								/obj/item/reagent_containers/food/condiment/pack/sugar,
								/obj/item/reagent_containers/food/condiment/peanutbutter,
								/obj/item/reagent_containers/food/condiment/pack/bbqsauce,
								/obj/item/reagent_containers/food/condiment/bbqsauce,
								/obj/item/reagent_containers/food/condiment/coldsauce,
								/obj/item/reagent_containers/food/condiment/hotsauce,
								/obj/item/reagent_containers/food/condiment/ketchup,
								/obj/item/reagent_containers/food/condiment/cornoil,
								/obj/item/reagent_containers/food/condiment/cream,
								/obj/item/reagent_containers/food/condiment/peppermill)

/obj/structure/condiment_shelf/Initialize(mapload, ndir, building)
	. = ..()
	if(mapload)
		for(var/obj/item/I in loc)
			if(I.type in can_be_placed)
				if(contents.len < max_items_inside)
					I.loc = src
	if(building)
		setDir(ndir)
		pixel_x = (dir & 3)? 0 : (dir == 4 ? -32 : 32)
		pixel_y = (dir & 3)? (dir ==1 ? -32 : 32) : 0
	update_appearance(UPDATE_OVERLAYS)

/obj/structure/condiment_shelf/attackby(obj/item/O, mob/user)
	if(istype(O, /obj/item/wrench))
		user.visible_message(span_warning("[user] starts to disassemble \the [src]."))
		if(do_after(user, 20, target = src))
			playsound(src, 'sound/items/Ratchet.ogg', 50, 1)
			new /obj/item/wallframe/condiment_shelf(src.loc)
			for(var/obj/item/I in contents)
				I.forceMove(get_turf(src))
			qdel(src)
		return

	if(O.type in can_be_placed)
		if(contents.len < max_items_inside)
			user.temporarilyRemoveItemFromInventory(O, src)
			O.loc = src
			update_appearance(UPDATE_OVERLAYS)
		else
			to_chat(user, span_rose("\The [src] is full!"))
	else
		to_chat(user, span_rose("What? This shelf is only for spices and sauces!"))

/obj/structure/condiment_shelf/attack_hand(mob/user)
	if(contents.len)
		var/obj/item/reagent_containers/food/condiment/choice = input("Which condiment would you like to remove from the shelf?") in contents
		if(choice)
			if(!Adjacent(usr) || usr.incapacitated())
				return
			if(ishuman(user))
				user.put_in_hands(choice)
			else
				choice.forceMove(get_turf(src))
			update_appearance(UPDATE_OVERLAYS)

/obj/structure/condiment_shelf/ex_act(severity)
	switch(severity)
		if(EXPLODE_DEVASTATE)
			for(var/obj/item/reagent_containers/food/condiment/b in contents)
				qdel(b)

		if(EXPLODE_HEAVY)
			for(var/obj/item/reagent_containers/food/condiment/b in contents)
				if(prob(50))
					b.forceMove(get_turf(src))
				else qdel(b)
		if(EXPLODE_LIGHT)
			if(prob(50))
				for(var/obj/item/reagent_containers/food/condiment/b in contents)
					b.forceMove(get_turf(src))
	qdel(src)

/obj/structure/condiment_shelf/update_overlays()
	. = ..()
	if(!contents.len)
		return
	var/cond_number = 0
	for(var/obj/item/F in contents)
		if(F.type in can_be_placed)
			var/mutable_appearance/condiment = mutable_appearance(icon, "[initial(F.icon_state)]")
			condiment.pixel_x += cond_number
			. += condiment
			cond_number += 4
