/obj/structure/clock //Ported from vg, tho sprites were redone by me
	name = "grandfather clock"
	desc = "Hickory dickory dock, the mouse ran up the clock, the clock struck one, the mouse was gone, hickory dickory dock."
	icon = 'modular_dripstation/icons/obj/stationobjs.dmi'
	icon_state = "clock"
	density = 1
	anchored = 1

/obj/structure/clock/update_icon(updates)
	. = ..()
	if(anchored)
		icon_state = "clock"
	else
		icon_state = "clock-broken"

/obj/structure/clock/examine(mob/user)
	. = ..()
	if(anchored)
		. += span_info("The current Station Time time is: [station_time_timestamp()].")

/obj/structure/clock/attackby(obj/item/O, mob/user, params)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(O.tool_behaviour == TOOL_WRENCH)
			if(!anchored && !isinspace())
				to_chat(user,span_notice("You secure [src] to the floor."))
				setAnchored(TRUE)
			else if(anchored)
				to_chat(user,span_notice("You unsecure [src]."))
				setAnchored(FALSE)
			playsound(src, 'sound/items/deconstruct.ogg', 50, TRUE)
			update_appearance(UPDATE_ICON)
			return
	return ..()

/obj/structure/clock/unanchored
	anchored = 0
	icon_state = "clock-broken"

