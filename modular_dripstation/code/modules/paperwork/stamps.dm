// #### STAMPS ####
/obj/item/stamp
	icon = 'modular_dripstation/icons/obj/bureaucracy.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/paperwork_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/paperwork_righthand.dmi'
	item_state = "stamp-ok"

/obj/item/stamp/attack(mob/living/M, mob/living/user)
	. = ..()
	playsound(M, get_sfx("stamp_sounds"), 35, 1, -1)

/obj/item/stamp/qm
	item_state = "stamp-qm"

/obj/item/stamp/law
	item_state = "stamp-law"

/obj/item/stamp/mime
	item_state = "stamp-rd"

/obj/item/stamp/captain
	item_state = "stamp-cap"

/obj/item/stamp/hop
	item_state = "stamp-hop"

/obj/item/stamp/hos
	item_state = "stamp-hos"

/obj/item/stamp/ce
	item_state = "stamp-ce"

/obj/item/stamp/rd
	item_state = "stamp-rd"

/obj/item/stamp/cmo
	item_state = "stamp-cmo"

/obj/item/stamp/denied
	item_state = "stamp-deny"

/obj/item/stamp/clown
	item_state = "stamp-clown"

/obj/item/stamp/mime
	item_state = "stamp-mime"

/obj/item/stamp/cent
	item_state = "stamp-cent"

/obj/item/stamp/syndi
	item_state = "stamp-syndi"

/obj/item/stamp/syndiround
	item_state = "stamp-syndi"

/obj/item/stamp/warden
	name = "warden's rubber stamp"
	icon_state = "stamp-ward"
	item_state = "stamp-hos"
	dye_color = DYE_WARD

/obj/item/stamp/chap
	name = "chaplain's seal"
	icon_state = "stamp-chap"
	item_state = "stamp-chap"
	dye_color = DYE_CHAP

/obj/item/stamp/blueshield
	name = "Blueshield's rubber stamp"
	icon_state = "stamp-blueshield"
	item_state = "stamp-blueshield"
	dye_color = DYE_BLUES

/obj/item/stamp/magistrate
	name = "Magistrate's rubber stamp"
	icon_state = "stamp-magistrate"
	item_state = "stamp-magistrate"
	dye_color = DYE_MAGI

/obj/item/stamp/ntrep
	name = "Nanotrasen Representative's rubber stamp"
	icon_state = "stamp-rep"
	item_state = "stamp-rep"
	dye_color = DYE_NTREP
