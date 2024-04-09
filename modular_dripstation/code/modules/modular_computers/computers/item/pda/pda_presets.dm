/obj/item/modular_computer/tablet/pda/preset/chem
	finish_color = "chem"

/obj/item/modular_computer/tablet/pda/preset/medical
	finish_color = "med"

/obj/item/modular_computer/tablet/pda/preset/paramed
	finish_color = "paramed"

/obj/item/modular_computer/tablet/pda/preset/phys
	finish_color = "phys"

/obj/item/modular_computer/tablet/pda/preset/phys/Initialize()
	starting_files |= list(
		new /datum/computer_file/program/crew_monitor,
		new /datum/computer_file/program/radar/lifeline
	)	
	. = ..()

/obj/item/modular_computer/tablet/pda/preset/engineering
	finish_color = "engi"

/obj/item/modular_computer/tablet/pda/preset/warden
	finish_color = "warden"

/obj/item/modular_computer/tablet/pda/preset/robo
	finish_color = "robo"

/obj/item/modular_computer/tablet/pda/preset/cargo
	finish_color = "car"

/obj/item/modular_computer/tablet/pda/preset/basic/atmos
	finish_color = "atmos"

/obj/item/modular_computer/tablet/pda/preset/basic/mime
	finish_color = "mime"

/obj/item/modular_computer/tablet/pda/preset/basic/fountainpen/bartender
	finish_color = "bar"	

/obj/item/modular_computer/tablet/pda/preset/basic/fountainpen/library
	finish_color = "libb"

/obj/item/modular_computer/tablet/pda/preset/basic/fountainpen/law
	finish_color = "law"

/obj/item/modular_computer/tablet/pda/preset/basic/sec 
	finish_color = "sec"

/obj/item/modular_computer/tablet/pda/preset/basic/det 
	finish_color = "det"

/obj/item/modular_computer/tablet/pda/preset/basic/cook
	finish_color = "chef"

/obj/item/modular_computer/tablet/pda/preset/basic/chap
	finish_color = "chap"

/obj/item/modular_computer/tablet/pda/preset/basic/botany
	finish_color = "bot"

/obj/item/modular_computer/tablet/pda/preset/basic/gen
	finish_color = "gen"

/obj/item/modular_computer/tablet/pda/preset/basic/jan
	finish_color = "jani"

/obj/item/modular_computer/tablet/pda/preset/basic/sci
	finish_color = "sci"

/obj/item/modular_computer/tablet/pda/preset/basic/mine
	finish_color = "mine"

/obj/item/modular_computer/tablet/pda/preset/basic/viro
	finish_color = "viro"

/obj/item/modular_computer/tablet/pda/preset/basic/clown
	finish_color = "clown"

/obj/item/modular_computer/tablet/pda/preset/basic/psych
	finish_color = "psych"

/obj/item/modular_computer/tablet/pda/preset/basic/psych
	finish_color = "psych"

/obj/item/modular_computer/tablet/pda/preset/basic/network
	finish_color = "network"

/obj/item/modular_computer/tablet/pda/preset/paramed/miningmed
	finish_color = "miningmed"
