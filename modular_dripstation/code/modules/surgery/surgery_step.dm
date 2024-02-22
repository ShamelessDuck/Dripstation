/datum/surgery_step/cause_ouchie(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, success)
	. = ..()
	SEND_SIGNAL(target, COMSIG_ADD_MOOD_EVENT, "screw_up", /datum/mood_event/surgery)