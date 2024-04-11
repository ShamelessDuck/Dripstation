/obj/item/folder
	icon = 'modular_dripstation/icons/obj/bureaucracy.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/paperwork_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/paperwork_righthand.dmi'
	drop_sound = 'sound/items/handling/paper_drop.ogg'
	pickup_sound =  'sound/items/handling/paper_pickup.ogg'	

/obj/item/folder/green
	icon_state = "folder_green"

/obj/item/folder/orange
	icon_state = "folder_orange"

/obj/item/folder/purple
	icon_state = "folder_purple"

/obj/item/folder/black
	icon_state = "folder_syndie"

/obj/item/folder/rainbow
	icon_state = "folder_rainbow"

/obj/item/folder/mime
	icon_state = "folder_mime"

/obj/item/folder/captain
	icon_state = "folder_cap"

/obj/item/folder/syndicate/yellow
	icon_state = "folder_syellow"

/obj/item/folder/syndicate/yellow/Initialize()
	. = ..()
	new /obj/item/documents/syndicate/yellow(src)
	update_appearance()

/obj/item/documents/syndicate/yellow
	icon = 'modular_dripstation/icons/obj/bureaucracy.dmi'	
	icon_state = "docs_yellow"
	name = "yellow secret documents"
	desc = "\"Top Secret\" documents detailing sensitive Syndicate operational intelligence. These documents are verified with a yellow wax seal."
