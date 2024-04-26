/obj/structure/mirror/Initialize(mapload)
	. = ..()
	var/static/list/reflection_filter = alpha_mask_filter(icon = icon('modular_dripstation/icons/obj/watercloset.dmi', "mirror_mask"))
	var/datum/callback/can_reflect = CALLBACK(src, PROC_REF(can_reflect))
	var/list/update_signals = list(COMSIG_ATOM_BREAK)
	AddComponent(/datum/component/reflection, reflection_filter = reflection_filter, can_reflect = can_reflect, update_signals = update_signals)

/obj/structure/mirror/proc/can_reflect(atom/movable/target)
	///I'm doing it this way too, because the signal is sent before the broken variable is set to TRUE.
	if(atom_integrity <= integrity_failure)
		return FALSE
	if(broken || !isliving(target) || HAS_TRAIT(target, TRAIT_NO_MIRROR_REFLECTION))
		return FALSE
	return TRUE

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/mirror, 28)
