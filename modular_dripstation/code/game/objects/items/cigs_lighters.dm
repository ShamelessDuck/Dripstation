/obj/item/rollingpaper
	icon = 'modular_dripstation/icons/obj/cigarettes.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/misc/lefthand_cigs_lighters.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/misc/righthand_cigs_lighters.dmi'

/obj/item/match
	icon = 'modular_dripstation/icons/obj/cigarettes.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/misc/lefthand_cigs_lighters.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/misc/righthand_cigs_lighters.dmi'
	light_range = 1.4
	light_power = 1
	light_color = LIGHT_COLOR_FIRE
	light_system = MOVABLE_LIGHT
	light_on = FALSE

/obj/item/clothing/mask/cigarette
	icon = 'modular_dripstation/icons/obj/cigarettes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/cigs.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/misc/lefthand_cigs_lighters.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/misc/righthand_cigs_lighters.dmi'
	light_range = 1
	light_power = 0.5
	light_color = LIGHT_COLOR_FIRE
	light_system = MOVABLE_LIGHT
	light_on = FALSE

/obj/item/cigbutt
	icon = 'modular_dripstation/icons/obj/cigarettes.dmi'
	item_state = "rollbutt"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/misc/lefthand_cigs_lighters.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/misc/righthand_cigs_lighters.dmi'

/obj/item/cigbutt/cigarbutt/cohiba
	icon_state = "cigar2butt"

/obj/item/cigbutt/cigarbutt/havana
	icon_state = "cigar3butt"

/obj/item/clothing/mask/cigarette/cigar/cohiba
	type_butt = /obj/item/cigbutt/cigarbutt/cohiba

/obj/item/clothing/mask/cigarette/cigar/havana
	icon_state = "cigar3off"
	icon_on = "cigar3on"
	icon_off = "cigar3off"
	type_butt = /obj/item/cigbutt/cigarbutt/havana

/obj/item/storage/box/matches
	icon = 'modular_dripstation/icons/obj/cigarettes.dmi'
	item_state = "matchbox"
	base_icon_state = "matchbox"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/misc/lefthand_cigs_lighters.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/misc/righthand_cigs_lighters.dmi'

/obj/item/storage/box/matches/update_icon_state()
	. = ..()
	switch(length(contents))
		if(7)
			icon_state = base_icon_state
		if(4 to 6)
			icon_state = "[base_icon_state]_almostfull"
		if(1 to 3)
			icon_state = "[base_icon_state]_almostempty"
		if(0)
			icon_state = "[base_icon_state]_e"

/obj/item/storage/box/matches/attackby(obj/item/match/W as obj, mob/user as mob, params)
	if(istype(W, /obj/item/match) && !W.lit)
		if(prob(25))
			user.visible_message("<b>[user]</b> manages to light \the [W] by striking it on \the [src].")
			W.matchignite()
		else
			playsound(src, 'modular_dripstation/sound/item/cigs_lighters/matchstick_hit.ogg', 25, 0, -1)
	W.update_appearance()

/////////
//ZIPPO//
/////////

/obj/item/lighter
	icon_state = "zippo_plain"
	item_state = "zippo_plain"
	var/base_state = "zippo_plain"
	light_power = 0.8
	icon = 'modular_dripstation/icons/obj/cigarettes.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/misc/lefthand_cigs_lighters.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/misc/righthand_cigs_lighters.dmi'	

/obj/item/lighter/Initialize(mapload)
	. = ..()
	update_appearance(UPDATE_ICON)

/obj/item/lighter/update_icon(updates)
	. = ..()
	if(lit)
		icon_state = "[base_state]-on"
		item_state = "[base_state]-on"
	else
		icon_state = "[base_state]"
		item_state = "[base_state]"

/obj/item/lighter/greyscale
	icon_state = "lighter-g"

/obj/item/lighter/greyscale/Initialize(mapload)
	. = ..()
	icon_state = "lighter-[pick("r","c","y","g")]"
	item_state = icon_state
	base_state = icon_state
	update_appearance(UPDATE_ICON)


/obj/item/lighter/cap
	name = "Captain's zippo"
	desc = "A limited edition gold Zippo espesially for NT Captains. Looks extremely expensive."
	icon_state = "zippo_cap"
	item_state = "zippo_cap"
	base_state = "zippo_cap"
	light_color = LIGHT_COLOR_DARK_BLUE

/obj/item/lighter/ce
	name = "Chief Engineer zippo"
	desc = "A limited edition Zippo for NT Heads. Somebody've tried to repair cover with blue tape."
	icon_state = "zippo_ce"
	item_state = "zippo_ce"
	base_state = "zippo_ce"

/obj/item/lighter/hos
	name = "Head of Security zippo"
	desc = "A limited edition Zippo for NT Heads. Fuel it with clown's tears."
	icon_state = "zippo_hos"
	item_state = "zippo_hos"
	base_state = "zippo_hos"
	light_color = CIRCUIT_COLOR_SECURITY

/obj/item/lighter/cmo
	name = "Chief Medical Officer zippo"
	desc = "A limited edition Zippo for NT Heads. Made of hypoallergenic steel."
	icon_state = "zippo_cmo"
	item_state = "zippo_cmo"
	base_state = "zippo_cmo"

/obj/item/lighter/hop
	name = "Head of personnel zippo"
	desc = "A limited edition Zippo for NT Heads. Tries it best to look like captain's."
	icon_state = "zippo_hop"
	item_state = "zippo_hop"
	base_state = "zippo_hop"
	light_color = COLOR_PRIDE_BLUE

/obj/item/lighter/rd
	name = "Research Director zippo"
	desc = "A limited edition Zippo for NT Heads. Uses advanced tech to make fire from plasma and acid compounds."
	icon_state = "zippo_rd"
	item_state = "zippo_rd"
	base_state = "zippo_rd"
	light_power = 0.6
	light_color = LIGHT_COLOR_ELECTRIC_GREEN

/obj/item/lighter/nt
	name = "Gold engraved zippo"
	desc = "An engraved golden Zippo lighter with the letters NT on it."
	icon_state = "zippo_nt"
	item_state = "zippo_nt"
	base_state = "zippo_nt"
	light_color = LIGHT_COLOR_DARK_BLUE

/obj/item/lighter/blue
	name = "Blue zippo lighter"
	desc = "A special NT zippo lighter made of some blue metal."
	icon_state = "zippo_blue"
	item_state = "zippo_blue"
	base_state = "zippo_blue"
	light_color = LIGHT_COLOR_DARK_BLUE

/obj/item/lighter/chap
	name = "Black zippo lighter"
	desc = "Special zippo made to light your way from evil darkness"
	icon_state = "zippo_chap"
	item_state = "zippo_chap"
	base_state = "zippo_chap"

/obj/item/lighter/contr
	name = "Contractor zippo lighter"
	desc = "An unique black and gold zippo commonly carried by elite Syndicate agents."
	icon_state = "zippo_contr"
	item_state = "zippo_contr"
	base_state = "zippo_contr"

/obj/item/lighter/engraved
	name = "Engraved zippo lighter"
	desc = "A intricately engraved zippo lighter."
	icon_state = "zippo_engraved"
	item_state = "zippo_engraved"
	base_state = "zippo_engraved"

/obj/item/lighter/qm
	name = "Quartermaster zippo"
	desc = "Modified zippo that uses plasma dust instead of usual fuel, has custom hand made goliath hide cover."
	icon_state = "zippo_qm"
	item_state = "zippo_qm"
	base_state = "zippo_qm"
	light_color = LIGHT_COLOR_PINK

/obj/item/lighter/gold
	icon_state = "zippo_gold"
	item_state = "zippo_gold"
	base_state = "zippo_gold"
	light_color = COLOR_ASSEMBLY_LBLUE
