/obj/item/clothing/glasses/meson
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'

/obj/item/clothing/glasses/meson/gar
	icon = 'icons/obj/clothing/glasses.dmi'
	mob_overlay_icon = 'icons/mob/clothing/eyes/eyes.dmi'
	flags_cover = null //GLASSESCOVERSEYES

/obj/item/clothing/glasses/meson/sunglasses
	flags_cover = null //GLASSESCOVERSEYES

/obj/item/clothing/glasses/meson/sunglasses/ce
	name = "advanced engineering aviators"
	desc = "A meson scanner built into a pair of aviators."
	icon_state = "aviator_meson"
	flash_protect = 1
	hud_type = null

/obj/item/clothing/glasses/science
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'

/obj/item/clothing/glasses/night
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'
	var/can_toggle = TRUE
	var/hud_type = null
	var/on = FALSE
	var/lighting_cutoff_off = null
	var/flash_protect_off = 2
	var/color_cutoffs_off = null
	var/glass_colour_type_off = null
/*
	actions_types = list(/datum/action/item_action/toggle_nvg)

/obj/item/clothing/glasses/night/verb/toggle()
	set name = "Toggle NV"
	set category = "Object"
	set src in usr
	if(!can_use(usr))
		return
	attack_self(usr)

/datum/action/item_action/toggle_nvg
	name = "Toggle NVG"

/datum/action/item_action/toggle_nvg/IsAvailable(mob/living/carbon/human/user, feedback = FALSE)
	if(!ishuman(user))
		return FALSE
	//var/mob/living/carbon/human/wearer = user
	//if (wearer.glasses != src)
	//	to_chat(src, span_warning("You need to put on your NVG before doing that!"))
	//	return FALSE
	return ..()

/obj/item/clothing/glasses/night/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	if(can_toggle && !on)
		return
	if(can_toggle && on)
		on = FALSE
		thermal_overload()

/obj/item/clothing/glasses/night/update_overlays()
	..()
	if(!on)
		icon_state = "night-off"
	else
		icon_state = initial(icon_state)

/obj/item/clothing/glasses/night/Initialize(mapload)
	..()
	if(can_toggle)
		on = FALSE
		lighting_cutoff = lighting_cutoff_off
		flash_protect = flash_protect_off
		color_cutoffs = color_cutoffs_off
		glass_colour_type = glass_colour_type_off
		update_appearance(UPDATE_ICON)

/obj/item/clothing/glasses/night/equipped(mob/living/carbon/human/user, slot)
	..()
	if(slot == ITEM_SLOT_EYES)
		lighting_cutoff = initial(lighting_cutoff)
		flash_protect = initial(flash_protect)
		color_cutoffs = initial(color_cutoffs)
		glass_colour_type = initial(glass_colour_type)
		if(hud_type)
			var/datum/atom_hud/H = GLOB.huds[hud_type]
			H.show_to(user)

/obj/item/clothing/glasses/night/dropped(mob/living/carbon/human/user)
	..()
	on = FALSE
	lighting_cutoff = lighting_cutoff_off
	flash_protect = flash_protect_off
	color_cutoffs = color_cutoffs_off
	glass_colour_type = glass_colour_type_off
	if(hud_type)
		var/datum/atom_hud/H = GLOB.huds[hud_type]
		H.hide_from(user)

/obj/item/clothing/glasses/night/attack_self(mob/user, slot)
	if(!can_toggle)
		return
	if(!ishuman(user))
		return
	//var/mob/living/carbon/human/wearer = user
	//if (wearer.glasses != src || slot == ITEM_SLOT_EYES)
	//	return
	on = !on
	if(on)
		lighting_cutoff = initial(lighting_cutoff)
		flash_protect = initial(flash_protect)
		color_cutoffs = initial(color_cutoffs)
		glass_colour_type = initial(glass_colour_type)
		if(hud_type && slot == ITEM_SLOT_EYES && on)
			var/datum/atom_hud/H = GLOB.huds[hud_type]
			H.show_to(user)
	else
		lighting_cutoff = lighting_cutoff_off
		flash_protect = flash_protect_off
		color_cutoffs = color_cutoffs_off
		glass_colour_type = glass_colour_type_off
		if(hud_type)
			var/datum/atom_hud/H = GLOB.huds[hud_type]
			H.hide_from(user)
*/
/obj/item/clothing/glasses/night/security
	icon_state = "tact-securityhudnight"
	hud_type = DATA_HUD_SECURITY_ADVANCED

/obj/item/clothing/glasses/night/health
	icon_state = "tact-healthhudnight"
	hud_type = DATA_HUD_MEDICAL_ADVANCED

/obj/item/clothing/glasses/night/diagnostic
	icon_state = "tact-diagnostichudnight"
	hud_type = DATA_HUD_DIAGNOSTIC_ADVANCED

/obj/item/clothing/glasses/material
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'

/obj/item/clothing/glasses/material/mining/gar
	icon = 'icons/obj/clothing/glasses.dmi'
	mob_overlay_icon = 'icons/mob/clothing/eyes/eyes.dmi'
	flags_cover = null //GLASSESCOVERSEYES

/obj/item/clothing/glasses/material/aviator
	name = "material chemical aviators"
	desc = "Science aviators with a reagent scanner. Can see through materials, nothing special though."
	icon_state = "aviator_sci"
	clothing_flags = SCAN_REAGENTS
	flags_cover = null //GLASSESCOVERSEYES

/obj/item/clothing/glasses/sunglasses/reagent
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'
	icon_state = "sunhudbeer"

/obj/item/clothing/glasses/thermal
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'
	icon_state = "tact-thermal_nvg"
	var/can_toggle = TRUE
	var/on = FALSE
	var/lighting_cutoff_off = 0
	var/flash_protect_off = 2
	var/color_cutoffs_off = null
	var/glass_colour_type_off = null
	var/vision_flags_off = null

/*
/obj/item/clothing/glasses/thermal/verb/toggle()
	set name = "Toggle Thermal"
	set category = "Object"
	set src in usr
	if(!can_use(usr))
		return
	attack_self(usr)

/datum/action/item_action/toggle_t
	name = "Toggle Thermal"

/datum/action/item_action/toggle_t/IsAvailable(mob/living/carbon/human/user, feedback = FALSE)
	if(!ishuman(user))
		return FALSE
	var/mob/living/carbon/human/wearer = user
	if (wearer.glasses != src)
		to_chat(src, span_warning("You need to put on your NVG before doing that!"))
		return FALSE
	return ..()

/obj/item/clothing/glasses/thermal/update_overlays()
	..()
	if(!on)
		icon_state = "night-off"
	else
		icon_state = initial(icon_state)

/obj/item/clothing/glasses/thermal/emp_act(severity)
	if(can_toggle && !on)
		return
	. = ..()

/obj/item/clothing/glasses/thermal/Initialize(mapload)
	..()
	if(can_toggle)
		on = FALSE
		actions_types = list(/datum/action/item_action/toggle_t)
		lighting_cutoff = lighting_cutoff_off
		flash_protect = flash_protect_off
		color_cutoffs = color_cutoffs_off
		glass_colour_type = glass_colour_type_off
		vision_flags = vision_flags_off
		update_appearance(UPDATE_ICON)

/obj/item/clothing/glasses/thermal/equipped(mob/living/carbon/human/user, slot)
	..()
	if(can_toggle && slot == ITEM_SLOT_EYES && on)
		lighting_cutoff = initial(lighting_cutoff)
		flash_protect = initial(flash_protect)
		color_cutoffs = initial(color_cutoffs)
		glass_colour_type = initial(glass_colour_type)
		vision_flags = initial(vision_flags)

/obj/item/clothing/glasses/thermal/dropped(mob/living/carbon/human/user)
	..()
	if(can_toggle && istype(user) && user.glasses == src && on)
		on = FALSE
		lighting_cutoff = lighting_cutoff_off
		flash_protect = flash_protect_off
		color_cutoffs = color_cutoffs_off
		glass_colour_type = glass_colour_type_off
		vision_flags = vision_flags_off

/obj/item/clothing/glasses/thermal/attack_self(mob/user, slot)
	if(!can_toggle)
		return
	if(!ishuman(user))
		return
	//var/mob/living/carbon/human/wearer = user
	//if (wearer.glasses != src || slot == ITEM_SLOT_EYES)
	//	return
	on = !on
	if(on)
		lighting_cutoff = initial(lighting_cutoff)
		flash_protect = initial(flash_protect)
		color_cutoffs = initial(color_cutoffs)
		glass_colour_type = initial(glass_colour_type)
		vision_flags = initial(vision_flags)
	else
		lighting_cutoff = lighting_cutoff_off
		flash_protect = flash_protect_off
		color_cutoffs = color_cutoffs_off
		glass_colour_type = glass_colour_type_off
		vision_flags = vision_flags_off
*/
/obj/item/clothing/glasses/thermal/xray
	name = "syndicate xray goggles"
	desc = "A pair of xray goggles manufactured by the Syndicate."
	icon_state = "tact-xray_nvg"

/obj/item/clothing/glasses/thermal/syndi
	icon_state = "thermal"
	can_toggle = FALSE

/obj/item/clothing/glasses/thermal/monocle
	can_toggle = FALSE
	flags_cover = null //GLASSESCOVERSEYES

/obj/item/clothing/glasses/thermal/eyepatch
	icon_state = "thermalpatch_combat"
	can_toggle = FALSE
	flags_cover = null //GLASSESCOVERSEYES

/obj/item/clothing/glasses/welding
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'

/obj/item/clothing/glasses/regular
	flags_cover = null //GLASSESCOVERSEYES

/obj/item/clothing/glasses/orange
	flags_cover = null //GLASSESCOVERSEYES

/obj/item/clothing/glasses/red
	flags_cover = null //GLASSESCOVERSEYES

/obj/item/clothing/glasses/ballistic
	name = "ballistic glasses"
	desc = "Basic tight-fitting goggles that protect vision organs from splinters and dust."
	icon_state = "ballistic"
	flags_cover = GLASSESCOVERSEYES
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'

/////HUDs///////
/obj/item/clothing/glasses/sunglasses
	flags_cover = null //GLASSESCOVERSEYES

/obj/item/clothing/glasses/sunglasses/aviators
	name = "aviators"
	desc = "Protect your vision with stile!"

/obj/item/clothing/glasses/hud/health
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'
	hud_type = DATA_HUD_MEDICAL_BASIC
	flags_cover = null //GLASSESCOVERSEYES

/obj/item/clothing/glasses/hud/health/regular
	name = "prescription health glasses"
	desc = "Protect your vision with stile!"
	icon_state = "glasses"
	item_state = "glasses"
	vision_correction = 1 //corrects nearsightedness

/obj/item/clothing/glasses/hud/health/prescription
	name = "prescription medicalHUD glasses"
	desc = "A heads-up display that scans the humans in view and provides accurate data about their health status. Also corrects your vision."
	icon_state = "healthhudpresc"
	item_state = "glasses"
	vision_correction = 1 //corrects nearsightedness

/obj/item/clothing/glasses/hud/health/military
	name = "military health HUDs"
	desc = "A heads-up display that scans the humans in view and provides accurate data about their health status. This ones are military grade."
	icon_state = "healthhud_military"
	hud_type = DATA_HUD_MEDICAL_ADVANCED

/obj/item/clothing/glasses/hud/health/sunglasses/cmo
	name = "medical advanced HUDaviators"
	desc = "Aviators with a medical HUD. This one is augmented with a reagent scanner."
	icon_state = "aviator_cmo"
	hud_type = DATA_HUD_MEDICAL_ADVANCED
	clothing_flags = null	//comment this if you want to enable scanreagents for cmo

/obj/item/clothing/glasses/hud/health/sunglasses/aviators
	name = "medical HUDaviators"
	desc = "Aviators with a medical HUD."
	icon_state = "aviator_med"
	custom_premium_price = 200

/obj/item/clothing/glasses/hud/diagnostic
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'
	flags_cover = null //GLASSESCOVERSEYES

/obj/item/clothing/glasses/hud/diagnostic/military
	name = "military diagnostic HUDs"
	desc = "A heads-up display capable of analyzing the integrity and status of robotics and exosuits. This ones are military grade."
	icon_state = "diagnostichud_military"
	hud_type = DATA_HUD_DIAGNOSTIC_ADVANCED

/obj/item/clothing/glasses/hud/diagnostic/sunglasses/rd
	name = "diagnostic advanced HUDaviators"
	desc = "Aviators with a diagnostic HUD. This one is augmented with a reagent scanner."
	icon_state = "aviator_rd"
	clothing_flags = null	//comment this if you want to enable scanreagents for rd

/obj/item/clothing/glasses/hud/diagnostic/sunglasses/aviators
	name = "diagnostic HUDaviators"
	desc = "Aviators with a diagnostic HUD."
	icon_state = "aviator_diagnostic"
	custom_premium_price = 200

/obj/item/clothing/glasses/hud/security
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'
	flags_cover = null //GLASSESCOVERSEYES

/obj/item/clothing/glasses/hud/security/military
	name = "military security HUDs"
	desc = "A heads-up display that scans the humans in view and provides accurate data about their ID status and security records. This ones are military grade."
	icon_state = "securityhud_military"

/obj/item/clothing/glasses/hud/security/ballistic
	name = "ballistic security glasses"
	desc = "Basic tight-fitting goggles that protect vision organs from splinters and dust. Security hud integrated."
	icon_state = "securityballistic"
	flags_cover = GLASSESCOVERSEYES

/obj/item/clothing/glasses/hud/security/sunglasses/aviators
	name = "security HUDaviators"
	desc = "Aviators with a security HUD."
	icon_state = "aviator_sec"
	custom_premium_price = 200

/obj/item/clothing/glasses/hud/security/sunglasses/eyepatch
	icon = 'icons/obj/clothing/glasses.dmi'
	mob_overlay_icon = 'icons/mob/clothing/eyes/eyes.dmi'

/obj/item/clothing/glasses/hud/security/sunglasses/hos
	name = "security advanced HUDaviators"
	desc = "Aviators with a security HUD. For the station finest."
	icon_state = "aviator_sechos"
	hud_type = DATA_HUD_SECURITY_ADVANCED	//comment this if you want to enable medhud for hos

/obj/item/clothing/glasses/hud/security/sunglasses/gars
	icon = 'icons/obj/clothing/glasses.dmi'
	mob_overlay_icon = 'icons/mob/clothing/eyes/eyes.dmi'

/obj/item/clothing/glasses/hud/toggle/thermal
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'

/obj/item/clothing/glasses/hud/personnel
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'
	icon_state = "sunhudskill"
	flags_cover = null //GLASSESCOVERSEYES

/obj/item/clothing/glasses/hud/skill
	name = "skills HUDs"
	desc = "A heads-up display with a personnel HUD. This one is military grade."
	icon_state = "skillhud"
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'
	hud_type = DATA_HUD_SECURITY_BASIC
	flags_cover = null //GLASSESCOVERSEYES