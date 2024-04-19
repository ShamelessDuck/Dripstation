/datum/emote/living/yawn/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user.dna?.species)
		if(user.gender == FEMALE)
			return pick(user.dna.species.yawn_sound_female)
		else
			return pick(user.dna.species.yawn_sound_male)
	if(!.)
		return ..()

/datum/emote/living/cough/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user.dna?.species)
		if(user.gender == FEMALE)
			return pick(user.dna.species.cough_sound_female)
		else
			return pick(user.dna.species.cough_sound_male)
	if(!.)
		return ..()

/datum/emote/living/moan/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user.dna?.species)
		if(user.gender == FEMALE)
			return pick(user.dna.species.moan_sound_female)
		else
			return pick(user.dna.species.moan_sound_male)
	if(!.)
		return ..()

/datum/emote/living/giggle/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user.dna?.species)
		if(user.gender == FEMALE)
			return pick(user.dna.species.giggle_sound_female)
		else
			return pick(user.dna.species.giggle_sound_male)
	if(!.)
		return ..()

/datum/emote/living/gasp/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user.dna?.species)
		if(user.gender == FEMALE)
			return pick(user.dna.species.gasp_sound_female)
		else
			return pick(user.dna.species.gasp_sound_male)
	if(!.)
		return ..()

/datum/emote/living/sneeze/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user.dna?.species)
		if(user.gender == FEMALE)
			return pick(user.dna.species.sneeze_sound_female)
		else
			return pick(user.dna.species.sneeze_sound_male)
	if(!.)
		return ..()

/datum/emote/living/carbon/human/salute
	emote_type = EMOTE_AUDIBLE
	var/list/funny_shoes = list(/obj/item/clothing/shoes/clown_shoes)

/datum/emote/living/carbon/human/salute/get_sound(mob/living/carbon/human/user)
	if(is_type_in_list(user.shoes, funny_shoes))
		return 'sound/items/toysqueak1.ogg'
	else
		return 'modular_dripstation/sound/effects/salute.ogg'
