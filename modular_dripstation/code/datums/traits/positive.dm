/datum/quirk/psychopathic
	name = "Psychopathic"
	desc = "You often hear to yourself: Hey, secy, how many animals have you killed as a child?"
	icon = "meh"
	value = 5
	mob_trait = TRAIT_PSYCHOPATHIC
	mood_quirk = TRUE
	gain_text = span_danger("You don`t mind if they all die.")
	lose_text = span_notice("Okey, time to touch some grass.")
	medical_record_text = "The patient has a psychopathic personality disorder. It is normal for him to react socially distantly to certain events."

/datum/quirk/psychopathic/add()
	var/datum/component/mood/mood = quirk_holder.GetComponent(/datum/component/mood)
	if(mood)
		mood.mood_modifier -= 0.6

/datum/quirk/psychopathic/remove()
	if(quirk_holder)
		var/datum/component/mood/mood = quirk_holder.GetComponent(/datum/component/mood)
		if(mood)
			mood.mood_modifier += 0.6

/datum/quirk/apathetic
	mob_trait = TRAIT_APATHETIC