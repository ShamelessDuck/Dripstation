/obj/item/storage/fancy/donut_box
	icon = 'modular_dripstation/icons/obj/food/containers.dmi'

/obj/item/storage/fancy/candle_box
	icon = 'modular_dripstation/icons/obj/candle.dmi'

/obj/item/storage/fancy/cigarettes
	icon = 'modular_dripstation/icons/obj/cigarettes.dmi'

/obj/item/storage/fancy/cigarettes/cigars
	icon = 'modular_dripstation/icons/obj/cigarettes.dmi'

/obj/item/storage/fancy/cigarettes/cigars/havana
	icon_state = "hawaicase"

/obj/item/storage/fancy/cigarettes
	lefthand_file = 'modular_dripstation/icons/mob/inhands/misc/lefthand_cigs_lighters.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/misc/righthand_cigs_lighters.dmi'

/obj/item/storage/fancy/cigarettes/dromedaryco
	item_state = "Dpacket"

/obj/item/storage/fancy/cigarettes/cigpack_uplift
	item_state = "upliftpacket"

/obj/item/storage/fancy/cigarettes/cigpack_robust
	item_state = "robustpacket"

/obj/item/storage/fancy/cigarettes/cigpack_robustgold
	item_state = "robustgpacket"

/obj/item/storage/fancy/cigarettes/cigpack_carp
	item_state = "carppacket"

/obj/item/storage/fancy/cigarettes/cigpack_syndicate
	item_state = "syndiepacket"

/obj/item/storage/fancy/cigarettes/cigpack_midori
	item_state = "midoripacket"

/obj/item/storage/fancy/cigarettes/cigpack_shadyjims
	item_state = "shadyjimpacket"

/obj/item/storage/fancy/cigarettes/cigpack_xeno
	item_state = "slime"

/obj/item/storage/fancy/cigarettes/cigpack_nonico
	item_state = "nonico"

/obj/item/storage/fancy/cigarettes/cigpack_cannabis
	item_state = "midori"

/obj/item/storage/fancy/cigarettes/cigpack_mindbreaker
	item_state = "shadyjimpacket"


/obj/item/storage/fancy/rollingpapers
	icon = 'modular_dripstation/icons/obj/cigarettes.dmi'
	item_state = "cig_paper_pack"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/misc/lefthand_cigs_lighters.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/misc/righthand_cigs_lighters.dmi'

/obj/item/storage/fancy/rollingpapers/update_icon(updates)
	. = ..()
	if(!contents.len)
		icon_state = "cig_paper_pack_empty"

	if(!fancy_open)
		icon_state = "cig_paper_pack_closed"
	else
		icon_state = "cig_paper_pack"	
