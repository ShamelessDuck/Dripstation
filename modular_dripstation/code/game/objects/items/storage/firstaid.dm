/obj/item/storage/firstaid
	icon = 'modular_dripstation/icons/obj/storage.dmi'

/obj/item/storage/pill_bottle
	item_state = "pill_canister"
	icon = 'modular_dripstation/icons/obj/chemical.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/equipment/chemistry_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/equipment/chemistry_righthand.dmi'
	drop_sound = 'modular_dripstation/sound/drop/pillbottle.ogg'
	pickup_sound = 'modular_dripstation/sound/pickup/pillbottle.ogg'	

/obj/item/storage/pill_bottle/gummies
	item_state = "pill_canister_large"

/obj/item/storage/pill_bottle/ondansetron
	name = "ondansetron patches"
	desc = "A bottle containing patches of ondansetron, a drug used to treat nausea and vomiting. May cause drowsiness."

/obj/item/storage/pill_bottle/ondansetron/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/patch/ondansetron(src)

