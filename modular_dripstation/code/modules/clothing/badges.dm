/obj/item/badge/security
	icon = 'modular_dripstation/icons/obj/clothing/accessories.dmi'
	icon_state = "silverbadge"
	item_state = ""
	accessory_state = "silverbadge"
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/accessories.dmi'
	var/can_be_adjusted = FALSE
	var/cord_state = FALSE

/obj/item/badge/security/cadet
	name = "security holobadge (Cadet)"
	icon_state = "holobadge"
	accessory_state = "holobadge"
	can_be_adjusted = TRUE

/obj/item/badge/security/officer1
	name = "security holobadge (Junior Officer)"
	icon_state = "holobadge"
	accessory_state = "holobadge"
	can_be_adjusted = TRUE

/obj/item/badge/security/officer2
	name = "security holobadge (Officer)"
	icon_state = "holobadge"
	accessory_state = "holobadge"
	can_be_adjusted = TRUE

/obj/item/badge/security/officer3
	name = "security holobadge (Senior Officer)"
	icon_state = "holobadge"
	accessory_state = "holobadge"
	can_be_adjusted = TRUE

/obj/item/badge/security/warden1
	name = "security silver badge (Sergeant)"
	icon_state = "silverbadge"
	accessory_state = "silverbadge"
	can_be_adjusted = TRUE

/obj/item/badge/security/warden2
	name = "security silver badge (Staff Sergeant)"
	icon_state = "silverbadge"
	accessory_state = "silverbadge"
	can_be_adjusted = TRUE

/obj/item/badge/security/warden3
	name = "security gold badge (2nd Lieutenant)"
	icon_state = "goldbadge"
	accessory_state = "goldbadge"
	can_be_adjusted = TRUE

/obj/item/badge/security/hos1
	name = "security gold badge (1st Lieutenant)"
	icon_state = "goldbadge"
	accessory_state = "goldbadge"
	can_be_adjusted = TRUE

/obj/item/badge/security/hos2
	name = "security gold badge (Brig Captain)"
	icon_state = "goldbadge"
	accessory_state = "goldbadge"
	can_be_adjusted = TRUE

/obj/item/badge/security/hos3
	name = "security gold badge (Major)"
	icon_state = "goldbadge"
	accessory_state = "goldbadge"
	can_be_adjusted = TRUE

/obj/item/badge/security/det1
	name = "security badge (Junior Investigator)"
	icon_state = "sherrif"
	accessory_state = "sherrif"

/obj/item/badge/security/det2
	name = "security badge (Investigator)"
	icon_state = "sherrif"
	accessory_state = "sherrif"

/obj/item/badge/security/det3
	name = "security badge (Chief Inspector)"
	icon_state = "sherrif"
	accessory_state = "sherrif"

/obj/item/badge/security/AltClick(mob/user)
	if(can_be_adjusted)
		if(!cord_state)
			icon_state = "[initial(icon_state)]-cord"
			accessory_state = "[initial(accessory_state)]-cord"
			cord_state = TRUE
		else
			icon_state = "[initial(icon_state)]"
			accessory_state = "[initial(accessory_state)]"
			cord_state = FALSE

/obj/item/badge/security/attack_self(mob/user)
	if(!owner_string)
		to_chat(user, "Waving around a badge without your name would be pretty pointless.")
		return
	if(isliving(user))
		user.visible_message("<span class='warning'>[user] displays [user.p_their()] Nanotrasen Security Legal Authorization Badge.\nIt reads: [owner_string], NT Security.</span>",
		"<span class='warning'>You display your Nanotrasen Security Legal Authorization Badge.\nIt reads: [owner_string], NT Security.</span>")

/obj/item/badge/security/attack(mob/living/carbon/human/H, mob/living/user)
	if(isliving(user))
		user.visible_message("<span class='warning'>[user] invades [H]'s personal space, thrusting [src] into [H.p_their()] face insistently.</span>",
		"<span class='warning'>You invade [H]'s personal space, thrusting [src] into [H.p_their()] face insistently. You are the law.</span>")

/obj/item/badge/security/cadet/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/card/id) || istype(I, /obj/item/pda))

		var/obj/item/card/id/id_card = null

		if(istype(I, /obj/item/card/id))
			id_card = I
		else
			var/obj/item/pda/pda = I
			id_card = pda.id

		if(ACCESS_BRIG in id_card.access)
			to_chat(user, "<span class='notice'>You imprint your ID details onto the badge.</span>")
			owner_string = id_card.registered_name
		else
			to_chat(user, "<span class='warning'>[src] rejects your insufficient access rights.</span>")
		return
	..()