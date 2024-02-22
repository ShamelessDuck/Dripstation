/datum/quirk/bad_touch
	name = "Bad Touch"
	desc = "You don't like hugs. You'd really prefer if people just left you alone."
	icon = "tg-bad-touch"
	mob_trait = TRAIT_BADTOUCH
	value = -1
	gain_text = span_danger("You just want people to leave you alone.")
	lose_text = span_notice("You could use a big hug.")
	medical_record_text = "Patient has disdain for being touched. Potentially has undiagnosed haphephobia."
	mood_quirk = TRUE

/datum/quirk/bad_touch/add(client/client_source)
	RegisterSignals(quirk_holder, list(COMSIG_LIVING_GET_PULLED, COMSIG_CARBON_HELP_ACT), PROC_REF(uncomfortable_touch))

/datum/quirk/bad_touch/remove()
	UnregisterSignal(quirk_holder, list(COMSIG_LIVING_GET_PULLED, COMSIG_CARBON_HELP_ACT))

/// Causes a negative moodlet to our quirk holder on signal
/datum/quirk/bad_touch/proc/uncomfortable_touch(datum/source)
	SIGNAL_HANDLER

	if(quirk_holder.stat == DEAD)
		return

	new /obj/effect/temp_visual/annoyed(quirk_holder.loc)
	var/datum/component/mood/mob_mood = quirk_holder.GetComponent(/datum/component/mood)
	if(mob_mood.sanity <= SANITY_NEUTRAL)
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "bad_touch", /datum/mood_event/very_bad_touch)
	else
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "bad_touch", /datum/mood_event/bad_touch)

/datum/quirk/prosthetic_limb
	value = -1

/datum/quirk/prosthetic_limb/check_quirk(datum/preferences/prefs)
	var/species_type = prefs.read_preference(/datum/preference/choiced/species)

	if(species_type == /datum/species/ipc) // IPCs are already cybernetic
		return "You already have cybernetic limbs!"
	return FALSE

/datum/quirk/prosthetic_limb/left_arm
	value = -0.5

/datum/quirk/prosthetic_limb/right_arm
	value = -0.5

/datum/quirk/prosthetic_limb/left_leg
	value = -0.5

/datum/quirk/prosthetic_limb/right_leg
	value = -0.5