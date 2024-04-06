/obj/item/ashtray //a total abomination of code from vg, bay and whatever else and sprites made most likely by vgstation, but i made some heavy edits here code and feature wise
	name = "plastic ashtray"
	desc = "Cheap plastic ashtray, a thing to keep your butts in."
	icon_state = "ashtray_white"
	base_icon_state = "ashtray_white"
	icon = 'modular_dripstation/icons/obj/ashtray.dmi'
	materials = list(/datum/material/plastic = 100)
	var/broken = FALSE

/obj/item/ashtray/attackby(obj/item/W, mob/user)
	if(broken)
		to_chat(user, span_warning("\The [src] is broken!"))
		return
	if (user.a_intent == INTENT_HARM)
		..()
		return

	if(istype(W,/obj/item/clothing/mask/cigarette) || istype(W, /obj/item/match) || istype(W, /obj/item/cigbutt))
		if(!user)
			return
		if(contents.len >= max_butts)
			to_chat(user, span_warning("\The [src] is full."))
			return
		if(HAS_TRAIT(W, TRAIT_NODROP))
			to_chat(user, span_warning("You can't let go of \the [W]!"))
			return
		if(istype(W, /obj/item/clothing/mask/cigarette/pipe))
			var/obj/item/clothing/mask/cigarette/cig = W
			to_chat(user, span_notice("You put out [W] and empty ash into [src]."))
			cig.lit = FALSE
			return
		if(istype(W, /obj/item/cigbutt))
			to_chat(user, span_notice("You drop the [W] into [src]."))
			user.transferItemToLoc(W, src)
			update_appearance(UPDATE_ICON_STATE)
		else if (istype(W, /obj/item/clothing/mask/cigarette) || istype(W, /obj/item/match))
			var/obj/item/clothing/mask/cigarette/cig = W
			var/obj/item/match/firestarter = W
			if(cig.lit == 1)
				visible_message(span_notice("[user] crushes [cig] in [src][cig.lit == TRUE ? ", putting it out" : ""]."))
				if(istype(cig, /obj/item/match))
					firestarter.matchburnout()
					user.transferItemToLoc(firestarter, src)
				if(istype(cig, /obj/item/clothing/mask/cigarette))
					new cig.type_butt(src)
					playsound(src, 'modular_dripstation/sound/item/cigs_lighters/cig_snuff.ogg', 50, 1)
					qdel(cig)
				update_appearance(UPDATE_ICON_STATE)
			else if(cig.lit == 0)
				to_chat(user, span_notice("You place [cig] in [src] without even lighting it. Why would you do that?"))
				user.transferItemToLoc(W, src)
				update_appearance(UPDATE_ICON_STATE)
			else if(firestarter.burnt == 1)
				visible_message(span_notice("[user] places [cig] in [src]."))
				user.transferItemToLoc(W, src)
				update_appearance(UPDATE_ICON_STATE)
		add_fingerprint(user)
		return
	to_chat(user, span_danger("You hit [src] with [W]."))

	..()

/obj/item/ashtray/proc/shatter()
	broken = TRUE
	icon_state = "[base_icon_state]_broken"
	hitsound = 'sound/weapons/bladeslice.ogg'
	visible_message(span_danger("\The [src] breaks into pieces!"))
	playsound(src, "shatter", 50, 1)
	update_appearance(UPDATE_ICON_STATE)

/obj/item/ashtray/proc/empty()
	for(var/obj/O in contents)
		O.forceMove(drop_location())

/obj/item/ashtray/throw_impact(atom/hit_atom)
	if(contents.len)
		empty()
	if(prob(15))
		shatter()
	update_appearance(UPDATE_ICON_STATE)
	return ..()

/obj/item/ashtray/attack_self(mob/user)
	visible_message(span_danger("[user] shakes contents out of [src]!"))
	empty()

/obj/item/ashtray/update_icon_state()
	. = ..()
	if(!contents.len && !broken)
		icon_state = base_icon_state
	if(contents.len == max_butts)
		icon_state = "[base_icon_state]_full"
	else if(contents.len >= max_butts * 0.5)
		icon_state = "[base_icon_state]_half"
	else if(contents.len >= 1)
		icon_state = "[base_icon_state]_one"

/obj/item/ashtray/small
	name = "small metallic ashtray"
	desc = "Compact metal ashtray, a thing to keep your butts in, but can fit less than its cousins."
	icon_state = "ashtray_small"
	base_icon_state = "ashtray_small"
	materials = list(/datum/material/iron = 60)
	max_butts = 6

/obj/item/ashtray/black
	name = "metallic ashtray"
	desc = "Sleek ashtray, a thing to keep your butts in, this one looks a bit more evil."
	icon_state = "ashtray_black"
	base_icon_state = "ashtray_black"
	materials = list(/datum/material/iron = 100)

/obj/item/ashtray/bronze
	name = "bronze ashtray"
	desc = "Fancy bronze ashtray, a thing to keep your butts in, this one has a strong smell to it."
	icon_state = "ashtray_brown"
	base_icon_state = "ashtray_brown"
	materials = list(/datum/material/iron = 120)
	max_butts = 12

/obj/item/ashtray/glass
	name = "glass ashtray"
	desc = "Clear glass ashtray, a thing to keep your butts in, has a nice view on all the trash."
	icon_state = "ashtray_glass"
	base_icon_state = "ashtray_glass"
	materials = list(/datum/material/glass = 100)

