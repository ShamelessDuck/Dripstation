/obj/item/dnainjector
	icon = 'modular_dripstation/icons/obj/syringe.dmi'
	icon_state = "dnainjector"

/obj/item/reagent_containers/autoinjector/combat
	icon = 'modular_dripstation/icons/obj/syringe.dmi'
	icon_state = "hypo_nt_combat"

/obj/item/reagent_containers/autoinjector/combat/nanites
	icon_state = "hypo_nt_quantum"

/obj/item/reagent_containers/autoinjector/combat/healermech
	icon_state = "hypo_nt_combat"

/obj/item/reagent_containers/autoinjector/medipen/resurrector
	icon = 'modular_dripstation/icons/obj/syringe.dmi'
	icon_state = "hypo_nt_combat"

/obj/item/reagent_containers/autoinjector/magillitis
	icon = 'modular_dripstation/icons/obj/syringe.dmi'
	icon_state = "hypo_vahlen"

/obj/item/reagent_containers/autoinjector/mixi
	icon = 'icons/obj/syringe.dmi'
	icon_state = "hypo_syndie"

/obj/item/reagent_containers/autoinjector/derm
	icon = 'icons/obj/syringe.dmi'
	icon_state = "hypo_syndie"

/obj/item/reagent_containers/autoinjector/medipen/stimpack/large
	icon = 'modular_dripstation/icons/obj/syringe.dmi'
	icon_state = "stimpakpen"

/obj/item/reagent_containers/autoinjector/medipen/stimpack/large/update_icon_state()
	. = ..()
	if(reagents.total_volume > 50)
		icon_state = initial(icon_state)
	else if(reagents.total_volume)
		icon_state = "[initial(icon_state)]50"
	else
		icon_state = "[initial(icon_state)]0"

/obj/item/reagent_containers/autoinjector/medipen/stimpack/large/redpill
	icon = 'modular_dripstation/icons/obj/syringe.dmi'
	icon_state = "hypo_redpill"

/obj/item/reagent_containers/autoinjector/medipen/stimpack/large/redpill/update_icon_state()
	. = ..()
	if(reagents.total_volume)
		icon_state = initial(icon_state)
	else
		icon_state = "[initial(icon_state)]0"

/obj/item/reagent_containers/autoinjector/medipen/stimpack/large/redpill/attack(mob/living/M, mob/user)
	. = ..()
	if(reagents.total_volume && istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		var/enlightenment = pick(strings(REDPILL_FILE, "redpill_questions"))
		H.forcesay(enlightenment)

/obj/item/reagent_containers/autoinjector/medipen/ekit/traitor
	name = "syndicate emergency autoinjector"
	desc = "An atropine autoinjector with extra mix of nanite-based coagulant and antibiotics to help stabilize bad cuts and burns and rapidly reverse severe bloodloss. Used when need to run or quickly get critical patients back on their feet."
	icon_state = "medipenemergencysyndie"
	icon = 'modular_dripstation/icons/obj/syringe.dmi'
	volume = 40
	amount_per_transfer_from_this = 40
	list_reagents = list(/datum/reagent/drug/red_eye = 5, /datum/reagent/medicine/morphine = 5, /datum/reagent/medicine/oxandrolone = 4, /datum/reagent/medicine/sal_acid = 4, /datum/reagent/drug/methamphetamine = 3, /datum/reagent/medicine/atropine = 10, /datum/reagent/medicine/coagulant/blood_restoring_nanites = 2.5, /datum/reagent/medicine/spaceacillin = 0.5, /datum/reagent/iron = 3, /datum/reagent/medicine/salglu_solution = 3)

/obj/item/reagent_containers/autoinjector/medipen/stimpack/traitor
	name = "syndicate combat autoinjector"
	desc = "A superior stimulants autoinjector for use in combat situations. Has healing effect, can coagulate bleeding and rapidly reverse severe bloodloss."
	volume = 40
	amount_per_transfer_from_this = 40
	list_reagents = list(/datum/reagent/medicine/stimulants = 5, /datum/reagent/medicine/morphine = 5, /datum/reagent/medicine/salbutamol = 5, /datum/reagent/medicine/tricordrazine = 5, /datum/reagent/medicine/omnizine = 10, /datum/reagent/medicine/coagulant/blood_restoring_nanites = 2.5, /datum/reagent/iron = 3.5, /datum/reagent/medicine/salglu_solution = 4)

/obj/item/reagent_containers/autoinjector/medipen/syndicate_trauma_repairer
	name = "syndicate anti-trauma autoinjector"
	desc = "A experimental autoinjector for use in combat situations. Helps to reform damaged neural connections, repair bones and coagulate bleeding and rapidly reverse severe bloodloss."
	icon_state = "medipentraumasyndie"
	icon = 'modular_dripstation/icons/obj/syringe.dmi'
	volume = 30
	amount_per_transfer_from_this = 30
	list_reagents = list(/datum/reagent/medicine/neurine = 5, /datum/reagent/medicine/morphine = 5, /datum/reagent/medicine/bone_restoring_nanites = 10, /datum/reagent/medicine/coagulant/blood_restoring_nanites = 2.5, /datum/reagent/iron = 3.5, /datum/reagent/medicine/salglu_solution = 4)

/obj/item/reagent_containers/autoinjector/medipen/syndicate_cellular_repairer
	name = "syndicate cellular restorer autoinjector"
	desc = "A experimental autoinjector for use in combat situations. Helps to restore missing limbs, heal wounds and regenerate cellular damage. No changelings were harmed during the production process!"
	icon_state = "medipencellularsyndie"
	icon = 'modular_dripstation/icons/obj/syringe.dmi'
	volume = 15
	amount_per_transfer_from_this = 15
	list_reagents = list(/datum/reagent/medicine/cellular_restoring_nanites = 15)
