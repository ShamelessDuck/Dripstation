/datum/reagent/medicine/ondansetron
	name = "Ondansetron"
	description = "Prevents nausea and vomiting. May cause drowsiness and wear."
	reagent_state = LIQUID
	color = "#74d3ff"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM

/datum/reagent/medicine/ondansetron/on_mob_life(mob/living/carbon/M)
	. = ..()
	if(prob(8))
		M.adjust_drowsiness(2 SECONDS * REM)
	if(prob(15) && !M.getStaminaLoss())
		M.adjustStaminaLoss(10)
	M.adjust_disgust(-10 * REM)