/datum/species/lizard
	species_traits = list(MUTCOLORS,EYECOLOR,LIPS,DIGITIGRADE,HAS_FLESH,HAS_BONE,HAS_TAIL)
	default_features = list("mcolor" = "#00FF00", "tail_lizard" = "Smooth", "snout" = "Round", "horns" = "None", "frills" = "None", "spines" = "None", "body_markings" = "None", "legs" = "Digitigrade Legs")

///КОСТЫЛЬ, НУЖНЫ НОРМАЛЬНЫЕ ЗВУКИ ДЛЯ РАСЫ///
/datum/species/lizard/get_laugh_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_LAUGH_SOUND(user)

/datum/species/lizard/get_giggle_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_GIGGLE_SOUND(user)

/datum/species/lizard/get_scream_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_SCREAM_SOUND(user)

/datum/species/lizard/get_cough_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_COUGH_SOUND(user)

/datum/species/lizard/get_gasp_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_GASP_SOUND(user)

/datum/species/lizard/get_sigh_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_SIGH_SOUND(user)

/datum/species/lizard/get_sneeze_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_SNEEZE_SOUND(user)

/datum/species/lizard/get_sniff_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_SNIFF_SOUND(user)

/datum/species/lizard/get_cry_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_CRY_SOUND(user)

/datum/species/lizard/get_moan_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_MOAN_SOUND(user)

/datum/species/lizard/get_yawn_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_YAWN_SOUND(user)
