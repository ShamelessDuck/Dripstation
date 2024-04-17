/obj/item/reagent_containers/glass
	pickup_sound = 'modular_dripstation/sound/pickup/bottle.ogg'
	drop_sound = 'modular_dripstation/sound/drop/bottle.ogg'
	disp_icon = "disp_beaker"
	var/has_lid = TRUE
	var/lid_state = FALSE
	var/lid_image
	var/can_be_labeled = TRUE
	var/label_image
	var/label_state = FALSE
	var/label_text = ""

/obj/item/reagent_containers/glass/Initialize()
	. = ..()
	if(lid_state == TRUE)
		DISABLE_BITFIELD(reagents.flags, OPENCONTAINER)
		ENABLE_BITFIELD(reagents.flags, OPENCONTAINER_NOSPILL)
	update_appearance(UPDATE_OVERLAYS)

/obj/item/reagent_containers/glass/attackby(obj/item/I, mob/user, params)
	var/hotness = I.is_hot()
	if(hotness && reagents)
		reagents.expose_temperature(hotness)
		to_chat(user, span_notice("You heat [name] with [I]!"))

	if(istype(I, /obj/item/reagent_containers/food/snacks/egg)) //breaking eggs
		var/obj/item/reagent_containers/food/snacks/egg/E = I
		if(reagents)
			if(reagents.total_volume >= reagents.maximum_volume)
				to_chat(user, span_notice("[src] is full."))
			else
				to_chat(user, span_notice("You break [E] in [src]."))
				E.reagents.trans_to(src, E.reagents.total_volume, transfered_by = user)
				qdel(E)
			return
	if(istype(I, /obj/item/pen)) // making labels
		if(can_be_labeled == FALSE)
			return
		if(!user.is_literate())
			to_chat(user, span_notice("You scribble illegibly on the label of [src]!"))
			return
		var/tmp_label = sanitize(input(user, "Enter a label for [name]", "Label", label_text), MAX_NAME_LEN)
		if(length(tmp_label) > 15)
			to_chat(user, span_notice("The label can be at most 15 characters long."))
		if(!user.canUseTopic(src, BE_CLOSE))
			return
		else
			to_chat(user, span_notice("You set the label to \"[tmp_label]\"."))
			label_text = tmp_label
			label_state = TRUE
			update_name_label()
			update_appearance(UPDATE_OVERLAYS)
	..()

/obj/item/reagent_containers/glass/proc/update_name_label(var/base_name = initial(name))
	if(label_text == "")
		name = base_name
		label_state = FALSE
		playsound(src.loc, 'sound/items/poster_ripped.ogg', 50, 1)
	else
		name = "[base_name] ([label_text])"
		playsound (src.loc, pick("writing_sounds"), 30, TRUE)

/obj/item/reagent_containers/glass/examine()
	. = ..()
	if(has_lid)
		if(lid_state == TRUE)
			. += span_notice("An airtight lid seals it completely.")
		else
			. += span_notice("You can put a lid on it.")

	if(label_text == "" && can_be_labeled)
		. += span_notice("Use a pen to put a label on it.")

	. += span_notice("Alt-click to change transfer amount.")

/obj/item/reagent_containers/glass/update_overlays()
	. = ..()
	if(lid_state == TRUE)
		if(lid_image)
			. += mutable_appearance(icon, lid_image, layer = OBJ_LAYER)
		else
			. += mutable_appearance(icon, "lid_[icon_state]", layer = OBJ_LAYER)

	if(label_state == TRUE)
		if(label_image)
			. += mutable_appearance(icon, label_image, layer = OBJ_LAYER)
		else
			. += mutable_appearance(icon, "label_[icon_state]", layer = OBJ_LAYER)

/obj/item/reagent_containers/glass/attack_self()
	if(lid_state == FALSE && has_lid)
		to_chat(usr, span_notice("You put the lid on \the [src]."))
		DISABLE_BITFIELD(reagents.flags, OPENCONTAINER)
		ENABLE_BITFIELD(reagents.flags, OPENCONTAINER_NOSPILL)
		lid_state = TRUE
	else
		to_chat(usr, span_notice("You take the lid off \the [src]."))
		DISABLE_BITFIELD(reagents.flags, OPENCONTAINER_NOSPILL)
		ENABLE_BITFIELD(reagents.flags, OPENCONTAINER)
		lid_state = FALSE
	update_appearance(UPDATE_OVERLAYS)

/obj/item/reagent_containers/glass/verb/set_APTFT() //set amount_per_transfer_from_this
	set name = "Set transfer amount"
	set category = "Object"
	set src in range(0)
	var/N = input("Amount per transfer from this:","[src]") as null|anything in possible_transfer_amounts
	amount_per_transfer_from_this = N
	if(N)
		balloon_or_message(usr, "Transferring [amount_per_transfer_from_this]u")

/obj/item/reagent_containers/glass/AltClick(var/mob/user)
	set_APTFT()

/obj/item/reagent_containers/glass/beaker
	icon = 'modular_dripstation/icons/obj/chemical.dmi'
	drop_sound = 'sound/items/handling/drinkglass_drop.ogg'
	pickup_sound =  'sound/items/handling/drinkglass_pickup.ogg'

/obj/item/reagent_containers/glass/beaker/plastic
	item_state = "beakerwhite"
	disp_icon = "disp_whitebeaker"
	lid_image = "lid_beakerlarge"
	label_image = "label_beakerlarge"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/equipment/chemistry_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/equipment/chemistry_righthand.dmi'

/obj/item/reagent_containers/glass/beaker/meta
	disp_icon = "disp_goldbeaker"
	item_state = "beakergold"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/equipment/chemistry_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/equipment/chemistry_righthand.dmi'

/obj/item/reagent_containers/glass/beaker/noreact
	disp_icon = "disp_noreactbeaker"
	item_state = "beaker_noreact"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/equipment/chemistry_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/equipment/chemistry_righthand.dmi'

/obj/item/reagent_containers/glass/beaker/bluespace
	item_state = "beaker_bluespace"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/equipment/chemistry_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/equipment/chemistry_righthand.dmi'	
	disp_icon = "disp_bluespace_beaker"

/obj/item/reagent_containers/glass/beaker/cryoxadone
	lid_state = TRUE

/obj/item/reagent_containers/glass/beaker/sulphuric
	lid_state = TRUE

/obj/item/reagent_containers/glass/beaker/slime
	lid_state = TRUE

/obj/item/reagent_containers/glass/beaker/large/silver_sulfadiazine
	lid_state = TRUE
	label_state = TRUE

/obj/item/reagent_containers/glass/beaker/large/charcoal
	lid_state = TRUE
	label_state = TRUE	

/obj/item/reagent_containers/glass/beaker/large/epinephrine
	lid_state = TRUE
	label_state = TRUE

/obj/item/reagent_containers/glass/beaker/synthflesh
	lid_state = TRUE

/obj/item/reagent_containers/glass/beaker/large/lemoline
	lid_state = TRUE
	label_state = TRUE

/obj/item/reagent_containers/glass/beaker/large/styptic
	lid_state = TRUE
	label_state = TRUE

/obj/item/reagent_containers/glass/bucket
	icon = 'modular_dripstation/icons/obj/janitor.dmi'
	disp_icon = "disp_bucket"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/equipment/chemistry_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/equipment/chemistry_righthand.dmi'
	drop_sound = 'modular_dripstation/sound/drop/helm.ogg'
	pickup_sound = 'modular_dripstation/sound/pickup/helm.ogg'
	can_be_labeled = FALSE

/obj/item/reagent_containers/glass/bucket/update_overlays()
	. = ..()
	if(reagents.total_volume > 0)
		. += "water_[initial(icon_state)]"
	if(lid_state == TRUE)
		. += "lid_[initial(icon_state)]"

/obj/item/reagent_containers/glass/bucket/on_reagent_change()
	. = ..()
	update_appearance(UPDATE_OVERLAYS)

/obj/item/reagent_containers/glass/bucket/wooden
	disp_icon = "disp_wbucket"
	drop_sound = 'modular_dripstation/sound/drop/wooden.ogg'
	pickup_sound = 'modular_dripstation/sound/pickup/wooden.ogg'

/obj/item/reagent_containers/glass/beaker/waterbottle
	disp_icon = "disp_bottle"

/obj/item/reagent_containers/glass/urn
	pickup_sound = 'modular_dripstation/sound/pickup/bottle.ogg'
	drop_sound = 'modular_dripstation/sound/drop/bottle.ogg'

/obj/item/reagent_containers/glass/coffee_cup
	has_lid = FALSE
	can_be_labeled = FALSE

/obj/item/pestle
	icon = 'modular_dripstation/icons/obj/chemical.dmi'

/obj/item/reagent_containers/glass/mortar
	has_lid = FALSE
	can_be_labeled = FALSE
	icon = 'modular_dripstation/icons/obj/chemical.dmi'

/obj/item/reagent_containers/glass/gromitmug
	has_lid = FALSE
	can_be_labeled = FALSE

/obj/item/reagent_containers/glass/woodmug
	has_lid = FALSE
	can_be_labeled = FALSE
	drop_sound = 'modular_dripstation/sound/drop/wooden.ogg'
	pickup_sound = 'modular_dripstation/sound/pickup/wooden.ogg'

/obj/item/reagent_containers/glass/mixbowl
	has_lid = FALSE
	can_be_labeled = FALSE

/obj/item/reagent_containers/glass/bowl
	has_lid = FALSE
	can_be_labeled = FALSE

/obj/item/reagent_containers/glass/beaker/jar
	reagent_flags = OPENCONTAINER_NOSPILL
	has_lid = FALSE
	can_be_labeled = FALSE

/obj/item/reagent_containers/glass/urn
	has_lid = FALSE
	can_be_labeled = FALSE
