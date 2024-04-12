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

/datum/quirk/paraplegic
	job_blacklist = list("Head of Security", "Warden", "Security Officer")	//no Warden fun allowed

/datum/quirk/fragile
	name = "Fragility"
	desc = "You feel incredibly fragile. Burns and especially bruises hurt you more than the average person!"
	value = -4
	medical_record_text = "Patient's body has overadapted to low gravity. Sadly low-gravity environments are not conducive to strong bone development."
	icon = "tired"

/datum/quirk/fragile/post_add()
	. = ..()
	var/mob/living/carbon/human/user = quirk_holder
	user.physiology.brute_mod *= 1.25
	user.physiology.burn_mod *= 1.15

/datum/quirk/fragile/remove()
	. = ..()
	var/mob/living/carbon/human/user = quirk_holder
	user.physiology.brute_mod /= 1.25
	user.physiology.burn_mod /= 1.15

/datum/quirk/glass_jaw
	name = "Glass Jaw"
	desc = "You have a very fragile jaw. Any sufficiently hard blow to your head might knock you out."
	icon = "hand-fist"
	value = -4
	gain_text = span_danger("Your jaw feels loose.")
	lose_text = span_notice("Your jaw feels fitting again.")
	medical_record_text = "Patient is absurdly easy to knock out. Do not allow them near a boxing ring."

/datum/quirk/glass_jaw/add(client/client_source)
	RegisterSignal(quirk_holder, COMSIG_MOB_APPLY_DAMAGE, PROC_REF(punch_out))
/datum/quirk/glass_jaw/remove()
	UnregisterSignal(quirk_holder, COMSIG_MOB_APPLY_DAMAGE)
/datum/quirk/glass_jaw/proc/punch_out(mob/living/carbon/source, damage, damagetype, def_zone, blocked, wound_bonus, bare_wound_bonus, sharpness, attack_direction)
	SIGNAL_HANDLER
	if((damagetype != BRUTE) || (def_zone != BODY_ZONE_HEAD))
		return
	var/actual_damage = damage - (damage * blocked/100)
	//only roll for knockouts at 5 damage or more
	if(actual_damage < 5)
		return
	//blunt items are more likely to knock out, but sharp ones are still capable of doing it
	if(prob(CEILING(actual_damage * (sharpness & (SHARP_EDGED|SHARP_POINTY) ? 0.65 : 1), 1)))
		source.visible_message(
			span_warning("[source] gets knocked out!"),
			span_userdanger("You are knocked out!"),
			vision_distance = COMBAT_MESSAGE_RANGE,
		)
		source.Unconscious(3 SECONDS)

/datum/quirk/monophobia
	name = "Monophobia"
	desc = "You will become increasingly stressed when not in company of others, triggering panic reactions ranging from sickness to heart attacks."
	value = -6
	gain_text = span_danger("You feel really lonely...")
	lose_text = span_notice("You feel like you could be safe on your own.")
	medical_record_text = "Patient feels sick and distressed when not around other people, leading to potentially lethal levels of stress."
	icon = "people-arrows-left-right"

/datum/quirk/monophobia/post_add()
	. = ..()
	var/mob/living/carbon/human/user = quirk_holder
	user.gain_trauma(/datum/brain_trauma/severe/monophobia, TRAUMA_RESILIENCE_ABSOLUTE)

/datum/quirk/monophobia/remove()
	. = ..()
	var/mob/living/carbon/human/user = quirk_holder
	user?.cure_trauma_type(/datum/brain_trauma/severe/monophobia, TRAUMA_RESILIENCE_ABSOLUTE)

/datum/quirk/no_guns
	name = "No Guns"
	desc = "For whatever reason, you are unable to use guns. The reasoning may vary, but is up to you to decide."
	gain_text = span_notice("You feel like you won't be able to use guns anymore...")
	lose_text = span_notice("You suddenly feel like you can use guns again!")
	medical_record_text = "Patient is unable to use firearms. Reasoning unknown."
	value = -6
	mob_trait = TRAIT_NOGUNS_QUIRK
	icon = "gun"
	job_blacklist = list("Head of Security", "Security Officer", "Warden")

/datum/quirk/nosurgery
	name = "No Surgery"
	desc = "You skipped modern surgery courses when get your job in Nanotrasen research space programm. Even a monkey would perform better surgery than you."
	icon = "notes-medical"
	value = -4
	mob_trait = TRAIT_NOSURGERY
	gain_text = span_danger("And remember: under any circumstances you should NOT touch surgery tools.")
	lose_text = span_notice("You suddenly feel like you can perform surgeries again!")
	medical_record_text = "The patient has no skill in performing sugeries."
	job_blacklist = list("Chief Medical Officer", "Medical Doctor")