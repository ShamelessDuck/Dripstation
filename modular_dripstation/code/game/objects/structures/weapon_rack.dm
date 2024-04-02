/obj/structure/weapon_rack
	name = "weapon rack"
	desc = "A wooden rack designated to store weapons. Has ajustable clamps."
	icon_state = "rack"
	icon = 'modular_dripstation/icons/obj/stationobjs.dmi'
	anchored = TRUE
	density = FALSE
	var/obj/item/gun/held_weapon
	var/list/can_be_placed = list(
		/obj/item/gun/ballistic/shotgun/doublebarrel,
		/obj/item/gun/ballistic/shotgun,
		/obj/item/gun/ballistic/shotgun/riot,
		/obj/item/gun/ballistic/shotgun/automatic/combat,
		/obj/item/gun/ballistic/shotgun/automatic/combat/compact,
		/obj/item/gun/ballistic/shotgun/doublebarrel/improvised,
		/obj/item/gun/ballistic/shotgun/doublebarrel/improvised/sawn
	)

/obj/structure/weapon_rack/Initialize(mapload)
	. = ..()
	if(held_weapon)
		held_weapon = new held_weapon(src)
	update_appearance(UPDATE_OVERLAYS)

/obj/structure/weapon_rack/attackby(obj/item/attacking_item, mob/living/user, params)
	if(iscyborg(user))
		return
	if(user.a_intent == INTENT_HARM)
		return ..()
	if(contents.len < 1)
		if(attacking_item.type in can_be_placed)
			user.temporarilyRemoveItemFromInventory(attacking_item, src)
			held_weapon = attacking_item
			attacking_item.loc = src
			to_chat(user, span_notice("You placed \the [attacking_item] on \the [src]."))
			update_appearance(UPDATE_OVERLAYS)
			return TRUE
		else
			to_chat(user, span_warning("[attacking_item] doesn't fit on \the [src]."))
			return TRUE
	else
		to_chat(user, span_warning("There is already [held_weapon] on \the [src]."))
		return TRUE
	return ..()

/obj/structure/weapon_rack/attack_hand(mob/living/user)
	. = ..()
	if(iscyborg(user))
		return
	if(held_weapon)
		user.put_in_hands(held_weapon)
		to_chat(user, span_notice("You take \the [held_weapon] from \the [src]."))
		held_weapon = null
		update_appearance(UPDATE_OVERLAYS)

/obj/structure/weapon_rack/update_overlays()
	. = ..()
	if(held_weapon)
		var/clamp_icon_state
		var/mutable_appearance/gun_overlay = mutable_appearance(held_weapon.icon, held_weapon.icon_state, layer = ABOVE_OBJ_LAYER)
		if(istype(held_weapon, /obj/item/gun/ballistic/shotgun/doublebarrel))
			if(held_weapon.sawn_off)
				clamp_icon_state = "rack_clamps_dshotgun_sawn"
			else
				clamp_icon_state = "rack_clamps_dshotgun"
		if(istype(held_weapon, /obj/item/gun/ballistic/shotgun))
			clamp_icon_state = "rack_clamps_shotgun"
		if(istype(held_weapon, /obj/item/gun/ballistic/shotgun/riot))
			clamp_icon_state = "rack_clamps_riotshotgun"
		if(istype(held_weapon, /obj/item/gun/ballistic/shotgun/automatic/combat))
			clamp_icon_state = "rack_clamps_cshotgun"
		if(istype(held_weapon, /obj/item/gun/ballistic/shotgun/automatic/combat/compact))
			clamp_icon_state = "rack_clamps_cshotgunc"
		if(istype(held_weapon, /obj/item/gun/ballistic/shotgun/doublebarrel/improvised))
			clamp_icon_state = "rack_clamps_ishotgun"
		if(istype(held_weapon, /obj/item/gun/ballistic/shotgun/doublebarrel/improvised/sawn))
			clamp_icon_state = "rack_clamps_ishotgun_sawn"
		var/mutable_appearance/clamp_icon = mutable_appearance(icon, clamp_icon_state, layer = ABOVE_OBJ_LAYER)
		gun_overlay.pixel_y = 3
		clamp_icon.pixel_y = 3
		. += gun_overlay
		. += clamp_icon
	else
		. += "rack_clamps"

/obj/structure/weapon_rack/doublebarrel
	held_weapon = /obj/item/gun/ballistic/shotgun/doublebarrel

/obj/structure/weapon_rack/combatc
	held_weapon = /obj/item/gun/ballistic/shotgun/automatic/combat/compact

/obj/structure/weapon_rack/riot
	held_weapon = /obj/item/gun/ballistic/shotgun/riot

/obj/structure/weapon_rack/improvised
	held_weapon = /obj/item/gun/ballistic/shotgun/doublebarrel/improvised
