/datum/emote/living/laugh/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user?.dna?.species)
		return user.dna.species?.get_laugh_sound(user)
	if(!.)
		return ..()

/datum/emote/living/giggle/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user?.dna?.species)
		return user.dna.species?.get_giggle_sound(user)
	if(!.)
		return ..()

/datum/emote/living/scream/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user?.dna?.species)
		return user.dna.species?.get_scream_sound(user)
	if(!.)
		return ..()

/datum/emote/living/gasp/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user?.dna?.species)
		return user.dna.species?.get_gasp_sound(user)
	if(!.)
		return ..()

/datum/emote/living/cough/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user?.dna?.species)
		return user.dna.species?.get_cough_sound(user)
	if(!.)
		return ..()

/datum/emote/living/sigh
	emote_type = EMOTE_AUDIBLE|EMOTE_ANIMATED
	emote_length = 3 SECONDS
	overlay_y_offset = -1
	overlay_icon_state = "sigh"
	directional = TRUE

/datum/emote/living/sigh/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user?.dna?.species)
		return user.dna.species?.get_sigh_sound(user)
	if(!.)
		return ..()

/datum/emote/living/sneeze/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user?.dna?.species)
		return user.dna.species?.get_sneeze_sound(user)
	if(!.)
		return ..()

/datum/emote/living/sniff/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user?.dna?.species)
		return user.dna.species?.get_sniff_sound(user)
	if(!.)
		return ..()

/datum/emote/living/carbon/human/cry/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user?.dna?.species)
		return user.dna.species?.get_cry_sound(user)
	if(!.)
		return ..()

/datum/emote/living/carbon/moan/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user?.dna?.species)
		return user.dna.species?.get_moan_sound(user)
	if(!.)
		return ..()

/datum/emote/living/yawn/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user?.dna?.species)
		return user.dna.species?.get_yawn_sound(user)
	if(!.)
		return ..()

/datum/emote/living/carbon/human/salute
	emote_type = EMOTE_AUDIBLE
	var/list/funny_shoes = list(/obj/item/clothing/shoes/clown_shoes)

/datum/emote/living/carbon/human/salute/get_sound(mob/living/carbon/human/user)
	if(is_type_in_list(user.shoes, funny_shoes))
		return 'sound/items/toysqueak1.ogg'
	else
		return 'modular_dripstation/sound/emotes/salute.ogg'

/datum/emote/living/carbon/sweatdrop
	key = "sweatdrop"
	key_third_person = "sweatdrops"
	message = "sweats"
	emote_type = EMOTE_ANIMATED
	vary = TRUE
	overlay_icon_state = "sweatdrop"
	overlay_x_offset = 10
	overlay_y_offset = 10
	emote_length = 3 SECONDS
	sound = 'modular_dripstation/sound/emotes/sweatdrop.ogg'

/datum/emote/living/blush
	emote_type = EMOTE_ANIMATED
	overlay_icon_state = "blush"
	emote_length = 5 SECONDS
	directional = TRUE
	emote_layer = BODY_LAYER
	sound = 'modular_dripstation/sound/emotes/blush.ogg' //Skyrat port

/datum/emote/living/carbon/annoyed
	key = "annoyed"
	emote_type = EMOTE_ANIMATED
	vary = TRUE
	overlay_icon_state = "annoyed"
	overlay_x_offset = 10
	overlay_y_offset = 10
	emote_length = 5 SECONDS
	sound = 'modular_dripstation/sound/emotes/annoyed.ogg'

/datum/emote/living/carbon/glasses
	key = "glasses"
	message = "pushes up their glasses"
	emote_type = EMOTE_ANIMATED
	overlay_icon_state = "glasses"
	emote_length = 1 SECONDS
	directional = TRUE

/datum/emote/living/carbon/glasses/can_run_emote(mob/user, status_check = TRUE, intentional)
	if(!..())
		return FALSE
	return istype(user.get_item_by_slot(ITEM_SLOT_EYES), /obj/item/clothing/glasses)

/datum/emote/living/pout
	emote_type = EMOTE_AUDIBLE
