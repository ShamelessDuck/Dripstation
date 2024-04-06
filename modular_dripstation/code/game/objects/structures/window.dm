GLOBAL_LIST_INIT(wcBrig, COLOR_SECURITY_RED)
// GLOBAL_LIST_INIT(wcSci, COLOR_SCIENCE_PINK)
// GLOBAL_LIST_INIT(wcMed, COLOR_MEDICAL_BLUE)
GLOBAL_LIST_INIT(wcEng, COLOR_ENGINEERING_ORANGE)
GLOBAL_LIST_INIT(wcCar, COLOR_CARGO_GLASS)
// GLOBAL_LIST_INIT(wcCom, COLOR_COMMAND_BLUE)

/obj/proc/color_windows(obj/W)
	var/list/wcBrigAreas = list(/area/security, /area/crew_quarters/heads/hos, /area/ai_monitored/security/armory)
	// var/list/wcSciAreas = list(/area/science, /area/crew_quarters/heads/hor)
	// var/list/wcMedAreas = list(/area/medical, /area/crew_quarters/heads/cmo)
	var/list/wcEngAreas = list(/area/engine, /area/crew_quarters/heads/chief)
	var/list/wcCarAreas = list(/area/quartermaster)
	// var/list/wcComAreas = list(/area/bridge, /area/crew_quarters/heads/hop, /area/crew_quarters/heads/captain, /area/teleporter)


	var/newcolor
	var/turf/T = get_turf(W)
	if(!istype(T))
		return
	var/area/A = T.loc

	if(is_type_in_list(A,wcBrigAreas))
		newcolor = GLOB.wcBrig
	// else if(is_type_in_list(A,wcSciAreas))
	// 	newcolor = GLOB.wcSci
	// else if(is_type_in_list(A,wcMedAreas))
	// 	newcolor = GLOB.wcMed
	else if(is_type_in_list(A,wcEngAreas))
		newcolor = GLOB.wcEng
	else if(is_type_in_list(A,wcCarAreas))
		newcolor = GLOB.wcCar
	// else if(is_type_in_list(A,wcComAreas))
	// 	newcolor = GLOB.wcCom
	else
		newcolor = null

	return newcolor

/obj/structure/window/Initialize(mapload, direct)
	. = ..()
	if(!color && cancolor)
		color = color_windows(src)

/obj/structure/window
	var/cancolor = FALSE

/obj/structure/window/reinforced
	cancolor = TRUE

/obj/structure/window/reinforced/bronze
	cancolor = FALSE

/obj/structure/window/reinforced/tinted
	cancolor = FALSE

/obj/structure/window/fulltile
	cancolor = TRUE

/obj/structure/window/reinforced/clockwork
	cancolor = FALSE

/obj/structure/window/paperframe
	cancolor = FALSE

/obj/structure/window/reinforced/fulltile/polarized
	name = "electrochromic window"
	desc = "Adjusts its tint with voltage. Might take a few good hits to shatter it."
	var/tint_id
	var/original_color
	var/isused

/obj/structure/window/reinforced/fulltile/polarized/proc/toggle()
	if(!isused)
		isused++
		original_color = color
	if(opacity)
		animate(src, color="[original_color]", time=5)
		set_opacity(0)
	else
		animate(src, color="#222222", time=5)
		set_opacity(1)
