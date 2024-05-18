#define DOUBLE_BAND 2
#define TRIPLE_BAND 3

/obj/item/weapon/dart
	name = "red throwing dart"
	desc = "A dart. For throwing. This one's red."
	icon = 'modular_dripstation/icons/obj/toy.dmi'
	icon_state = "red_dart"
	force = 0
	throwforce = 0
	throw_speed = 2
	throw_range = 5
	hitsound = 'modular_dripstation/sound/effects/bladeslice.ogg'
	attack_verb = list("stabbed", "poked", "attacked")
	sharpness = SHARP_POINTY 

/obj/structure/darts_board/Initialize(mapload, ndir, building)
	. = ..()
	if(building)
		setDir(ndir)
		pixel_x = (dir & 3)? 0 : (dir == 4 ? -32 : 32)
		pixel_y = (dir & 3)? (dir ==1 ? -32 : 32) : 0

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/darts_board, 32)

/obj/item/wallframe/darts_board
	name = "darts board frame"
	icon_state = "darts_board"
	icon = 'modular_dripstation/icons/obj/stationobjs.dmi'
	result_path = /obj/structure/darts_board
	force = 10
	attack_verb = list("bashed", "battered", "bludgeoned", "thrashed", "whacked")

/obj/structure/darts_board 
	name = "darts board"
	desc = "A darts board made out of wood."
	icon_state = "darts_board"
	icon = 'modular_dripstation/icons/obj/stationobjs.dmi'
	anchored = TRUE
	pass_flags = PASSMOB | PASSTABLE

/obj/structure/darts_board/CanAllowThrough(atom/movable/mover, turf/target)
	. = ..()
	if(mover.throwing)
		return FALSE
	return TRUE

/obj/structure/darts_board/examine()
	. = ..()
	if(length(contents))
		var/is_are = "is"
		if(length(contents) != 1)
			is_are = "are"

		. += span_notice("There [is_are] [length(contents)] item\s embedded into [src].")

/obj/structure/darts_board/attackby(obj/item/I, mob/living/user, params)
	. = ..()
	visible_message(span_danger("[I] hits [src], collapsing it!"))
	collapse()

/obj/structure/darts_board/proc/flush_contents()
	for(var/atom/movable/embedded_items as anything in contents)
		embedded_items.forceMove(loc)

/obj/structure/darts_board/proc/collapse()
	playsound(src, 'modular_dripstation/sound/effects/thud1.ogg', 50)
	new /obj/item/wallframe/darts_board/(loc)
	qdel(src)

/obj/structure/darts_board/attack_hand(mob/user)
	if(length(contents))
		user.visible_message(span_notice("[user] starts recovering items from [src]..."), span_notice("You start recovering items from [src]..."))
		if(do_after(user, 1 SECONDS, user))
			flush_contents()
	else
		to_chat(user, span_warning("[src] has nothing embedded!"))

/obj/structure/darts_board/Destroy()
	flush_contents()
	.  = ..()

/obj/structure/darts_board/hitby(atom/movable/AM, skipcatch, hitpush, blocked, datum/thrownthing/throwingdatum)
	var/obj/item/I = AM
	if(I.sharpness != SHARP_POINTY && !istype(I, /obj/item/weapon/dart))
		visible_message(span_danger("[I] hits [src], collapsing it!"))
		collapse()
		return

	contents += I
	playsound(src, 'modular_dripstation/sound/effects/tablehit1.ogg', 50)
	var/score = rand(1,21)
	if(score == 21)
		visible_message(span_danger("[I] embeds into [src], striking the bullseye! 50 points."))
		return

	var/band = "single"
	var/band_number = rand(1,3)
	score *= band_number
	switch(band_number)
		if(DOUBLE_BAND)
			band = "double"
		if(TRIPLE_BAND)
			band = "triple"
	visible_message(span_danger("[I] embeds into [src], striking [band] for [score] point\s."))
	return ..()

/obj/structure/darts_board/attackby(obj/item/item, mob/user)
	user.visible_message(span_danger("[user] hits [src] with [item], collapsing it!"), span_danger("You collapse [src] with [item]!"))
	collapse()

/obj/structure/darts_board/MouseDrop(over_object, src_location, over_location)
	. = ..()
	if(over_object != usr || !Adjacent(usr))
		return
		
	if(!ishuman(usr))
		return

	visible_message(span_notice("[usr] unsecures [src]."))
	var/obj/item/wallframe/darts_board/unsecured_board = new(loc)
	usr.put_in_hands(unsecured_board)
	qdel(src)

#undef DOUBLE_BAND
#undef TRIPLE_BAND
