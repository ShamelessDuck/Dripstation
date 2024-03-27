/mob/living/simple_animal/bot/medbot
	icon = 'modular_dripstation/icons/mob/aibots.dmi'
	var/obj/item/storage/firstaid/firstaid_item

/mob/living/simple_animal/bot/medbot/Initialize(mapload)
	. = ..()
	var/datum/job/doctor/J = new /datum/job/doctor
	access_card.access += J.get_access()
	prev_access = access_card.access
	qdel(J)
	if(!firstaid_item)
		firstaid_item = new /obj/item/storage/firstaid(src)
		skin = "firstaid"
	update_appearance(UPDATE_OVERLAYS)

/mob/living/simple_animal/bot/medbot/update_overlays()
	. = ..()
	. += mutable_appearance('modular_dripstation/icons/obj/storage.dmi', skin)
	. += mutable_appearance(icon, "na_scanner")
	if(!on)
		. += mutable_appearance(icon, "medibot0", MOB_LAYER)
		return
	if(IsStun() || IsParalyzed())
		. += mutable_appearance(icon, "medibota")
		return
	if(mode == BOT_HEALING)
		. += mutable_appearance(icon, "medibots[stationary_mode]")
		return
	else if(stationary_mode) //Bot has yellow light to indicate stationary mode.
		. += mutable_appearance(icon, "medibot2")
	else
		. += mutable_appearance(icon, "medibot1")

/obj/item/bot_assembly/medbot
	icon = 'modular_dripstation/icons/mob/aibots.dmi'
	icon_state = ""
	var/obj/item/storage/firstaid/firstaid_item

/obj/item/bot_assembly/medbot/update_overlays()
	. = ..()
	. += mutable_appearance(icon = 'modular_dripstation/icons/obj/storage.dmi', icon_state = skin)
	. += mutable_appearance(icon, "firstaid_arm")
	if(build_step == ASSEMBLY_SECOND_STEP)
		. += mutable_appearance(icon, "na_scanner")

/obj/item/bot_assembly/medbot/Initialize(mapload)
	. = ..()
	update_appearance(UPDATE_OVERLAYS)

/obj/item/bot_assembly/medbot/attackby(obj/item/W, mob/user, params)
	..()
	switch(build_step)
		if(ASSEMBLY_FIRST_STEP)
			if(istype(W, /obj/item/healthanalyzer))
				if(!user.temporarilyRemoveItemFromInventory(W))
					return
				healthanalyzer = W.type
				to_chat(user, span_notice("You add [W] to [src]."))
				qdel(W)
				name = "first aid/robot arm/health analyzer assembly"
				build_step++
				update_appearance(UPDATE_OVERLAYS)

		if(ASSEMBLY_SECOND_STEP)
			if(isprox(W))
				if(!can_finish_build(W, user))
					return
				qdel(W)
				var/mob/living/simple_animal/bot/medbot/S = new(drop_location(), firstaid_item)
				to_chat(user, span_notice("You complete the Medbot. Beep boop!"))
				S.name = created_name
				S.firstaid_item = firstaid_item
				S.skin = skin
				S.robot_arm = robot_arm
				S.healthanalyzer = healthanalyzer
				S.update_appearance(UPDATE_OVERLAYS)
				qdel(src)
