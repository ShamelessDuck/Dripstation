#define MINOR_INSANITY_PEN 5
#define MAJOR_INSANITY_PEN 10
//Okey, just mood rebalance
/datum/component/mood/process(delta_time)
	var/mob/living/owner = parent
	if(!owner)
		qdel(src)
		return

	switch(mood_level)
		if(1)
			setSanity(sanity-0.3*delta_time, minimum=SANITY_INSANE)
		if(2)
			setSanity(sanity-0.15*delta_time, minimum=SANITY_INSANE)
		if(3)
			setSanity(sanity-0.1*delta_time, minimum=SANITY_CRAZY)
		if(4)
			setSanity(sanity-0.05*delta_time, minimum=SANITY_UNSTABLE)
		if(5)
			setSanity(sanity, minimum=SANITY_UNSTABLE) //This makes sure that mood gets increased should you be below the minimum.
		if(6)
			setSanity(sanity+0.15*delta_time, minimum=SANITY_UNSTABLE)
		if(7)
			setSanity(sanity+0.2*delta_time, minimum=SANITY_UNSTABLE)
		if(8)
			setSanity(sanity+0.25*delta_time, minimum=SANITY_NEUTRAL, maximum=SANITY_GREAT)
		if(9)
			setSanity(sanity+0.4*delta_time, minimum=SANITY_NEUTRAL, maximum=INFINITY)


	if(HAS_TRAIT(owner, TRAIT_DEPRESSION))
		if(prob(0.05))
			add_event(null, "depression", /datum/mood_event/depression_mild)
			clear_event(null, "jolly")
	if(HAS_TRAIT(owner, TRAIT_JOLLY))
		if(prob(0.05))
			add_event(null, "jolly", /datum/mood_event/jolly)
			clear_event(null, "depression")
	if(HAS_TRAIT(owner, TRAIT_PSYCHOPATHIC))
		if(prob(0.005))
			add_event(null, "depression", /datum/mood_event/depression_moderate)
			clear_event(null, "jolly")
		if(prob(0.005))
			add_event(null, "jolly", /datum/mood_event/jolly)
			clear_event(null, "depression")

	HandleNutrition(owner)


/datum/component/mood/proc/setSanity(amount, minimum=SANITY_INSANE, maximum=SANITY_NEUTRAL)
	if(amount < minimum)
		amount += clamp(minimum - amount, 0, 0.7)
	if(HAS_TRAIT(parent, TRAIT_UNSTABLE) || amount > maximum)
		amount = min(sanity, amount)
	if(amount == sanity) //Prevents stuff from flicking around.
		return
	sanity = amount
	var/mob/living/master = parent
	switch(sanity)
		if(SANITY_INSANE to SANITY_CRAZY)
			setInsanityEffect(MAJOR_INSANITY_PEN)
			master.add_movespeed_modifier(MOVESPEED_ID_SANITY, TRUE, 100, override=TRUE, multiplicative_slowdown=0.75, movetypes=(~FLYING))
			sanity_level = 6
		if(SANITY_CRAZY to SANITY_UNSTABLE)
			setInsanityEffect(MINOR_INSANITY_PEN)
			master.add_movespeed_modifier(MOVESPEED_ID_SANITY, TRUE, 100, override=TRUE, multiplicative_slowdown=0.5, movetypes=(~FLYING))
			sanity_level = 5
		if(SANITY_UNSTABLE to SANITY_DISTURBED)
			setInsanityEffect(0)
			master.add_movespeed_modifier(MOVESPEED_ID_SANITY, TRUE, 100, override=TRUE, multiplicative_slowdown=0.25, movetypes=(~FLYING))
			sanity_level = 4
		if(SANITY_DISTURBED to SANITY_NEUTRAL)
			setInsanityEffect(0)
			master.remove_movespeed_modifier(MOVESPEED_ID_SANITY, TRUE)
			sanity_level = 3
		if(SANITY_NEUTRAL+1 to SANITY_GREAT+1) //shitty hack but +1 to prevent it from responding to super small differences
			setInsanityEffect(0)
			master.remove_movespeed_modifier(MOVESPEED_ID_SANITY, TRUE)
			sanity_level = 2
		if(SANITY_GREAT+1 to INFINITY)
			setInsanityEffect(0)
			master.remove_movespeed_modifier(MOVESPEED_ID_SANITY, TRUE)
			sanity_level = 1
	update_mood_icon()

#undef MINOR_INSANITY_PEN
#undef MAJOR_INSANITY_PEN