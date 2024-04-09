/obj/item/defibrillator
	icon = 'modular_dripstation/icons/obj/defib.dmi'

/obj/item/defibrillator/compact
	name = "compact defibrillator"
	desc = "A belt-equipped defibrillator that can be rapidly deployed."
	icon_state = "defibcompact"
	item_state = "defibcompact"
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT
	cryo_preserve = TRUE

/obj/item/defibrillator/compact/combat
	icon_state = "defibcombat"
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'

/obj/item/defibrillator/compact/combat/make_paddles()
	return new /obj/item/shockpaddles/combat(src)

/obj/item/defibrillator/compact/combat/loaded/Initialize(mapload)
	. = ..()
	paddles = make_paddles()
	cell = new /obj/item/stock_parts/cell/bluespace(src)
	update_appearance(UPDATE_ICON)

/obj/item/defibrillator/compact/advanced
	name = "advanced compact defibrillator"
	desc = "A belt-mounted state-of-the-art defibrillator that can be rapidly deployed in all environments. Uses an experimental self-charging cell, meaning that it will (probably) never stop working. Can be used to defibrillate through space suits. It is impossible to damage."
	icon_state = "defibnt"
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'
	combat = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/obj/item/defibrillator/compact/advanced/make_paddles()
	return new /obj/item/shockpaddles/advanced(src)

/obj/item/defibrillator/compact/advanced/loaded/Initialize(mapload)
	. = ..()
	paddles = make_paddles()
	cell = new /obj/item/stock_parts/cell/super/advanced(src)
	ADD_TRAIT(src, TRAIT_EMPPROOF_SELF, "innate_empproof")
	update_appearance(UPDATE_ICON)

/obj/item/defibrillator/compact/advanced/loaded/attackby(obj/item/W, mob/user, params)
	if(W == paddles)
		toggle_paddles()
		update_appearance(UPDATE_ICON)
		return

/obj/item/stock_parts/cell/super/advanced
	name = "super-capacity selfrecharge advanced power cell"
	desc = "An experimental transdimensional power cell. Selfrecharge and EMP-proof included."
	rating = 6 //self-recharge makes these desirable
	self_recharge = 1 // Infused slime cores self-recharge, over time

/obj/item/stock_parts/cell/super/advanced/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_EMPPROOF_SELF, "innate_empproof")

/obj/item/shockpaddles
	var/heart_attack_chance = 70
	revivecost = 2500

/obj/item/shockpaddles/combat
	name = "combat defibrillator paddles"
	desc = "A pair of high-tech paddles with flat plasteel surfaces to revive deceased operatives (unless they exploded). They possess both the ability to penetrate armor and to deliver powerful or disabling shocks offensively."
	icon_state = "syndiepaddles0"
	base_icon_state = "syndiepaddles"
	icon = 'modular_dripstation/icons/obj/defib.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/equipment/paddles_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/equipment/paddles_righthand.dmi'

/obj/item/shockpaddles/advanced
	name = "advanced defibrillator paddles"
	desc = "A pair of high-tech paddles with flat plasteel surfaces that are used to deliver powerful electric shocks. They possess the ability to penetrate armor to deliver shock."
	icon_state = "ntpaddles0"
	base_icon_state = "ntpaddles"
	heart_attack_chance = 90
	icon = 'modular_dripstation/icons/obj/defib.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/equipment/paddles_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/equipment/paddles_righthand.dmi'