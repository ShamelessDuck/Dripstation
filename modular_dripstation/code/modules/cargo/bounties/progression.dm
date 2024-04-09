/datum/bounty/item/progression/mining_advanced/reward_string()
	return "[reward] Credits and clearance to order high quality plasmacutters"

/datum/bounty/item/progression/drakeslayer
	name = "Hardsuit Initiatives"
	description = "Strange dragon-like fauna detected in the area. Provide us a few examples of scaly material from this creatures and we`ll pay in reward."
	reward = 20000
	required_count = 10
	wanted_types = list(/obj/item/stack/sheet/animalhide/ashdrake, /obj/item/stack/sheet/animalhide/carpdragon) //let`s get down some lizards
	unlocked_crates = list(/datum/supply_pack/clearance/heavymining)

/datum/bounty/item/progression/drakeslayer/reward_string()
	return "[reward] Credits and clearance to order high quality mining gear."

/datum/bounty/item/progression/hos
	name = "Head of Security Armoring"
	description = "On Space Station 12 detected lack of HoS equipment. Send us Head of Security`s armoring pieces and we will provide limited heavy armor for him instead."
	reward = 1000
	required_count = 4
	wanted_types = list(/obj/item/clothing/suit/toggle/capformal/hos, /obj/item/clothing/suit/armor/vest/hosjacket, /obj/item/clothing/suit/armor/hos, /obj/item/clothing/suit/armor/hos/trenchcoat, /obj/item/clothing/suit/hooded/wintercoat/security/hos, /obj/item/clothing/head/HoS/beret, /obj/item/clothing/head/HoS, /obj/item/clothing/head/HoS/dictator)
	unlocked_crates = list(/datum/supply_pack/security/armory/hos)

/datum/bounty/item/progression/hos/reward_string()
	return "[reward] Credits and clearance to order high quality armor set."