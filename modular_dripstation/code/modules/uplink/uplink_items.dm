////////////Syndicate/////////////
/datum/uplink_item/suits/hardsuit
	name = "Blood-red RIG"
	desc = "The feared suit of a Syndicate nuclear operative. Features slightly better armoring and a built in jetpack \
			that runs off standard atmospheric tanks. Toggling the suit in and out of \
			combat mode will allow you all the mobility of a loose fitting uniform without sacrificing armoring. \
			Additionally the suit is collapsible, making it small enough to fit within a backpack. \
			Nanotrasen crew who spot these suits are known to panic."
	item = /obj/item/clothing/suit/space/hardsuit/syndi/bloodred
	cost = 8
	manufacturer = /datum/corporation/gorlex
	exclude_modes = list(/datum/game_mode/nuclear, /datum/game_mode/infiltration) //you can't buy it in nuke, because the elite hardsuit costs the same while being better // yogs: infiltration

/datum/uplink_item/suits/hardsuit/waffle
	name = "Waffle Co RIG"
	desc = "Not as famous as a standard blood-red Gorlex rig, this one provides some additional abilities. \
			Features some other sort of armoring and a built in magboots, that slightly faster than standard issued. \
			Toggling the suit in and out of	combat mode will allow you all the mobility of a loose fitting uniform \
			without sacrificing armoring. Additionally the suit is collapsible, making it small enough to fit within a backpack."
	manufacturer = /datum/corporation/traitor/waffleco
	item = /obj/item/clothing/suit/space/hardsuit/syndi/bloodred/waffle
	cost = 6
	exclude_modes = list()

/datum/uplink_item/suits/hardsuit/winter
	name = "White Gorlex RIG"
	desc = "Not as famous as a standard blood-red Gorlex rig, this one provides some additional abilities. \
			Features additional termoregulation in combat mode, allowing operate in extremely cold regions of outer space. \
			Toggling the suit in and out of	combat mode will allow you all the mobility of a loose fitting uniform \
			without sacrificing armoring. Additionally the suit is collapsible, making it small enough to fit within a backpack."
	manufacturer = /datum/corporation/gorlex
	item = /obj/item/clothing/suit/space/hardsuit/syndi/bloodred/winter
	cost = 9
	exclude_modes = list(/datum/game_mode/nuclear, /datum/game_mode/infiltration) //you can't buy it in nuke, because the elite hardsuit costs the same while being better // yogs: infiltration

/datum/uplink_item/role_restricted/hardsuit
	name = "GEC Blood-Red RIG"
	desc = "Hardsuit of Global Engineering Consortium, represented in Syndicate as a minor force. Freedom for Engineers!"
	item = /obj/item/clothing/suit/space/hardsuit/syndi/engineering/syndicate
	cost = 4
	restricted_roles = list("Station Engineer","Atmospheric Technician","Network Admin","Chief Engineer")

/datum/uplink_item/role_restricted/hardsuit/winter
	name = "White GEC RIG"
	desc = "Cold-proof hardsuit of Global Engineering Consortium, represented in Syndicate as a minor force. Unite the Engineers!"
	item = /obj/item/clothing/suit/space/hardsuit/syndi/engineering/syndicate/winter
	cost = 5

/datum/uplink_item/race_restricted/digirig
	name = "Degitagrade Blood-Red RIG"
	desc = "Recently Gorlex started to employ degitagrade specimen in their ranks. This suit constructed for this kind of agents within Syndicate."
	cost = 8
	manufacturer = /datum/corporation/gorlex
	item = /obj/item/clothing/suit/space/hardsuit/syndi/bloodred/unathi
	restricted_species = list("lizard", "draconid", "polysmorph")

/datum/uplink_item/race_restricted/humantofelinid
	name = "Felinid Mutation Toxin"
	desc = "Oh, so... You really want this?"
	cost = 2
	manufacturer = /datum/corporation/traitor/vahlen
	item = /obj/item/reagent_containers/syringe/felinid
	restricted_species = list("human")

/obj/item/reagent_containers/syringe/felinid
	name = "syringe (felinid)"
	desc = "Contains felinid mutation toxin."
	list_reagents = list(/datum/reagent/mutationtoxin/felinid = 15)

/datum/uplink_item/suits/hardsuit/elite
	name = "Elite Syndicate RIG"
	desc = "An upgraded, elite version of the Syndicate RIG. It features fireproofing, and also \
			provides the user with superior armor and mobility compared to the blood-red RIG."
	item = /obj/item/clothing/suit/space/hardsuit/syndi/elite
	cost = 8
	include_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)
	exclude_modes = list()

/datum/uplink_item/suits/hardsuit/shielded
	name = "Shield RIG module"
	desc = "Simple module that features energy shielding system. \
			The shield can handle only one impact within a short duration \
			but will rapidly recharge while not under fire."
	item = /obj/item/module/shield/syndicate
	cost = 12
	include_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)
	exclude_modes = list()

/datum/uplink_item/device_tools/tacklers
	name = "Combat Tackler Gloves"
	desc = "Combat gloves, that are good at performing tackle takedowns as well as absorbing electrical shocks."
	item = /obj/item/clothing/gloves/tackler/combat
	cost = 2

/datum/uplink_item/device_tools/tacklers/waffle
	name = "Waffle Tackler Gloves"
	desc = "Faimous rocket gloves, allows user to accelerate and reach high speed in seconds."
	item = /obj/item/clothing/gloves/tackler/combat/waffle
	cost = 3

/datum/uplink_item/device_tools/tactical_gloves
	exclude_modes = list(/datum/game_mode/nuclear) //you can't buy it in nuke, because they have another pair that costs the same while being better

/datum/uplink_item/device_tools/tactical_gloves/combat
	include_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)
	exclude_modes = list()
	item = /obj/item/clothing/gloves/fingerless/bigboss/combat

/datum/uplink_item/infiltration/access_kit
	cost = 4

/datum/uplink_item/infiltration/gloves
	name = "Tackler Chameleon Gloves"
	desc = "An infiltration tackler gloves, capable of changing it's appearance instantly. Will be helpfull in cases when you need to run."
	item = /obj/item/clothing/gloves/tackler/combat/infiltrator/chameleon
	cost = 2





///////NT///////////
/datum/uplink_item/nt/hardsuit/standard
	name = "ERT RIG"
	desc = "Trully NT Marine."
	item = /obj/item/clothing/suit/space/hardsuit/syndi/military/ert
	cost = 5

/datum/uplink_item/nt/hardsuit/cmd
	name = "ERT Commander RIG"
	desc = "Show them who's boss."
	item = /obj/item/clothing/suit/space/hardsuit/syndi/military/ert/com
	cost = 5
	restricted_roles = list("Emergency Response Commander")

/datum/uplink_item/nt/hardsuit/sec
	name = "ERT Security RIG"
	desc = "Make them fear the long arm of law."
	item = /obj/item/clothing/suit/space/hardsuit/syndi/military/ert/sec
	cost = 5
	required_ert_uplink = NT_ERT_TROOPER

/datum/uplink_item/nt/hardsuit/engi
	name = "ERT Engineering RIG"
	desc = "HOW DID YOU DELAMINATE THE SM 5 MINUTES IN?"
	item = /obj/item/clothing/suit/space/hardsuit/syndi/military/ert/engi
	cost = 5
	required_ert_uplink = NT_ERT_ENGINEER

/datum/uplink_item/nt/hardsuit/med
	name = "ERT Medical RIG"
	desc = "Dying is illegal."
	item = /obj/item/clothing/suit/space/hardsuit/syndi/military/ert/med
	cost = 5
	required_ert_uplink = NT_ERT_MEDIC

/datum/uplink_item/nt/hardsuit/ds
	name = "SWAT MKV Deathsquad"
	desc = "A prototype rig. Black ops here."
	item = /obj/item/clothing/suit/space/hardsuit/syndi/military/ert/deathsquad
	cost = 80
	cant_discount = TRUE

/datum/uplink_item/nt/hardsuit/ds
	name = "SWAT MKV Deathsquad"
	desc = "A prototype hardsuit. Fully bulletproof and incredibly robust."
	item = /obj/item/clothing/suit/space/hardsuit/deathsquad/mk5
	cost = 100
	cant_discount = TRUE

/datum/uplink_item/nt/hardsuit/dsshield
	name = "BlackOps shield module"
	desc = "A prototype RIG module that provides energy shielding protection. \
			Slowly recharges, but incredibly robust."
	item = /obj/item/module/shield/nt
	cost = 30
	cant_discount = TRUE