/datum/action/changeling/spiders
	name = "Spread Infestation"
	desc = "Our form divides, creating arachnids which will grow into deadly beasts."
	helptext = "The spiders are thoughtless creatures, and may attack their creators when fully grown. Requires at least 3 DNA absorptions."
	button_icon_state = "spread_infestation"
	chemical_cost = 90
	dna_cost = 1
	req_absorbs = 3
	xenoling_available = FALSE

//Makes some spiderlings. Good for setting traps and causing general trouble.
/datum/action/changeling/spiders/sting_action(mob/user)
	..()
	spawn_atom_to_turf(/obj/structure/spider/spiderling/hunter, user, 2, FALSE)
	return TRUE
