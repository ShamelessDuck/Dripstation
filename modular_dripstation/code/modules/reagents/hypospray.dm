/obj/item/hypospray
	icon = 'modular_dripstation/icons/obj/syringe.dmi'

/obj/item/hypospray/combat/nt
	desc = "A highly advanced hypospray that uses bluespace tech to instantly inject people with reagents."
	icon_state = "hypo_nt_combat"
	possible_transfer_amounts = list(1, 5, 10)

/obj/item/hypospray/qmc
	possible_transfer_amounts = list(1, 5)
	inject_wait = 1 SECONDS
	inject_self = 0.5 SECONDS
	spray_wait = 1.5 SECONDS
	spray_self = 0.5 SECONDS

/obj/item/hypospray/syringe
	icon = 'icons/obj/syringe.dmi'