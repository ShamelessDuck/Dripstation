/obj/item/reagent_containers/glass/bottle
	icon = 'modular_dripstation/icons/obj/chemical.dmi'
	disp_icon = "disp_bottle"

/obj/item/reagent_containers/glass/bottle/update_overlays()
	. = ..()
	if(!filling_icon_state)
		filling_icon_state = icon_state
	if(!reagents.total_volume)
		return
	var/mutable_appearance/filling = mutable_appearance('modular_dripstation/icons/obj/reagentfillings.dmi', "[filling_icon_state]-10")

	var/percent = round((reagents.total_volume / volume) * 100)
	switch(percent)
		if(0 to 9)
			filling.icon_state = "[filling_icon_state]-10"
		if(10 to 19)
			filling.icon_state = "[filling_icon_state]20"
		if(20 to 39)
			filling.icon_state = "[filling_icon_state]40"
		if(40 to 59)
			filling.icon_state = "[filling_icon_state]60"
		if(60 to 79)
			filling.icon_state = "[filling_icon_state]80"			
		if(80 to INFINITY)
			filling.icon_state = "[filling_icon_state]100"

	filling.color = mix_color_from_reagents(reagents.reagent_list)
	. += filling

/obj/item/reagent_containers/glass/bottle/morphine
	icon = 'modular_dripstation/icons/obj/chemical.dmi'
	icon_state = "bottle-2"	
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/traitor
	icon = 'modular_dripstation/icons/obj/chemical.dmi'

/obj/item/reagent_containers/glass/bottle/epinephrine
	icon_state = "bottle-4"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/cyanide
	icon_state = "bottle-3"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/spewium
	icon_state = "bottle-5"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/chloralhydrate
	icon_state = "bottle-6"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/mannitol
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/charcoal
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/mutagen
	icon_state = "bottle-5"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/plasma
	icon_state = "bottle-5"	
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/synaptizine
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/formaldehyde
	icon_state = "bottle-3"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/ammonia
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/diethylamine
	icon_state = "bottle-2"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/facid
	icon_state = "bottle-5"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/capsaicin
	icon_state = "bottle-3"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/frostoil
	icon_state = "bottle-3"	
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/traitor
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/polonium
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/magillitis
	icon_state = "bottle-6"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/venom
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/fentanyl
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/initropidril
	icon_state = "bottle-3"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/pancuronium
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/sodium_thiopental
	icon_state = "bottle-4"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/coniine
	icon_state = "bottle-2"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/curare
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/amanitin
	icon_state = "bottle-5"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/histamine
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/diphenhydramine
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/potass_iodide
	icon_state = "bottle-2"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/radscrub
	icon_state = "bottle-2"	
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/salglu_solution
	icon_state = "bottle-4"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/atropine
	icon_state = "bottle-3"	
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/romerol
	icon_state = "bottle-3"	
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/tuberculosiscure
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/hydrogen
	icon_state = "bottle-3"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/lithium
	icon_state = "bottle-3"	
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/carbon
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/nitrogen
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/oxygen
	icon_state = "bottle-4"		
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/fluorine
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/sodium
	icon_state = "bottle-4"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/aluminium
	icon_state = "bottle-3"	
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/silicon
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/phosphorus
	icon_state = "bottle-5"	
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/sulphur
	icon_state = "bottle-5"
	label_state = TRUE
	lid_state = TRUE	

/obj/item/reagent_containers/glass/bottle/chlorine
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/potassium
	icon_state = "bottle-2"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/iron
	icon_state = "bottle-3"
	label_state = TRUE
	lid_state = TRUE	

/obj/item/reagent_containers/glass/bottle/copper
	icon_state = "bottle-3"	
	label_state = TRUE
	lid_state = TRUE	

/obj/item/reagent_containers/glass/bottle/mercury
	icon_state = "bottle-5"	
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/radium
	icon_state = "bottle-5"	
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/water
	label_state = TRUE
	lid_state = TRUE	

/obj/item/reagent_containers/glass/bottle/ethanol
	icon_state = "bottle-4"		
	label_state = TRUE
	lid_state = TRUE	

/obj/item/reagent_containers/glass/bottle/sugar
	label_state = TRUE
	lid_state = TRUE	

/obj/item/reagent_containers/glass/bottle/sacid
	icon_state = "bottle-5"	
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/toxin
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/welding_fuel
	label_state = TRUE
	lid_state = TRUE	

/obj/item/reagent_containers/glass/bottle/silver
	icon_state = "bottle-3"	
	label_state = TRUE
	lid_state = TRUE	

/obj/item/reagent_containers/glass/bottle/iodine
	label_state = TRUE
	lid_state = TRUE	

/obj/item/reagent_containers/glass/bottle/bromine
	label_state = TRUE
	lid_state = TRUE	


/obj/item/reagent_containers/glass/bottle/vial/random_virus
	label_state = TRUE
	lid_state = TRUE	

/obj/item/reagent_containers/glass/bottle/vial/cold
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/vial/flu_virion
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/clownstears
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/tumor
	icon_state = "bottle-3"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/retrovirus
	icon_state = "bottle-3"
	label_state = TRUE
	lid_state = TRUE

obj/item/reagent_containers/glass/bottle/gbs
	icon_state = "bottle-3"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/fake_gbs
	icon_state = "bottle-3"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/brainrot
	icon_state = "bottle-3"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/random_virus
	icon_state = "bottle-3"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/pierrot_throat
	icon_state = "bottle-3"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/cold
	icon_state = "bottle-3"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/flu_virion
	icon_state = "bottle-3"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/anxiety
	icon_state = "bottle-3"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/beesease
	icon_state = "bottle-3"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/wizarditis
	icon_state = "bottle-3"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/magnitis
	icon_state = "bottle-3"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/sleepy
	icon_state = "bottle-3"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/fluspanish
	icon_state = "bottle-3"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/jitters
	icon_state = "bottle-3"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/tuberculosis
	icon_state = "bottle-3"
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/necropolis_seed
	has_lid = FALSE
	can_be_labeled = FALSE

/obj/item/reagent_containers/glass/bottle/saltpetre
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/flash_powder
	label_state = TRUE
	lid_state = TRUE

/obj/item/reagent_containers/glass/bottle/caramel
	label_state = TRUE
	lid_state = TRUE

//############ VIALS ############

/obj/item/reagent_containers/glass/bottle/vial
	icon_state = "vial"
	base_icon_state = "vial"
	disp_icon = "disp_glass"
	label_image = "label_vial"
	lid_image = "lid_vial"
	reagent_flags = OPENCONTAINER
	unique_reskin = list(
		"vial" = "vial",
		"white vial" = "vial_white",
		"red vial" = "vial_red",
		"blue vial" = "vial_blue",
		"green vial" = "vial_green",
		"orange vial" = "vial_orange",
		"purple vial" = "vial_purple",
		"black vial" = "vial_black"
	)
	striped_vial_skins = list("vial_white", "vial_red", "vial_blue", "vial_green", "vial_orange", "vial_purple", "vial_black")

/obj/item/reagent_containers/glass/bottle/vial/libital
	icon_state = "vial_red"

/obj/item/reagent_containers/glass/bottle/vial/aiuri
	icon_state = "vial_orange"

/obj/item/reagent_containers/glass/bottle/vial/charcoal
	icon_state = "vial_green"

/obj/item/reagent_containers/glass/bottle/vial/perfluorodecalin
	icon_state = "vial_blue"

/obj/item/reagent_containers/glass/bottle/vial/epi
	icon_state = "vial_white"

/obj/item/reagent_containers/glass/bottle/vial/epi/full
	icon_state = "vial_white"

/obj/item/reagent_containers/glass/bottle/vial/styptic
	icon_state = "vial_orange"

/obj/item/reagent_containers/glass/bottle/vial/silver_sulfadiazine
	icon_state = "vial_red"

/obj/item/reagent_containers/glass/bottle/vial/sal_acid
	icon_state = "vial_white"

/obj/item/reagent_containers/glass/bottle/vial/oxandrolone
	icon_state = "vial_black"

/obj/item/reagent_containers/glass/bottle/vial/calomel
	icon_state = "vial_black"

/obj/item/reagent_containers/glass/bottle/vial/salbutamol
	icon_state = "vial_white"

/obj/item/reagent_containers/glass/bottle/vial/coagulant
	icon_state = "vial_red"

/obj/item/reagent_containers/glass/bottle/vial/lavaland
	icon_state = "vial_black"

/obj/item/reagent_containers/glass/bottle/vial/omnizine
	icon_state = "vial_white"

/obj/item/reagent_containers/glass/bottle/vial/brute
	icon_state = "vial_red"

/obj/item/reagent_containers/glass/bottle/vial/burn
	icon_state = "vial_orange"

/obj/item/reagent_containers/glass/bottle/vial/tox
	icon_state = "vial_green"

/obj/item/reagent_containers/glass/bottle/vial/oxy
	icon_state = "vial_blue"

/obj/item/reagent_containers/glass/bottle/vial/combat
	icon_state = "vial_black"

/obj/item/reagent_containers/glass/bottle/vial/stimulants
	icon_state = "vial_purple"

/obj/item/reagent_containers/glass/bottle/vial/morphine
	icon_state = "vial_blue"

/obj/item/reagent_containers/glass/bottle/vial/large
	icon_state = "viallarge"
	base_icon_state = "viallarge"
	label_image = "label_viallarge"
	lid_image = "lid_viallarge"
	volume = 40
	unique_reskin = list(
		"vial" = "viallarge",
		"white vial" = "viallarge_white",
		"red vial" = "viallarge_red",
		"blue vial" = "viallarge_blue",
		"green vial" = "viallarge_green",
		"orange vial" = "viallarge_orange",
		"purple vial" = "viallarge_purple",
		"black vial" = "viallarge_black"
	)
	striped_vial_skins = list("viallarge_white", "viallarge_red", "viallarge_blue", "viallarge_green", "viallarge_orange", "viallarge_purple", "viallarge_black")


/obj/item/reagent_containers/glass/bottle/vial/bluespace
	label_image = "label_vialbluespace"
	lid_image = "lid_vialbluespace"	
	unique_reskin = list("bluespace vial" = "vialbluespace",
						"white bluespace vial" = "vialbluespace_white",
						"red bluespace vial" = "vialbluespace_red",
						"blue bluespace vial" = "vialbluespace_blue",
						"green bluespace vial" = "vialbluespace_green",
						"orange bluespace vial" = "vialbluespace_orange",
						"purple bluespace vial" = "vialbluespace_purple"
						)

