// ###### HOP ######
/obj/item/clothing/under/rank/head_of_personnel
	icon = 'modular_dripstation/icons/obj/clothing/uniform/command/hop.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/command/hop.dmi'
	alt_covers_chest = TRUE

/obj/item/clothing/under/rank/head_of_personnel/skirt
	can_adjust = TRUE
	mutantrace_variation = MUTANTRACE_VARIATION	
	fitted = NO_FEMALE_UNIFORM
	alt_covers_chest = FALSE

/obj/item/clothing/under/rank/head_of_personnel/dress
	name = "head of personnel's dress"
	icon_state = "hop_dress"
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP	
	body_parts_covered = CHEST|GROIN|ARMS	
	mutantrace_variation = NO_MUTANTRACE_VARIATION	

/obj/item/clothing/under/rank/head_of_personnel/paradefancy
	name = "head of personnel's fancy uniform"
	desc = "For these special occasions when paperwork can wait."
	icon_state = "hopwhimsy"
	item_state = "hopwhimsy"
	can_adjust = FALSE
	mutantrace_variation = NO_MUTANTRACE_VARIATION	

/obj/item/clothing/under/rank/head_of_personnel/parade
	name = "head of personnel's parade uniform"
	desc = "A luxurious uniform for the head of personnel, woven in a deep blue. On the lapel is a small pin in the shape of a corgi's head."
	icon_state = "hop_parade_male"
	can_adjust = FALSE

/obj/item/clothing/under/rank/head_of_personnel/parade/skirt
	name = "head of personnel's parade skirt"
	icon_state = "hop_parade_female"	
	body_parts_covered = CHEST|GROIN|ARMS
	fitted = FEMALE_UNIFORM_TOP

/obj/item/clothing/under/rank/head_of_personnel/turtleneck
	name = "head of personnel's turtleneck"
	desc = "A dark teal turtleneck and black khakis, for a second with a superior sense of style."
	icon_state = "hopturtle"
	can_adjust = TRUE
	alt_covers_chest = TRUE

/obj/item/clothing/under/rank/head_of_personnel/turtleneck/alt
	icon_state = "hopturtle_alt"

/obj/item/clothing/under/rank/head_of_personnel/skirt/turtleneck
	name = "head of personnel's turtleneck skirt"
	desc = "A dark teal turtleneck and tanblack khaki skirt, for a second with a superior sense of style."
	icon_state = "hopturtle_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	fitted = NO_FEMALE_UNIFORM

/obj/item/clothing/under/rank/head_of_personnel/skirt/secretary
	name = "head of personnel's secretary skirt"
	icon_state = "hop_secretary"
	fitted = NO_FEMALE_UNIFORM
	alt_covers_chest = FALSE

/obj/item/clothing/shoes/leather
	name = "leather shoes"
	desc = "A sturdy pair of fancy handmade leather shoes."
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'	
	icon_state = "leather"

/obj/item/clothing/head/hooded/winterhood/hop/formal
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	icon_state = "winterhood_hopformal"

/obj/item/clothing/suit/hooded/wintercoat/hop/formal
	name = "head of personnel's formal winter coat"
	desc = "A long cozy winter coat, covered in thick fur. The breast features a proud yellow chevron, reminding everyone that you're the second banana. Someone at CC most really like you, huh?"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	icon_state = "coathopformal"
	hoodtype = /obj/item/clothing/head/hooded/winterhood/hop/formal

/obj/item/clothing/head/beret/hop
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	icon_state = "beret_hop"

/obj/item/clothing/head/hopcap
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	icon_state = "hopcap"

/obj/item/clothing/head/hopcap/alt
	icon_state = "hopcap_alt"

/obj/item/clothing/suit/armor/vest/alt
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'	

/obj/item/clothing/glasses/hud/personnel
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/glasses_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/glasses_righthand.dmi'	
	icon_state = "sunhudskill"
	item_state = "sunhudskill"

// ###### CAPTAIN ######
/obj/item/clothing/under/rank/captain
	icon = 'modular_dripstation/icons/obj/clothing/uniform/command/captain.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/command/captain.dmi'
	alt_covers_chest = FALSE

/obj/item/clothing/under/rank/captain/skirt
	can_adjust = TRUE
	alt_covers_chest = TRUE
	fitted = NO_FEMALE_UNIFORM

/obj/item/clothing/under/rank/captain/formal
	name = "captain's formal uniform"
	desc = "Parade version of station captain`s uniform."
	icon_state = "station_captain"
	item_state = "station_captain"
	alt_covers_chest = TRUE

/obj/item/clothing/under/rank/captain/formal/skirt
	name = "captain's formal skirt"
	desc = "Parade version of station captain`s skirt."
	icon_state = "station_captain_skirt"
	item_state = "station_captain_skirt"
	mutantrace_variation = NO_MUTANTRACE_VARIATION	
	fitted = NO_FEMALE_UNIFORM

/obj/item/clothing/under/yogs/victoriouscaptainuniform 
	can_adjust = FALSE

/obj/item/clothing/under/rank/captain/kilt
	desc = "Not a skirt, it is, however, armoured and decorated with a tartan sash."
	name = "captain's kilt"
	icon_state = "capkilt"
	item_state = "kilt"
	alt_covers_chest = TRUE

/obj/item/clothing/under/rank/captain/dress
	name = "captain's dress"
	icon_state = "cap_secretary"
	can_adjust = FALSE
	fitted = NO_FEMALE_UNIFORM
	body_parts_covered = CHEST|GROIN|ARMS	
	mutantrace_variation = NO_MUTANTRACE_VARIATION	

/obj/item/clothing/under/captainparade
	icon = 'modular_dripstation/icons/obj/clothing/uniform/command/captain.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/command/captain.dmi'

/obj/item/clothing/suit/armor/vest/capcarapace
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	item_state = "capcarapace"	

/obj/item/clothing/suit/armor/vest/capcarapace/alt
	name = "captain's bulletproof carapace"
	desc = "A fireproof armored chestpiece reinforced with modern plasceramic plates to provide maximum bullet protection whilst still offering maximum mobility and flexibility. Issued only to the station's finest, although it does chafe your nipples."
	icon_state = "capcarapace_bulletproof"
	body_parts_covered = CHEST|GROIN
	armor = list(MELEE = 30, BULLET = 60, LASER = 30, ENERGY = 10, BOMB = 30, BIO = 0, RAD = 0, FIRE = 100, ACID = 90, WOUND = 15)
	dog_fashion = null
	resistance_flags = FIRE_PROOF

/obj/item/clothing/suit/hooded/wintercoat/captain
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'

/obj/item/clothing/suit/hooded/wintercoat/captain/alt
	icon_state = "coatalt_cap"
	hoodtype = /obj/item/clothing/head/hooded/winterhood/captain/alt

/obj/item/clothing/head/hooded/winterhood/captain
	icon_state = "winterhoodalt_cap"
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'	

/obj/item/clothing/head/hooded/winterhood/captain/alt
	icon_state = "winterhoodalt_cap"

/obj/item/clothing/suit/captunic
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	name = "captain's parade tunic"
	desc = "Worn by a Captain to show their class."
	icon_state = "captunic"
	flags_inv = null

/obj/item/clothing/suit/armor/vest/capcarapace/jacket
	name = "captain's jacket"
	icon_state = "capjacket"
	body_parts_covered = CHEST|ARMS

/obj/item/clothing/shoes/laceup
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'

/obj/item/clothing/shoes/laceup/brown
	name = "brown laceup shoes"
	icon_state = "oxford_brown"
	item_state = "oxford_brown"
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/shoes_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/shoes_righthand.dmi'	

/obj/item/clothing/shoes/laceup/grey
	name = "grey laceup shoes"
	icon_state = "oxford_grey"
	item_state = "oxford_grey"
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/shoes_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/shoes_righthand.dmi'	

/obj/item/clothing/shoes/laceup/cap
	name = "command laceup shoes"
	icon_state = "cap_laceups"
	item_state = "cap_laceups"
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/shoes_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/shoes_righthand.dmi'	

/obj/item/clothing/gloves/color/captain
	icon = 'modular_dripstation/icons/obj/clothing/gloves.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hands.dmi'

/obj/item/clothing/head/caphat
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'	

/obj/item/clothing/head/caphat/parade
	icon = 'icons/obj/clothing/hats/hats.dmi'
	mob_overlay_icon = 'icons/mob/clothing/head/head.dmi'

/obj/item/clothing/head/beret/captain
	name = "captain's formal beret"
	desc = "If you wanna feel yourself a beet younger."
	icon_state = "capberet"
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'	

/obj/item/clothing/head/beret/captain/white
	name = "captain's black beret"
	icon_state = "capberet_black"

/obj/item/clothing/head/beret/captain/black
	name = "captain's white beret"
	icon_state = "capberet_white"

/obj/item/clothing/head/bearpelt
	name = "spare bear pelt"
	desc = "It shimmers in the light"
	icon_state = "sparebearpelt"
	icon = 'icons/obj/clothing/hats/hats.dmi'
	mob_overlay_icon = 'icons/mob/clothing/head/head.dmi'	

/obj/item/clothing/mask/gas/captain
	name = "captain's gas mask"
	desc = "Nanotrasen cut corners and repainted a spare gas mask, but don't tell anyone."
	icon_state = "gas_cap"
	icon = 'modular_dripstation/icons/obj/clothing/masks.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/masks.dmi'
	armor = list(MELEE = 5, BULLET = 5, LASER = 5, ENERGY = 5, BOMB = 0, BIO = 50, FIRE = 20, ACID = 10)
	resistance_flags = FIRE_PROOF | ACID_PROOF

/////////NT Rep
/obj/item/clothing/under/rank/centcom_officer/ntrep
	desc = "Gold trim on space-black cloth, this uniform displays the rank of \"Magistrate\" and bears station name on the left shoulder."
	name = "\improper Formal Nanotrasen Representative's Uniform"
	icon = 'modular_dripstation/icons/obj/clothing/uniform/command/captain.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/command/captain.dmi'

/obj/item/clothing/under/rank/centcom_officer/ntrep/Initialize()
	. = ..()
	desc = "Gold trim on space-black cloth, this uniform bears [station_name()] on the left shoulder."

/////////Magistrate
/obj/item/clothing/under/rank/centcom_officer/magistrate
	desc = "Gold trim on space-black cloth, this uniform displays the rank of \"Magistrate\" and bears station name on the left shoulder."
	name = "\improper Formal Magistrate's Uniform"
	icon = 'modular_dripstation/icons/obj/clothing/uniform/command/captain.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/command/captain.dmi'

/obj/item/clothing/under/rank/centcom_officer/magistrate/Initialize()
	. = ..()
	desc = "Gold trim on space-black cloth, this uniform displays the rank of \"Magistrate\" and bears [station_name()] on the left shoulder."

////////Blue Shield////////
/obj/item/clothing/suit/armor/vest/blueshield
	name = "blueshield security armor"
	desc = "An armored vest with the badge of a Blueshield Lieutenant."
	icon_state = "armor_bs"

/obj/item/clothing/suit/armor/bulletproof/blueshield
	name = "blueshield bulletproof armor"
	desc = "An armored bulletproof vest with the badge of a Blueshield Lieutenant."
	icon_state = "bulletproof_bs"

/obj/item/clothing/suit/storage/blueshield
	name = "blueshield coat"
	desc = "NT deluxe ripoff. You finally have your own coat."
	icon_state = "blueshieldcoat"
	item_state = "blueshieldcoat"
	blood_overlay_type = "coat"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	allowed = list(/obj/item/gun/energy,/obj/item/reagent_containers/spray/pepper,/obj/item/gun,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/melee/baton,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/melee/classic_baton/telescopic)
	armor = list(MELEE = 25, BULLET = 10, LASER = 25, ENERGY = 10, BOMB = 0, BIO = 20, RAD = 0, FIRE = 20, ACID = 45, WOUND = 10)
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS

/obj/item/clothing/under/rank/centcom_officer/centcom_shield/blueshield
	name = "blueshield's uniform"
	desc = "A short-sleeved black uniform, paired with grey digital-camo cargo pants, all made out of a sturdy material. Blueshield standard issue."
	icon_state = "blueshield"
	icon = 'modular_dripstation/icons/obj/clothing/uniform/command/blueshield.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/command/blueshield.dmi'

/obj/item/clothing/under/rank/centcom_officer/centcom_shield/blueshield/skirt
	name = "blueshield's skirt"
	desc = "A short, black and grey with blue markings skirted uniform. For the feminine Blueshield."
	icon_state = "blueshield_skirt"

/obj/item/clothing/under/rank/centcom_officer/centcom_shield/blueshield
	name = "blueshield's jumpsuit"
	desc = "A short-sleeved grey jumpsuit, paired with grey digital-camo cargo pants, all made out of a sturdy material. Blueshield ERT-style."
	icon_state = "shield_urban"

/obj/item/clothing/under/rank/centcom_officer/centcom_shield/blueshield
	name = "blueshield's turtle"
	desc = "A short-sleeved grey turtle, paired with grey digital-camo cargo pants, all made out of a sturdy material. Blueshield tactical-style."
	icon_state = "blueshield_turtle_grey"

/obj/item/clothing/under/rank/centcom_officer/centcom_shield/blueshield
	name = "blueshield's skirtle"
	desc = "A short, black and grey with blue markings skirted tactical skirtle. For the feminine Blueshield."
	icon_state = "blueshield_turtle_grey_skirt"

/obj/item/clothing/head/beret/blueshield
	name = "blueshield bulletproof armor"
	desc = "An armored bulletproof vest with the badge of a Blueshield Lieutenant."
	icon_state = "bulletproof_bs"

////////Formal coat////////
/obj/item/clothing/suit/toggle/capformal
	name = "captain's formal coat"
	desc = "For when an armoured vest isn't fashionable enough."
	icon_state = "capformal"
	item_state = "capcarapace"	
	blood_overlay_type = "coat"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	togglename = "buttons"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	cold_protection = CHEST|GROIN|ARMS|HANDS
	heat_protection = CHEST|GROIN|ARMS|HANDS
	armor = list(MELEE = 40, BULLET = 35, LASER = 40, ENERGY = 25, BOMB = 25, BIO = 0, RAD = 0, FIRE = 100, ACID = 90, WOUND = 15)
	resistance_flags = FIRE_PROOF
	mutantrace_variation = MUTANTRACE_VARIATION	

/obj/item/clothing/suit/toggle/capformal/Initialize(mapload)
	. = ..()
	if(!allowed)
		allowed = GLOB.security_vest_allowed

/obj/item/clothing/suit/toggle/capformal/hos
	name = "armored formal coat"
	icon_state = "hos_formal"
	mutantrace_variation = NO_MUTANTRACE_VARIATION	
	desc = "A formal coat enhanced with a special alloy for some extra protection and style for those with a commanding presence."
	armor = list(MELEE = 30, BULLET = 30, LASER = 30, ENERGY = 25, BOMB = 25, BIO = 0, RAD = 0, FIRE = 70, ACID = 90, WOUND = 20)
	strip_delay = 80
	clothing_flags = THICKMATERIAL

/obj/item/clothing/suit/toggle/capformal/hop
	name = "head of personal's formal coat"
	icon_state = "hopformal"
	mutantrace_variation = NO_MUTANTRACE_VARIATION
	desc = "A luxurious deep blue jacket for the Head of Personnel, woven with a red trim. It smells of bureaucracy."
	armor = list(MELEE = 15, BULLET = 15, LASER = 15, ENERGY = 25, BOMB = 15, BIO = 0, RAD = 0, FIRE = 40, ACID = 35, WOUND = 10)
	allowed = list(
		/obj/item/melee/classic_baton,
	)

/obj/item/clothing/suit/toggle/capformal/centcom
	name = "\improper CentCom formal coat"
	desc = "A CentCom green alteration of the captain's formal coat. Issued only to Nanotrasen's finest!"
	icon_state = "centcom_formal"
	mutantrace_variation = NO_MUTANTRACE_VARIATION
	strip_delay = 80
	clothing_flags = THICKMATERIAL
	blocks_shove_knockdown = TRUE

/obj/item/clothing/suit/toggle/capformal/centcom/alt
	icon_state = "centcom_formalalt"
	mutantrace_variation = NO_MUTANTRACE_VARIATION	

/obj/item/clothing/suit/toggle/capformal/centcom/soo
	name = "special operations officer`s coat"
	desc = "Highly protective armor with bluespace enhanced plaskevlar plating stylized as a leather coat. Has special operations officer insignia attached to it."
	icon_state = "soo_coat"
	item_state = "detective"
	armor = list(MELEE = 60, BULLET = 60, LASER = 60, ENERGY = 50, BOMB = 100, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 35)
	slowdown = -0.2
	mutantrace_variation = NO_MUTANTRACE_VARIATION	