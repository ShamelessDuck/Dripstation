GLOBAL_LIST_EMPTY(chempiles)
/obj/effect/decal/cleanable/chempile
	name = "chemicals"
	desc = "An indiscernible mixture of chemicals"
	icon = 'modular_dripstation/icons/effects/32x32.dmi'
	icon_state = "chempile"
	mergeable_decal = FALSE
	resistance_flags = ACID_PROOF | FIRE_PROOF

/obj/effect/decal/cleanable/chempile/examine(mob/user)
	. = ..()
	. += "It contains:"
	if(reagents.reagent_list.len)
		if(user.can_see_reagents()) //Show each individual reagent
			for(var/datum/reagent/R in reagents.reagent_list)
				. += "[R.volume] units of [R.name]"
		else //Otherwise, just show the total volume
			var/total_volume = 0
			for(var/datum/reagent/R in reagents.reagent_list)
				total_volume += R.volume
			. += "[total_volume] units of various reagents"
	else
		. += "Nothing."

// /obj/effect/decal/cleanable/chempile/experience_pressure_difference(pressure_difference)
// 	if(reagents)
// 		reagents.chem_pressure = pressure_difference / 100

/obj/effect/decal/cleanable/chempile/Initialize()
	. = ..()
	GLOB.chempiles += src
	if(reagents && reagents.total_volume)
		if(reagents.total_volume < 5)
			ENABLE_BITFIELD(reagents, NO_REACT)

/obj/effect/decal/cleanable/chempile/Destroy()
	GLOB.chempiles -= src
	return ..()

/obj/effect/decal/cleanable/chempile/ex_act(severity)
	if(prob(severity*2))
		..()
	else
		qdel(src)

/*
/obj/effect/decal/cleanable/chempile/Crossed(mob/mover)
	. = ..()
	if(isliving(mover))
		var/mob/living/M = mover
		for(var/obj/item/I in M.get_equipped_items())
			if(I.body_parts_covered & FEET)
				return
// снизу коммент куска кода отвещающий за попадание реагента в тело
// кусок кода сверху тоже кусок говна, он должен проверять на био армор, передать бы всё это
// в идеале оно должно пропускать реагент в тело в количестве 0.2, если нет био армора 60 и выше
		if(reagents?.total_volume >= 1)	//No transfer if there's less than 1u total
			reagents.trans_to(M, 2)
			CHECK_TICK
			for(var/datum/reagent/R in reagents)
				if(R.volume < 0.2)
					reagents.remove_reagent(R)	//Should remove most stray cases of microdosages that may get through without compromising chempiles with lots of mixes in them
		else 
			qdel(src)
*/

/obj/effect/decal/cleanable/chempile/fire_act(exposed_temperature, exposed_volume)
	if(reagents && reagents.chem_temp)
		reagents.expose_temperature(exposed_temperature)
		CHECK_TICK
