/obj/item/reactive_armor_shell
	icon_state = "reactiveoff"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'

/obj/item/reactive_armor_shell/random
	name = "randomized reactive armor"
	desc = "Oddly reality breaking."

/obj/item/reactive_armor_shell/random/Initialize(mapload)
	. = ..()
	var/armor_path = anomaly_armor_types[pick(anomaly_armor_types)]
	new armor_path(loc)
	//ADD_TRAIT(armor_path, TRAIT_EMPPROOF_SELF, "innate_empproof")
	qdel(src)

/obj/item/clothing/suit/armor/reactive/hallucinating
	name = "reactive hallucinating armor"
	desc = "An experimental suit of armor with sensitive detectors hooked up to the mind of the wearer, sending mind pulses that causes hallucinations around you."
	cooldown_message = span_danger("The connection is currently out of sync... Recalibrating.")
	emp_message = span_warning("You feel the backsurge of a mind pulse.")
	clothing_traits = list(TRAIT_MADNESS_IMMUNE)

/obj/item/clothing/suit/armor/reactive/hallucinating/reactive_activation(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	visible_hallucination_pulse(
		center = get_turf(owner),
		radius = 3,
		hallucination_duration = 50 SECONDS,
		hallucination_max_duration = 300 SECONDS,
	)
	. = ..()
	