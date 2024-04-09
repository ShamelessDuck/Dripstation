/datum/outfit/syndicate/full
	suit = /obj/item/clothing/suit/space/hardsuit/syndi/bloodred
	belt = /obj/item/storage/belt/military/webbing/syndicate/gorlex
	back = /obj/item/storage/backpack/syndie

/datum/antagonist/nukeop/lone/equip_op()
	if(!ishuman(owner.current))
		return
	var/mob/living/carbon/human/H = owner.current

	H.set_species(/datum/species/human) //Plasamen burn up otherwise, and lizards are vulnerable to asimov AIs

	H.equipOutfit(nukeop_outfit)
	var/obj/item/clothing/head/helmet/space/hardsuit/syndi/HE = H.get_item_by_slot(ITEM_SLOT_HEAD)
	if(istype(HE, /obj/item/clothing/head/helmet/space/hardsuit/syndi))
		HE.spaceready(H)
	return TRUE

/datum/outfit/nuclear_operative
	suit = /obj/item/clothing/suit/space/hardsuit/syndi/bloodred/preview
	head = /obj/item/clothing/head/helmet/space/hardsuit/syndi/bloodred/preview

/datum/outfit/nuclear_operative_elite
	suit = /obj/item/clothing/suit/space/hardsuit/syndi/elite/preview
	head = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/preview