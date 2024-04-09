//////Void suits//////
/obj/item/clothing/head/helmet/space
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 100, RAD = 50, FIRE = 40, ACID = 70, WOUND = 0, ELECTRIC = 50)
	icon_state = "helm-spaceold"
	//item_state = "helm-spaceold"
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/spacesuits/helmets.dmi'


/obj/item/clothing/suit/space
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 100, RAD = 50, FIRE = 40, ACID = 70, WOUND = 0, ELECTRIC = 50)
	icon_state = "spaceold"
	//item_state = "spaceold"
	desc = "A suit that protects against low pressure environments. Has a big 13 on the back."
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/spacesuits/suits.dmi'

//////STANDART NT//////
/obj/item/clothing/head/helmet/space/eva
	icon_state = "helm-space"
	//item_state = "helm-space"

/obj/item/clothing/suit/space/eva
	icon_state = "space"
	//item_state = "space"
	desc = "A suit that protects against low pressure environments. Has a big NT logo on the back."

//////EXPLORER NT//////
/obj/item/clothing/head/helmet/space/explorer
	name = "explorer space helmet"
	icon_state = "helm-explorer"
	//item_state = "helm-explorer"
	desc = "A special helmet with solar UV shielding to protect your eyes from harmful rays. The helmet materials seams a bit reinforced."
	armor = list(MELEE = 15, BULLET = 15, LASER = 0, ENERGY = 0, BOMB = 20, BIO = 100, RAD = 70, FIRE = 60, ACID = 65, WOUND = 0, ELECTRIC = 100)

/obj/item/clothing/suit/space/explorer
	name = "explorer space suit"
	icon_state = "explorer"
	//item_state = "explorer"
	desc = "A suit that protects against low pressure environments. Has a big NT logo on the back. This variation has reinforced bulletproof plating."
	armor = list(MELEE = 25, BULLET = 25, LASER = 0, ENERGY = 0, BOMB = 20, BIO = 100, RAD = 70, FIRE = 60, ACID = 65, WOUND = 0, ELECTRIC = 100)


//////PARAMEDIC NT//////
/obj/item/clothing/head/helmet/space/paramedic
	name = "rescue space helmet"
	icon_state = "helm-paramedic"
	//item_state = "helm-paramedic"
	desc = "A special helmet with solar UV shielding to protect your eyes from harmful rays."
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 100, RAD = 50, FIRE = 40, ACID = 70, WOUND = 0, ELECTRIC = 100)

/obj/item/clothing/suit/space/paramedic
	name = "rescue space suit"
	desc = "A suit that protects against low pressure environments. Has a big NT logo on the back. Seams lightweight."
	icon_state = "paramedic"
	//item_state = "paramedic"
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 100, RAD = 50, FIRE = 40, ACID = 70, WOUND = 0, ELECTRIC = 100)
	slowdown = 0.7
	w_class = WEIGHT_CLASS_NORMAL


//////HEADS NT//////
/obj/item/clothing/head/helmet/space/heads
	name = "command space helmet"
	icon_state = "helm-command"
	//item_state = "helm-command"
	desc = "A special helmet with solar UV shielding to protect your eyes from harmful rays. The helmet materials seams reinforced."
	armor = list(MELEE = 10, BULLET = 10, LASER = 10,ENERGY = 10, BOMB = 0, BIO = 100, RAD = 50, FIRE = 40, ACID = 65, WOUND = 0, ELECTRIC = 100)

/obj/item/clothing/suit/space/heads
	name = "command space suit"
	icon_state = "command"
	//item_state = "command"
	desc = "A suit that protects against low pressure environments. Has a big NT logo on the back. This variation has reinforced seams."
	armor = list(MELEE = 15, BULLET = 15, LASER = 15, ENERGY = 10, BOMB = 0, BIO = 100, RAD = 50, FIRE = 40, ACID = 65, WOUND = 0, ELECTRIC = 100)


//////AMBER NT//////
/obj/item/clothing/head/helmet/space/amber
	name = "amber space helmet"
	icon_state = "helm-amber"
	//item_state = "helm-amber"
	desc = "A special helmet with solar UV shielding to protect your eyes from harmful rays. The helmet materials seams reinforced. Has a tag on it: NT military property."
	armor = list(MELEE = 30, BULLET = 30, LASER = 30,ENERGY = 25, BOMB = 30, BIO = 100, RAD = 30, FIRE = 80, ACID = 85, WOUND = 10, ELECTRIC = 100)

/obj/item/clothing/suit/space/amber
	name = "amber space helmet"
	icon_state = "space-amber"
	//item_state = "space-amber"
	desc = "A special helmet with solar UV shielding to protect your eyes from harmful rays. The suit materials seams reinforced. Has a tag on it: NT military property."
	armor = list(MELEE = 30, BULLET = 30, LASER = 30,ENERGY = 25, BOMB = 30, BIO = 100, RAD = 30, FIRE = 80, ACID = 85, WOUND = 10, ELECTRIC = 100)


//////Space Slav//////
/obj/item/clothing/head/helmet/space/cosmonaut
	icon_state = "helm-cosmonaut"
	//item_state = "helm-cosmonaut"
	desc = "A special helmet with solar UV shielding to protect your eyes from harmful rays. Has a red star on the forehead."
	armor = list(MELEE = 15, BULLET = 20, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 100, RAD = 50, FIRE = 40, ACID = 65, WOUND = 10, ELECTRIC = 100)

/obj/item/clothing/suit/space/cosmonaut
	icon_state = "cosmonaut"
	//item_state = "cosmonaut"
	desc = "A suit that protects against low pressure environments. Seams reinforced. Likely slav-made."
	armor = list(MELEE = 15, BULLET = 20, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 100, RAD = 50, FIRE = 40, ACID = 65, WOUND = 10, ELECTRIC = 100)

/obj/item/clothing/head/helmet/space/cosmonaut/combat
	icon_state = "helm-cosmonaut-combat"
	//item_state = "helm-cosmonaut-combat"
	desc = "A special helmet with solar UV shielding to protect your eyes from harmful rays. Has a red star on the forehead."
	armor = list(MELEE = 40, BULLET = 50, LASER = 0, ENERGY = 30, BOMB = 50, BIO = 100, RAD = 50, FIRE = 80, ACID = 65, WOUND = 10, ELECTRIC = 100)

/obj/item/clothing/suit/space/cosmonaut/combat
	icon_state = "cosmonaut-combat"
	//item_state = "cosmonaut-combat"
	desc = "A special combat suit that protects against low pressure environments. Lacks laser protection. Has a identification chevron of USSP military forces."
	armor = list(MELEE = 40, BULLET = 50, LASER = 0, ENERGY = 30, BOMB = 50, BIO = 100, RAD = 50, FIRE = 80, ACID = 65, WOUND = 10, ELECTRIC = 100)
	slowdown = 0.5


//////Emergency//////
/obj/item/clothing/head/helmet/space/orange
	icon_state = "helm-emergency"
	//item_state = "helm-emergency"

/obj/item/clothing/suit/space/orange
	icon_state = "emergency"
	//item_state = "emergency"
	slowdown = 2

/obj/item/clothing/head/helmet/space/fragile
	icon_state = "helm-emergency_lethal"
	//item_state = "helm-emergency_lethal"
	armor = list(MELEE = 10, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 100, RAD = 10, FIRE = 0, ACID = 0)

/obj/item/clothing/suit/space/fragile
	icon_state = "emergency_lethal"
	//item_state = "emergency_lethal"
	armor = list(MELEE = 5, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 100, RAD = 10, FIRE = 0, ACID = 0)

/obj/item/clothing/suit/space/fragile/elite
	desc = "A bulky, air-tight suit meant to protect the user during emergency situations. It looks somewhat durable."
	icon_state = "emergency_lethal_elite"
	//item_state = "emergency_lethal_elite"
	w_class = WEIGHT_CLASS_NORMAL
	allowed = list(/obj/item/gun, /obj/item/ammo_box, /obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/restraints/handcuffs, /obj/item/tank/internals)
	armor = list(MELEE = 10, BULLET = 0, LASER = 10, ENERGY = 10, BOMB = 0, BIO = 100, RAD = 20, FIRE = 40, ACID = 0)

/obj/item/clothing/suit/space/fragile/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(!torn && prob(30))
		to_chat(owner, span_warning("[src] tears from the damage, breaking the air-tight seal!"))
		clothing_flags &= ~STOPSPRESSUREDAMAGE
		name = "torn [src]."
		desc = "A bulky suit meant to protect the user during emergency situations, at least until someone tore a hole in the suit."
		torn = TRUE
		playsound(loc, 'sound/weapons/slashmiss.ogg', 50, 1)
		playsound(loc, 'sound/effects/refill.ogg', 50, 1)

//////Syndicate//////
/obj/item/clothing/head/helmet/space/syndicate
	icon_state = "helm-syndicate"
	//item_state = "helm-syndicate"
	armor = list(MELEE = 40, BULLET = 50, LASER = 30,ENERGY = 25, BOMB = 30, BIO = 100, RAD = 30, FIRE = 80, ACID = 85, WOUND = 10, ELECTRIC = 100)

/obj/item/clothing/suit/space/syndicate
	icon_state = "syndicate"
	//item_state = "syndicate"
	armor = list(MELEE = 40, BULLET = 50, LASER = 30,ENERGY = 25, BOMB = 30, BIO = 100, RAD = 30, FIRE = 80, ACID = 85, WOUND = 10, ELECTRIC = 100)


//Black syndicate space suit
/obj/item/clothing/head/helmet/space/syndicate/black
	icon_state = "helm-syndicate-black"
	//item_state = "helm-syndicate-black"

/obj/item/clothing/suit/space/syndicate/black
	icon_state = "syndicate-black"
	//item_state = "syndicate-black"


//Black-red syndicate space suit
/obj/item/clothing/head/helmet/space/syndicate/black/red
	icon_state = "helm-syndicate-black-red"
	//item_state = "helm-syndicate-black-red"

/obj/item/clothing/suit/space/syndicate/black/red
	icon_state = "syndicate-black-red"
	//item_state = "syndicate-black-red"


//Black medical syndicate space suit
/obj/item/clothing/head/helmet/space/syndicate/black/med
	icon_state = "helm-syndicate-black-med"
	//item_state = "helm-syndicate-black-med"

/obj/item/clothing/suit/space/syndicate/black/med
	icon_state = "syndicate-black-med"
	//item_state = "syndicate-black-med"


//Black with yellow/red engineering syndicate space suit
/obj/item/clothing/head/helmet/space/syndicate/black/engie
	icon_state = "helm-syndicate-black-engie"
	//item_state = "helm-syndicate-black-engie"

/obj/item/clothing/suit/space/syndicate/black/engie
	icon_state = "syndicate-black-engie"
	//item_state = "syndicate-black-engie"


//Standart syndicate contract varient
/obj/item/clothing/head/helmet/space/syndicate/contract
	slowdown = 0					//funny, fuck it
	icon_state = "helm-syndicate-contract"
	//item_state = "helm-syndicate-contract"

/obj/item/clothing/suit/space/syndicate/contract
	icon_state = "syndicate-contract"
	//item_state = "syndicate-contract"


//////Space pirate outfit//////
/obj/item/clothing/head/helmet/space/pirate
	icon_state = "helm-pirate"
	//item_state = "pirate"

/obj/item/clothing/head/helmet/space/pirate/bandana
	icon_state = "helm-bandana"
	//item_state = "bandana"

/obj/item/clothing/head/helmet/space/pirate/captain
	icon_state = "helm-hgpiratecap"
	//item_state = "hgpiratecap"

/obj/item/clothing/suit/space/pirate
	icon_state = "pirate"
	//item_state = "pirate"
	slowdown = 0.55

/obj/item/clothing/suit/space/pirate/captain
	icon_state = "hgpirate"
	//item_state = "hgpirate"




/obj/item/clothing/head/helmet/space/plasmaman
	icon = 'icons/obj/clothing/hats/hats.dmi'
	mob_overlay_icon = 'icons/mob/clothing/head/head.dmi'

/obj/item/clothing/suit/space/eva/plasmaman
	icon = 'icons/obj/clothing/suits/suits.dmi'
	mob_overlay_icon = 'icons/mob/clothing/suit/suit.dmi'