//override light toggle
/obj/item/clothing/head/helmet/space/hardsuit
	light_system = MOVABLE_LIGHT_DIRECTIONAL

/obj/item/clothing/head/helmet/space/hardsuit/attack_self(mob/user)
	on = !on
	icon_state = "[hardsuit_type]_helm[on]"
	user.update_inv_head()	//so our mob-overlays update

	set_light_on(on)

	for(var/X in actions)
		var/datum/action/A = X
		A.build_all_button_icons()

//Engineering
/obj/item/clothing/head/helmet/space/hardsuit/engine
	icon_state = "engineering_helm0"
	//item_state = "engineering_helm"
	hardsuit_type = "engineering"
	armor = list(MELEE = 30, BULLET = 5, LASER = 10, ENERGY = 5, BOMB = 10, BIO = 100, RAD = 100, FIRE = 100, ACID = 75, WOUND = 10, ELECTRIC = 100)

/obj/item/clothing/suit/space/hardsuit/engine
	armor = list(MELEE = 30, BULLET = 5, LASER = 10, ENERGY = 5, BOMB = 10, BIO = 100, RAD = 100, FIRE = 100, ACID = 75, WOUND = 10, ELECTRIC = 100)

/obj/item/clothing/head/helmet/space/hardsuit/engine/atmos
	icon_state = "atmospherics_helm0"
	//item_state = "atmospherics_helm"
	hardsuit_type = "atmospherics"

/obj/item/clothing/head/helmet/space/hardsuit/engine/elite
	icon_state = "white_helm0"
	//item_state = "white_helm"
	hardsuit_type = "white"

/obj/item/clothing/head/helmet/space/hardsuit/elder_atmosian
	icon_state = "metalh2_helm0"
	//item_state = "metalh2_helm"
	hardsuit_type = "metalh2"

/obj/item/clothing/head/helmet/space/hardsuit/syndi/owl
	icon_state = "owl_helm"

/obj/item/clothing/suit/space/hardsuit/syndi/owl
	icon_state = "owl_rig"

//Mining hardsuit, now explorer hardsuit
/obj/item/clothing/head/helmet/space/hardsuit/mining
	name = "explorer hardsuit helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. Has reinforced plating for wildlife encounters and dual floodlights."
	icon_state = "explorer_light_helm0"
	//item_state = "explorer_light_helm"
	hardsuit_type = "explorer_light"
	armor = list(MELEE = 30, BULLET = 10, LASER = 15, ENERGY = 5, BOMB = 50, BIO = 100, RAD = 50, FIRE = 50, ACID = 75, WOUND = 15, ELECTRIC = 100)

/obj/item/clothing/suit/space/hardsuit/mining
	name = "explorer hardsuit"
	desc = "A special suit that protects against hazardous, low pressure environments. Has reinforced plating for wildlife encounters."
	icon_state = "explorer_light_hardsuit"
	//item_state = "explorer_light_hardsuit"
	armor = list(MELEE = 30, BULLET = 10, LASER = 15, ENERGY = 5, BOMB = 50, BIO = 100, RAD = 50, FIRE = 50, ACID = 75, WOUND = 15, ELECTRIC = 100)
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals, /obj/item/storage/bag/ore, /obj/item/pickaxe)

	//Elite Mining hardsuit
/obj/item/clothing/head/helmet/space/hardsuit/heavymining
	name = "elite mining hardsuit helmet"
	desc = "A special prototipe helmet designed for work in a agressive, hazardous, low pressure environment. Has reinforced plating for wildlife encounters and dual floodlights. Seems very tough."
	icon_state = "hvymining_helm0"
	//item_state = "hvymining_helm"
	hardsuit_type = "hvymining"
	resistance_flags = FIRE_PROOF | ACID_PROOF | LAVA_PROOF
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	armor = list(MELEE = 70, BULLET = 25, LASER = 20, ENERGY = 20, BOMB = 70, BIO = 100, RAD = 60, FIRE = 100, ACID = 100, WOUND = 15)

/obj/item/clothing/head/helmet/space/hardsuit/heavymining/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate,2,/obj/item/stack/sheet/animalhide/carpdragon, list(BULLET = 5, LASER = 10, BOMB = 5, RAD = 10, WOUND = 2.5))

/obj/item/clothing/suit/space/hardsuit/heavymining
	name = "elite mining hardsuit"
	desc = "A special prototipe suit that protects against agressive, hazardous, low pressure environments and has some bullet and laser protection. Previously used by Nanotrasen in deep space expeditions. Has reinforced plating for wildlife encounters and light cargo exoskelet."
	//item_state = "hvymining_hardsuit"
	icon_state = "hvymining_hardsuit"
	hardsuit_type = "hvymining"
	slowdown = 0.5
	resistance_flags = FIRE_PROOF | ACID_PROOF | LAVA_PROOF
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	armor = list(MELEE = 70, BULLET = 25, LASER = 20, ENERGY = 20, BOMB = 70, BIO = 100, RAD = 60, FIRE = 100, ACID = 100, WOUND = 15)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/heavymining
	strip_delay = 180
	equip_delay_other = 180
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals, /obj/item/resonator, /obj/item/mining_scanner, /obj/item/t_scanner/adv_mining_scanner, /obj/item/gun/energy/kinetic_accelerator, /obj/item/kinetic_crusher, /obj/item/pickaxe, /obj/item/pickaxe/drill/jackhammer, /obj/item/shield/riot/goliath)

/obj/item/clothing/suit/space/hardsuit/heavymining/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate,2,/obj/item/stack/sheet/animalhide/carpdragon, list(BULLET = 5, LASER = 10, BOMB = 5, RAD = 15, WOUND = 2.5))

//Medical
/obj/item/clothing/head/helmet/space/hardsuit/medical
	name = "medical hardsuit helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment."
	icon_state = "medical_helm0"
	//item_state = "medical_helm"
	hardsuit_type = "medical"
	light_color = LIGHT_COLOR_BLUEGREEN

/obj/item/clothing/suit/space/hardsuit/medical
	name = "medical hardsuit"
	desc = "A special suit that protects against hazardous, low pressure environments."
	icon_state = "medical_hardsuit"
	//item_state = "medical_hardsuit"
	slowdown = 1

/obj/item/clothing/head/helmet/space/hardsuit/medical/rescue
	name = "rescue hardsuit helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. Built with lightweight materials for extra comfort."
	icon_state = "rescue_helm0"
	//item_state = "rescue_helm"
	hardsuit_type = "rescue"

/obj/item/clothing/head/helmet/space/hardsuit/medical/rescue/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		var/datum/atom_hud/MHUD = GLOB.huds[DATA_HUD_MEDICAL_BASIC]
		MHUD.show_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/medical/rescue/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/MHUD = GLOB.huds[DATA_HUD_MEDICAL_BASIC]
		MHUD.hide_from(user)

/obj/item/clothing/suit/space/hardsuit/medical/rescue
	name = "rescue hardsuit"
	desc = "A special suit that protects against hazardous, low pressure environments. Built with lightweight materials for easier movement."
	icon_state = "rescue_hardsuit"
	//item_state = "rescue_hardsuit"
	hardsuit_type = "rescue"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/medical/rescue
	slowdown = 0.7

//Research Director hardsuit
/obj/item/clothing/head/helmet/space/hardsuit/rd
	icon_state = "rd_helm0"
	//item_state = "rd_helm"
	hardsuit_type = "rd"

/obj/item/clothing/suit/space/hardsuit/rd
	icon_state = "rd_hardsuit"
	//item_state = "rd_hardsuit"
	alternate_worn_layer = HAIR_LAYER - 1

/obj/item/clothing/head/helmet/space/hardsuit/ancient
	name = "prototype hardsuit helmet"
	desc = "Early prototype hardsuit helmet, designed to quickly shift over a user's head. Design constraints of the helmet mean it has no inbuilt cameras, thus it restricts the users visability."
	icon_state = "ancient_helm0"
	//item_state = "ancient_helm"
	hardsuit_type = "ancient"
	armor = list(MELEE = 30, BULLET = 5, LASER = 5, ENERGY = 0, BOMB = 50, BIO = 100, RAD = 100, FIRE = 100, ACID = 75, ELECTRIC = 100)
	resistance_flags = FIRE_PROOF

/obj/item/clothing/suit/space/hardsuit/ancient
	name = "prototype hardsuit"
	desc = "Prototype powered hardsuit. Provides excellent protection from the elements of space while being comfortable to move around in, thanks to the powered locomotives. Remains very bulky however."
	icon_state = "ancient_hardsuit"
	//item_state = "ancient_hardsuit"

// sec dep override
/obj/item/clothing/head/helmet/space/hardsuit/security
	desc = "A standart security helmet designed for work in a hazardous, low pressure environment. Has an additional layer of armor."
	icon_state = "sec_helm0"
	//item_state = "sec_helm"
	hardsuit_type = "sec"
	light_range = 5
	light_color = LIGHT_COLOR_RED

/obj/item/clothing/suit/space/hardsuit/security
	desc = "A standart issue security suit that protects against hazardous, low pressure environments. Has an additional layer of armor."
	icon_state = "sec_hardsuit"
	//item_state = "sec_hardsuit"

/obj/item/clothing/head/helmet/space/hardsuit/security/pilot
	name = "security pilots's hardsuit helmet"
	desc = "A special security helmet designed for long-term operations in a hazardous, low pressure environment. Has an additional layer of armor for wildlife encounters."
	icon_state = "pilot_helm0"
	//item_state = "pilot_helm"
	hardsuit_type = "pilot"
	light_color = LIGHT_COLOR_LIGHT_CYAN
	armor = list(MELEE = 45, BULLET = 25, LASER = 30, ENERGY = 0, BOMB = 50, BIO = 100, RAD = 50, FIRE = 85, ACID = 85, WOUND = 20, ELECTRIC = 100)

/obj/item/clothing/head/helmet/space/hardsuit/security/pilot/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		DHUD.show_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/security/pilot/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		DHUD.hide_from(user)

/obj/item/clothing/suit/space/hardsuit/security/pilot
	name = "security pilots's hardsuit"
	desc = "A special security suit designed for long-term operations in hazardous, low pressure environments. Has an additional layer of armor for wildlife encounters."
	icon_state = "pilot_hardsuit"
	//item_state = "pilot_hardsuit"
	armor = list(MELEE = 45, BULLET = 25, LASER = 30, ENERGY = 0, BOMB = 50, BIO = 100, RAD = 50, FIRE = 85, ACID = 85, WOUND = 20, ELECTRIC = 100)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/security/pilot
	jetpack = /obj/item/tank/jetpack/suit

/obj/item/clothing/head/helmet/space/hardsuit/security/warden
	name = "warden's hardsuit helmet"
	desc = "A special bulky spaceproof helmet worn by the NT security low-rank command staff. Has additional energy protection."
	icon_state = "warden_helm0"
	//item_state = "warden_helm"
	hardsuit_type = "warden"
	light_color = LIGHT_COLOR_YELLOW
	armor = list(MELEE = 40, BULLET = 30, LASER = 30, ENERGY = 20, BOMB = 45, BIO = 100, RAD = 50, FIRE = 85, ACID = 85, WOUND = 20, ELECTRIC = 100)

/obj/item/clothing/suit/space/hardsuit/security/warden
	name = "warden's hardsuit"
	desc = "A special suit that protects against hazardous, low pressure environments. Has additional energy protection."
	icon_state = "warden_hardsuit"
	//item_state = "warden_hardsuit"
	armor = list(MELEE = 40, BULLET = 30, LASER = 30, ENERGY = 20, BOMB = 45, BIO = 100, RAD = 50, FIRE = 85, ACID = 85, WOUND = 20, ELECTRIC = 100)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/security/warden

/obj/item/clothing/head/helmet/space/hardsuit/security/hos
	name = "head of security's hardsuit helmet"
	desc = "A special bulky helmet worn by the NT security elite. Heavy armoured, space ready and somewhat fire resistant."
	icon_state = "sechos_helm0"
	//item_state = "sechos_helm"
	hardsuit_type = "sechos"
	light_color = LIGHT_COLOR_YELLOW
	armor = list(MELEE = 45, BULLET = 30, LASER = 30, ENERGY = 10, BOMB = 50, BIO = 100, RAD = 50, FIRE = 95, ACID = 95, WOUND = 25, ELECTRIC = 100)

/obj/item/clothing/suit/space/hardsuit/security/hos
	name = "head of security's hardsuit"
	desc = "A special bulky suit that protects against various hazardous, low pressure environments. Heavy armoured, space ready and somewhat fire resistant."
	icon_state = "sechos_hardsuit"
	//item_state = "sechos_hardsuit"
	armor = list(MELEE = 45, BULLET = 30, LASER = 30, ENERGY = 10, BOMB = 50, BIO = 100, RAD = 50, FIRE = 95, ACID = 95, WOUND = 25, ELECTRIC = 100)
	slowdown = 1.1


//ERT
/obj/item/clothing/head/helmet/space/hardsuit/ert
	name = "emergency response team helmet"
	desc = "The integrated helmet of an ERT hardsuit."
	icon_state = "nt_combathard_helm0"
	//item_state = "nt_combathard_helm"
	hardsuit_type = "nt_combathard"
	armor = list(MELEE = 45, BULLET = 40, LASER = 40, ENERGY = 40, BOMB = 50, BIO = 100, RAD = 100, FIRE = 80, ACID = 80, WOUND = 10, ELECTRIC = 100)

/obj/item/clothing/suit/space/hardsuit/ert
	name = "emergency response team hardsuit"
	desc = "The standard issue hardsuit of the ERT. Offers superb protection against environmental hazards."
	icon_state = "nt_combat_hardsuit"
	//item_state = "nt_combat_hardsuit"
	armor = list(MELEE = 45, BULLET = 40, LASER = 40, ENERGY = 35, BOMB = 50, BIO = 100, RAD = 100, FIRE = 80, ACID = 80, WOUND = 10, ELECTRIC = 100)
	slowdown = 0.5

/obj/item/clothing/head/helmet/space/hardsuit/ert/command
	name = "emergency response team commander helmet"
	desc = "The integrated helmet of an ERT hardsuit, this one has blue highlights."
	icon_state = "ert_commandhard_helm0"
	//item_state = "ert_commandhard_helm"
	hardsuit_type = "ert_commandhard"

/obj/item/clothing/suit/space/hardsuit/ert/command
	name = "emergency response team commander hardsuit"
	desc = "The standard issue hardsuit of the ERT, this one has blue highlights. Offers superb protection against environmental hazards."
	icon_state = "ert_command_hardsuit"
	//item_state = "ert_command_hardsuit"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/command

/obj/item/clothing/head/helmet/space/hardsuit/ert/sec
	name = "emergency response team security helmet"
	desc = "The integrated helmet of an ERT hardsuit, this one has red highlights."
	icon_state = "ert_sechard_helm0"
	//item_state = "ert_sechard_helm"
	hardsuit_type = "ert_sechard"

/obj/item/clothing/suit/space/hardsuit/ert/sec
	name = "emergency response team security hardsuit"
	desc = "The standard issue hardsuit of the ERT, this one has red highlights. Offers superb protection against environmental hazards."
	icon_state = "ert_security_hardsuit"
	//item_state = "ert_security_hardsuit"

/obj/item/clothing/head/helmet/space/hardsuit/ert/engi
	icon_state = "ert_engihard_helm0"
	//item_state = "ert_engihard_helm"
	hardsuit_type = "ert_engihard"

/obj/item/clothing/suit/space/hardsuit/ert/engi
	icon_state = "ert_engineer_hardsuit"
	//item_state = "ert_engineer_hardsuit"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/engi

/obj/item/clothing/head/helmet/space/hardsuit/ert/med
	icon_state = "ert_medicalhard_helm0"
	//item_state = "ert_medicalhard_helm"
	hardsuit_type = "ert_medicalhard"

/obj/item/clothing/suit/space/hardsuit/ert/med
	icon_state = "ert_medical_hardsuit"
	//item_state = "ert_medical_hardsuit"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/med

/obj/item/clothing/head/helmet/space/hardsuit/ert/jani
	icon_state = "ert_janitorhard_helm0"
	//item_state = "ert_janitorhard_helm"
	hardsuit_type = "ert_security"

/obj/item/clothing/suit/space/hardsuit/ert/jani
	icon_state = "ert_janitor_hardsuit"
	//item_state = "ert_janitor_hardsuit"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/jani

/obj/item/clothing/head/helmet/space/hardsuit/ert/plated
	name = "emergency response team plated helmet"
	desc = "The integrated helmet of an ERT hardsuit, this one has reinforced plasceramic plating."
	armor = list(MELEE = 50, BULLET = 60, LASER = 40, ENERGY = 40, BOMB = 60, BIO = 100, RAD = 100, FIRE = 80, ACID = 80, WOUND = 10, ELECTRIC = 100)

/obj/item/clothing/suit/space/hardsuit/ert/plated
	name = "emergency response team plated hardsuit"
	desc = "Special plated hardsuit of the ERT. Offers superb protection against environmental hazards."
	icon_state = "nt_combat_plated_hardsuit"
	//item_state = "nt_combat_plated_hardsuit"
	armor = list(MELEE = 50, BULLET = 60, LASER = 40, ENERGY = 35, BOMB = 60, BIO = 100, RAD = 100, FIRE = 80, ACID = 80, WOUND = 10, ELECTRIC = 100)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/plated
	slowdown = 0.7

/obj/item/clothing/head/helmet/space/hardsuit/ert/plated/command
	name = "emergency response team commander helmet"
	icon_state = "ert_commandhard_helm0"
	//item_state = "ert_commandhard_helm"
	hardsuit_type = "nt_command"

/obj/item/clothing/suit/space/hardsuit/ert/plated/command
	name = "emergency response team commander hardsuit"
	icon_state = "ert_command_plated_hardsuit"
	//item_state = "ert_command_plated_hardsuit"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/plated/command

/obj/item/clothing/head/helmet/space/hardsuit/ert/plated/sec
	icon_state = "ert_sechard_helm0"
	//item_state = "ert_sechard_helm"
	hardsuit_type = "ert_sechard"

/obj/item/clothing/suit/space/hardsuit/ert/plated/sec
	icon_state = "ert_security_plated_hardsuit"
	//item_state = "ert_security_plated_hardsuit"

/obj/item/clothing/head/helmet/space/hardsuit/ert/plated/engi
	icon_state = "ert_engihard_helm0"
	//item_state = "ert_engihard_helm"
	hardsuit_type = "ert_engihard"

/obj/item/clothing/suit/space/hardsuit/ert/plated/engi
	icon_state = "ert_security_plated_hardsuit"
	//item_state = "ert_security_plated_hardsuit"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/engi

/obj/item/clothing/head/helmet/space/hardsuit/ert/plated/med
	icon_state = "ert_medicalhard_helm0"
	//item_state = "ert_medicalhard_helm"
	hardsuit_type = "ert_medicalhard"

/obj/item/clothing/suit/space/hardsuit/ert/plated/med
	icon_state = "ert_medical_plated_hardsuit"
	//item_state = "ert_security_plated_hardsuit"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/med

/obj/item/clothing/head/helmet/space/hardsuit/ert/plated/jani
	icon_state = "ert_sechard_helm0"
	//item_state = "ert_sechard_helm"
	hardsuit_type = "ert_security"

/obj/item/clothing/suit/space/hardsuit/ert/plated/jani
	icon_state = "ert_security_plated_hardsuit"
	//item_state = "ert_security_plated_hardsuit"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/jani

	//SWAT MKII
//The main idea of these suits: Nanotrasen original design, spaceworthy, robust, heavy. On station will be present only one - swat/captain/mk4
/obj/item/clothing/head/helmet/space/hardsuit/swat
	icon_state = "swat2_helm"
	//item_state = "swat2_helm"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR //we don`t want to see the mask

/obj/item/clothing/suit/space/hardsuit/swat

	//Captain MKII
/obj/item/clothing/head/helmet/space/hardsuit/swat/captain
	name = "\improper MK.II captain's hardsuit helmet"
	icon_state = "swat2_cap_helm0"
	//item_state = "swat2_cap_helm"
	hardsuit_type = "swat2_cap"
	actions_types = list(/datum/action/item_action/toggle_helmet_light)

/obj/item/clothing/head/helmet/space/hardsuit/swat/captain/attack_self(mob/user)
	on = !on
	icon_state = "[hardsuit_type]_helm[on]"
	user.update_inv_head()	//so our mob-overlays update

	set_light_on(on)

	for(var/X in actions)
		var/datum/action/A = X
		A.build_all_button_icons()

/obj/item/clothing/suit/space/hardsuit/swat/captain
	name = "\improper MK.II captain's SWAT suit"
	desc = "A MK.II SWAT suit with streamlined joints and armor made out of superior materials, insulated against intense heat. The most advanced tactical armor available. Usually reserved for heavy hitter corporate security, this one has a regal finish in Nanotrasen company colors. Better not let the assistants get a hold of it."
	icon_state = "swat2_cap_hardsuit"
	//item_state = "swat2_cap_hardsuit"

///Deathsquad MKII///
/obj/item/clothing/head/helmet/space/hardsuit/deathsquad
	name = "\improper Prototype MK.III SWAT Helmet"
	desc = "A prototype SWAT II tactical space helmet."
	icon_state = "swat2_deathsquad_helm0"
	//item_state = "swat2_deathsquad_helm"
	hardsuit_type = "swat2_deathsquad"
	light_color = LIGHT_COLOR_BLUE

/obj/item/clothing/suit/space/hardsuit/deathsquad
	name = "\improper Prototype MK.III SWAT Suit"
	icon_state = "swat2_deathsquad_hardsuit"
	//item_state = "swat2_deathsquad_hardsuit"
	desc = "A prototype designed to replace the ageing MK.II SWAT suit. \
		Based on the streamlined MK.II model, the traditional ceramic and graphene plate\
		construction was replaced with plasteel, allowing superior armor against most threats."
	slowdown = 1


	//SWAT MKIV
/obj/item/clothing/head/helmet/space/hardsuit/swat/mk4
	name = "\improper Prototype MK.IV SWAT Helmet"
	desc = "An advanced tactical SWAT helmet MK.III."
	armor = list(MELEE = 40, BULLET = 60, LASER = 50, ENERGY = 30, BOMB = 55, BIO = 100, RAD = 50, FIRE = 100, ACID = 100, WOUND = 20, ELECTRIC = 100)
	icon_state = "swat4_helm"
	//item_state = "swat4_helm"
	hardsuit_type = "swat4"

/obj/item/clothing/suit/space/hardsuit/swat/mk4
	name = "\improper MK.IV SWAT Suit"
	desc = "A new line of SWAT suits designed to replace the ageing MK.II SWAT suit. \
		Based on the streamlined MK.II model, the traditional ceramic and graphene plate construction\
		was replaced with modern plasceramics, providing superior armor against most threats, as well as lighter weight."
	armor = list(MELEE = 40, BULLET = 60, LASER = 50, ENERGY = 30, BOMB = 55, BIO = 100, RAD = 50, FIRE = 100, ACID = 100, WOUND = 20, ELECTRIC = 100)
	icon_state = "swat4_hardsuit"
	//item_state = "swat4_hardsuit"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/swat/mk4
	slowdown = 0.7


	//SWAT MKIV Captain
/obj/item/clothing/head/helmet/space/hardsuit/swat/captain/mk4
	name = "\improper MK.IV captain's hardsuit helmet"
	desc = "A prototype SWAT helmet issued for use with the station High Lord himself. \
		The predatory helmet design evokes the chain of command. \
		Helmet`s armor grants protection against corrosive liquids, explosive blasts, \
		fires, electrical shocks, and contempt from the rest of the crew. \
		Be responsible for the station, manage your Heads of Staff, \
		keep the crew alive, be prepared to do anything and everything or die \
		horribly trying."
	icon_state = "swat4_cap_helm0"
	//item_state = "swat4_cap_helm"
	hardsuit_type = "swat4_cap"
	armor = list(MELEE = 40, BULLET = 60, LASER = 50, ENERGY = 30, BOMB = 55, BIO = 100, RAD = 50, FIRE = 100, ACID = 100, WOUND = 20, ELECTRIC = 100)
	
/obj/item/clothing/suit/space/hardsuit/swat/captain/mk4
	name = "\improper MK.IV captain's SWAT suit"
	desc = "A MK.IV SWAT suit with streamlined joints and armor made out of superior materials, \
		insulated against intense heat. The most advanced tactical armor available. Usually reserved \
		for heavy hitter corporate security, this one has a regal finish NT company colors. \
		Remind yourself that overconfidence is slow and insidious killer."
	icon_state = "swat4_cap_hardsuit"
	//item_state = "swat4_cap_hardsuit"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/swat/captain/mk4
	armor = list(MELEE = 40, BULLET = 60, LASER = 50, ENERGY = 30, BOMB = 55, BIO = 100, RAD = 50, FIRE = 100, ACID = 100, WOUND = 20, ELECTRIC = 100)
	slowdown = 0.7

/obj/item/clothing/suit/space/hardsuit/swat/captain/mk4/Initialize(mapload)
	. = ..()
	allowed = list(/obj/item/ammo_box, /obj/item/ammo_casing, /obj/item/flashlight, /obj/item/gun/ballistic, /obj/item/gun/energy, /obj/item/melee/baton, /obj/item/melee/classic_baton, /obj/item/reagent_containers/spray/pepper, /obj/item/restraints/handcuffs, /obj/item/tank/internals, /obj/item/tank/jetpack/oxygen/captain)

	//SWAT MKV Deathsquad
/obj/item/clothing/head/helmet/space/hardsuit/deathsquad/mk5
	name = "\improper MK.V SWAT helmet"
	desc = "The most advanced tactical helmet. EVER. MADE."
	icon_state = "swat5_deathsquad_helm0"
	//item_state = "swat5_deathsquad_helm"
	hardsuit_type = "swat5_deathsquad"
	armor = list(MELEE = 90, BULLET = 100, LASER = 60, ENERGY = 50, BOMB = 100, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 30, ELECTRIC = 100)
	
/obj/item/clothing/suit/space/hardsuit/deathsquad/mk5
	name = "\improper MK.V SWAT suit"
	desc = "A bulky and technological suit with ominous black and red paiting worn by \
		Nanotrasen Black Ops teams. If you can see this suit, you fucked up. \
		Heavy plasteel plates was replaced with bluespace-pocket plasceramic ultra-dense plating. \
		Providing greate mobility and an impossible level of armor protection against all kinds of threats."
	icon_state = "swat5_deathsquad_hardsuit"
	//item_state = "swat5_deathsquad_hardsuit"
	hardsuit_type = "swat5_deathsquad"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/deathsquad/mk5
	armor = list(MELEE = 90, BULLET = 100, LASER = 60, ENERGY = 50, BOMB = 100, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 30, ELECTRIC = 100)
	slowdown = 0.5

/obj/item/clothing/head/helmet/space/hardsuit/deathsquad/mk5/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		var/datum/atom_hud/SHUD = GLOB.huds[DATA_HUD_SECURITY_MEDICAL]
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		SHUD.show_to(user)
		DHUD.show_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/deathsquad/mk5/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/SHUD = GLOB.huds[DATA_HUD_SECURITY_MEDICAL]
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		SHUD.hide_from(user)
		DHUD.hide_from(user)

/obj/item/clothing/suit/space/hardsuit/deathsquad/mk5/Initialize()
	. = ..()
	AddComponent(/datum/component/anti_magic, antimagic_flags = ALL, inventory_flags = ITEM_SLOT_OCLOTHING)


	//Wizard hardsuit
/obj/item/clothing/head/helmet/space/hardsuit/wizard
	name = "gem-encrusted hardsuit helmet"
	desc = "A bizarre gem-encrusted helmet that radiates magical energies."
	icon_state = "wiz_helm0"
	//item_state = "wiz_helm"
	hardsuit_type = "wiz"
	light_color = LIGHT_COLOR_PURPLE
	resistance_flags = FIRE_PROOF | ACID_PROOF
	armor = list(MELEE = 20, BULLET = 20, LASER = 20, ENERGY = 20, BOMB = 25, BIO = 100, RAD = 50, FIRE = 100, ACID = 100, WOUND = 30, ELECTRIC = 100)
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT

/obj/item/clothing/suit/space/hardsuit/wizard
	icon_state = "wiz_hardsuit"
	name = "gem-encrusted hardsuit"
	desc = "A bizarre gem-encrusted suit that radiates magical energies."
	//item_state = "hardsuit-wiz"
	w_class = WEIGHT_CLASS_NORMAL
	resistance_flags = FIRE_PROOF | ACID_PROOF
	armor = list(MELEE = 20, BULLET = 20, LASER = 20, ENERGY = 20, BOMB = 25, BIO = 100, RAD = 50, FIRE = 100, ACID = 100, WOUND = 30, ELECTRIC = 100)
	allowed = list(/obj/item/teleportation_scroll, /obj/item/tank/internals)
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/wizard
	slowdown = 0
	clothing_traits = list(TRAIT_ANTIMAGIC_NO_SELFBLOCK)