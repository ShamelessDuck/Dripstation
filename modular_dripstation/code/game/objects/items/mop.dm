/obj/item/mop
	icon = 'modular_dripstation/icons/obj/janitor.dmi'

/obj/item/mop/Initialize()
	. = ..()
	AddComponent(/datum/component/cleaner, mopspeed, on_cleaned_callback=CALLBACK(src, PROC_REF(apply_reagents)))
	create_reagents(mopcap)

/obj/item/mop/afterattack(atom/A, mob/user, proximity)
	. = ..()
	if(!proximity)
		return

	if(istype(A, /obj/item/reagent_containers/glass/bucket) || istype(A, /obj/structure/janitorialcart) || istype(A, /obj/structure/mopbucket))
		return

	if(reagents.total_volume < 1)
		to_chat(user, span_warning("Your mop is dry!"))
		return

	if(istype(A, /turf))
		if(reagents.has_reagent(/datum/reagent/water, 1) || reagents.has_reagent(/datum/reagent/water/holywater, 1) || reagents.has_reagent(/datum/reagent/consumable/ethanol/vodka, 1) || reagents.has_reagent(/datum/reagent/space_cleaner, 1))
			start_cleaning(src, A, user)

/obj/item/mop/proc/apply_reagents(datum/cleaning_source, turf/cleaned_turf, clean_succeeded)
	if(!clean_succeeded)
		return
	reagents.reaction(cleaned_turf, TOUCH, 10)	//Needed for proper floor wetting.
	reagents.remove_any(1)			//reaction() doesn't use up the reagents
