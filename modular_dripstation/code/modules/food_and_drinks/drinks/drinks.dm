/obj/item/reagent_containers/food/drinks/flask
	disp_icon = "disp_flask"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/food/drinks_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/food/drinks_righthand.dmi'

/obj/item/reagent_containers/food/drinks/flask/gold
	disp_icon = "disp_capflask"	

/obj/item/reagent_containers/food/drinks/flask/det
	disp_icon = "disp_detflask"

/obj/item/reagent_containers/food/drinks/flask/barflask
	icon = 'modular_dripstation/icons/obj/drinks.dmi'
	name = "flask"
	desc = "For those who can't be bothered to hang out at the bar to drink."
	icon_state = "barflask"
	disp_icon = "disp_barflask"

/obj/item/reagent_containers/food/drinks/soda_cans
	disp_icon = "disp_soda"

/obj/item/reagent_containers/food/drinks/shaker
	lefthand_file = 'modular_dripstation/icons/mob/inhands/food/drinks_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/food/drinks_righthand.dmi'
	disp_icon = "disp_shaker"
	drop_sound = 'modular_dripstation/sound/drop/axe.ogg'
	pickup_sound = 'modular_dripstation/sound/pickup/axe.ogg'

/obj/item/reagent_containers/food/drinks/shaker/bluespace
	name = "\improper bluespace shaker"
	desc = "A bluespace shaker to mix drinks in, can fit enough hooch to kill a goliath."
	icon_state = "bluespaceshaker"
	icon = 'modular_dripstation/icons/obj/drinks.dmi'
	materials = list(/datum/material/glass = 5000, /datum/material/plasma = 3000, /datum/material/diamond = 1000, /datum/material/bluespace = 1000)
	amount_per_transfer_from_this = 10
	volume = 300
	possible_transfer_amounts = list(5,10,15,20,25,30,50,100,300)
