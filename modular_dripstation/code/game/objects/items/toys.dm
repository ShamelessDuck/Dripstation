/obj/item/toy/talking/codex_gigas
	icon = 'modular_dripstation/icons/obj/library.dmi'

/obj/item/toy/desk
	var/on = FALSE
	icon = 'modular_dripstation/icons/obj/toy.dmi'

/obj/item/toy/desk/update_icon()
	. = ..()
	if(on)
		icon_state = "[initial(icon_state)]-on"
	else
		icon_state = initial(icon_state)

/obj/item/toy/desk/attack_self(mob/user)
	activate(user)

/obj/item/toy/desk/AltClick(mob/user)
	activate(user)

/obj/item/toy/desk/proc/activate(mob/user)
	on = !on
	playsound(src.loc, "button", 75, 1)
	update_icon()
	return 1

/obj/item/toy/desk/fan
	name = "office fan"
	desc = "Your greatest fan. For weeks, the atmospherics department faced a conundrum on how to lower temperatures in a localized area through complicated pipe channels and ventilation systems. The problem was promptly solved by ordering several desk fans."
	icon_state = "fan"

/obj/item/toy/desk/newtoncradle
	name = "\improper Newton's cradle"
	desc = "A ancient 21th century super-weapon model demonstrating that Sir Isaac Newton is the deadliest sonuvabitch in space. Aside from car radios, Syndicate raiders are reportedly notorious for stealing these things. It is often theorized that the very same ball bearings are used in black-market cybernetics."
	icon_state = "newtoncradle"

/obj/item/toy/desk/officetoy
	name = "office toy"
	desc = "A generic microfusion powered office desk toy. Only generates magnetism and ennui. The mechanism inside is a Hephasteus trade secret. No peeking!"
	icon_state = "desktoy"
