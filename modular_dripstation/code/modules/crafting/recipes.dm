/datum/crafting_recipe/ashtray
	name = "Plastic ashtray"
	result = /obj/item/ashtray
	time = 2 SECONDS
	reqs = list (
		/obj/item/stack/sheet/plastic = 3
	)
	tool_paths = list(/obj/item/weldingtool)
	category = CAT_STRUCTURES

/datum/crafting_recipe/ashtray_brown
	name = "Brown iron ashtray"
	result = /obj/item/ashtray/bronze
	time = 2 SECONDS
	reqs = list (
		/obj/item/stack/sheet/metal = 3
	)
	tool_paths = list(/obj/item/weldingtool)
	category = CAT_STRUCTURES

/datum/crafting_recipe/ashtray_glass
	name = "Glass ashtray"
	result = /obj/item/ashtray/bronze
	time = 2 SECONDS
	reqs = list (
		/obj/item/ashtray/glass = 3
	)
	tool_paths = list(/obj/item/weldingtool)
	category = CAT_STRUCTURES

/datum/crafting_recipe/ashtray_black
	name = "Black iron ashtray"
	result = /obj/item/ashtray/black
	time = 2 SECONDS
	reqs = list (
		/obj/item/stack/sheet/metal = 3
	)
	tool_paths = list(/obj/item/weldingtool)
	category = CAT_STRUCTURES

/datum/crafting_recipe/ashtray_black_small
	name = "Small black iron ashtray"
	result = /obj/item/ashtray/black
	time = 2 SECONDS
	reqs = list (
		/obj/item/stack/sheet/metal = 2
	)
	tool_paths = list(/obj/item/weldingtool)
	category = CAT_STRUCTURES
