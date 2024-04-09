/obj/item/card/id/departmental_budget
	icon = 'modular_dripstation/icons/obj/card.dmi'
	icon_state = "budgetcard"

/obj/item/card/id/departmental_budget/car
	icon_state = "car_budget"

/obj/item/card/id/departmental_budget/sec
	icon_state = "sec_budget"

/obj/item/card/emag
	icon = 'modular_dripstation/icons/obj/card.dmi'
	icon_state = "emag"

/obj/item/card/emag/improvised
	icon_state = "emag_shitty"

/obj/item/card/cmag
	icon = 'modular_dripstation/icons/obj/card.dmi'
	icon_state = "cmag"

/obj/item/card/id/syndicate/nuke
	name = "operative card"
	registered_name = "operative"
	assignment = "Nuclear Squad"
	originalassignment = "Nuclear Squad"
	registered_age = null
	forged = TRUE
	anyone = TRUE
	registered_age = null
	icon_state = "syndie"

/obj/item/card/id/syndicate/nuke_leader
	name = "squad leader card"
	registered_name = "leader"
	assignment = "Nuclear Squad"
	originalassignment = "Nuclear Squad"
	registered_age = null
	forged = TRUE
	anyone = TRUE
	access = list(ACCESS_MAINT_TUNNELS, ACCESS_SYNDICATE, ACCESS_SYNDICATE_LEADER)
	registered_age = null
	icon_state = "syndie_com"

/obj/item/card/id/syndicate_command
	icon_state = "commander"


/obj/item/card/id
	icon = 'modular_dripstation/icons/obj/card.dmi'

/obj/item/card/id/ID_fluff()
	var/job = originalassignment
	var/static/list/idfluff = list(
		"Assistant" = list("civillian","green"),
		"Captain" = list("captain","gold"),
		"Head of Personnel" = list("civillian","silver"),
		"Head of Security" = list("HOS","HOS_id"),
		"Chief Engineer" = list("CE","CE_id"),
		"Research Director" = list("RD","RD_id"),
		"Chief Medical Officer" = list("CMO","CMO_id"),
		"Quartermaster" = list("QM","QM_id"),
		"Station Engineer" = list("engineering","yellow"),
		"Atmospheric Technician" = list("engineering","white"),
		"Network Admin" = list("engineering","green"),
		"Medical Doctor" = list("medical","blue"),
		"Geneticist" = list("medical","purple"),
		"Virologist" = list("medical","green"),
		"Chemist" = list("medical","brown"),
		"Paramedic" = list("medical","white"),
		"Psychiatrist" = list("medical","dark_brown"),
		"Scientist" = list("science","purple"),
		"Roboticist" = list("science","black"),
		"Cargo Technician" = list("cargo","dark_brown"),
		"Shaft Miner" = list("cargo","black"),
		"Mining Medic" = list("cargo","blue"),
		"Bartender" = list("civillian","black"),
		"Botanist" = list("civillian","blue"),
		"Cook" = list("civillian","white"),
		"Janitor" = list("civillian","purple"),
		"Curator" = list("civillian","purple"),
		"Chaplain" = list("civillian","black"),
		"Clown" = list("clown","rainbow"),
		"Mime" = list("mime","white"),
		"Artist" = list("civillian","yellow"),
		"Clerk" = list("civillian","blue"),
		"Tourist" = list("civillian","yellow"),
		"Warden" = list("security","black"),
		"Security Officer" = list("security","red"),
		"Detective" = list("security","brown"),
		"Brig Physician" = list("security","blue"),
		"Lawyer" = list("security","purple"),
		"Blue Shield" = list("nanotrasen","nt_id"),
		"Magistrate" = list("nanotrasen","nt_id"),
		"NT Representative" = list("nanotrasen","nt_id"),
		"Explorer" = list("cargo","purple"),
		"Bridge Assistant" = list("captain","green"),
		"Brig Officer" = list("security","white"),
	)
	if(job in idfluff)
		has_fluff = TRUE
	else if(!job)
		return
	else
		if(has_fluff)
			return
		else
			job = "Assistant" //Loads up the basic green ID
	overlays.Cut()
	overlays += idfluff[job][1]
	overlays += idfluff[job][2]

/obj/item/card/id/nanotrasen
	icon_state = "nanotrasen"

/obj/item/card/id/head
	icon_state = "id_head"

/obj/item/card/id/mime
	icon_state = "id_mime"

/obj/item/card/id/deathsquad
	name = "\improper BlackOps ID"
	desc = "An ID straight from Nanotrasen SpecOps Division."
	icon_state = "deathsquad"
	registered_name = "BlackOps Operative"
	assignment = "Deathsquad Officer"
	originalassignment = "Deathsquad Officer"
	registered_age = null

/obj/item/card/id/deathsquad/gamma_force
	name = "\improper SpecOps ID"
	icon_state = "ERT_gamma"
	registered_name = "SpecOps Operative"
	assignment = "SpecOps Officer"
	originalassignment = "SpecOps Officer"

/obj/item/card/id/centcom/silver
	name = "\improper silver CentCom ID"
	desc = "A silver ID straight from Central Command."
	icon_state = "centcom_silver"

/obj/item/card/id/centcom/gold
	name = "\improper gold CentCom ID"
	desc = "A gold ID straight from Central Command."
	icon_state = "centcom_gold"

/obj/item/card/id/ert
	icon_state = "ERT_empty"

/obj/item/card/id/ert/amber
	icon_state = "ERT_amber"

/obj/item/card/id/ert/occupying
	icon_state = "ERT_occ"

/obj/item/card/id/ert/leader
	icon_state = "ERT_leader"

/obj/item/card/id/ert/Security
	icon_state = "ERT_security"

/obj/item/card/id/ert/Engineer
	icon_state = "ERT_engineering"

/obj/item/card/id/ert/Medical
	icon_state = "ERT_medical"

/obj/item/card/id/ert/chaplain
	icon_state = "ERT_chaplain"

/obj/item/card/id/ert/Janitor
	icon_state = "ERT_janitorial"

/obj/item/card/id/ert/clown
	icon_state = "ERT_clown"
