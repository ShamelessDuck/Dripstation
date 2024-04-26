/obj/item/soap
	icon = 'modular_dripstation/icons/obj/janitor.dmi'
	drop_sound = 'sound/misc/slip.ogg'

/obj/item/soap/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/slippery, 80)
	AddComponent(/datum/component/cleaner, cleanspeed, 0.1, on_cleaned_callback=CALLBACK(src, .proc/decreaseUses)) //less scaling for soapies

/* Arguments
 * * source - the source of the cleaning
 * * target - The atom that is being cleaned
 * * user - The mob that is using the soap to clean.
 */
/obj/item/soap/proc/decreaseUses(datum/source, atom/target, mob/living/user, amount)

/obj/item/soap/afterattack(atom/target, mob/user, proximity)
	. = ..()
	if(iscarbon(target) && user == target && user.zone_selected == BODY_ZONE_PRECISE_MOUTH && user.a_intent == INTENT_HELP) //mmm, soap...
		var/mob/living/carbon/C = user
		user.visible_message(span_notice("[user] takes a bite out of [src.name]!"), span_notice("You gnaw on [src]! This can't be good for you..."))
		playsound(get_turf(C), 'sound/items/eatfood.ogg', 25, 0)
		C.reagents.add_reagent(/datum/reagent/toxin/formaldehyde, 2)
		C.reagents.add_reagent(/datum/reagent/toxin/chloralhydrate, 3)
		SEND_SIGNAL(C, COMSIG_ADD_MOOD_EVENT, "toxic_food", /datum/mood_event/disgusting_food)
		decreaseUses(user, 20)
		return
	if(!proximity || !check_allowed_items(target))
		return
	//I couldn't feasibly  fix the overlay bugs caused by cleaning items we are wearing.
	//So this is a workaround. This also makes more sense from an IC standpoint. ~Carn
	if(user.client && ((target in user.client.screen) && !user.is_holding(target)))
		to_chat(user, span_warning("You need to take that [target.name] off before cleaning it!"))
		return
	if(ishuman(target) && user.zone_selected == BODY_ZONE_PRECISE_MOUTH)
		var/mob/living/carbon/human/H = user
		user.visible_message(span_warning("\the [user] washes \the [target]'s mouth out with [src.name]!"), span_notice("You wash \the [target]'s mouth out with [src.name]!")) //washes mouth out with soap sounds better than 'the soap' here			if(user.zone_selected == "mouth")
		H.lip_style = null //removes lipstick
		H.update_body()
		decreaseUses(user)
		return
	else
		start_cleaning(src, target, user) //normal cleaning
	return

/obj/item/bikehorn
	icon = 'modular_dripstation/icons/obj/toy.dmi'
