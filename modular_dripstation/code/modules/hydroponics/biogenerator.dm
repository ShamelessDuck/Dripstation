/obj/machinery/biogenerator
	icon = 'modular_dripstation/icons/obj/machines/biogenerator.dmi'
	icon_state = "biogenerator"
	var/max_visual_biomass = 5000

/obj/machinery/biogenerator/update_appearance()
	. = ..()

	var/power = stat & (NOPOWER|BROKEN) ? 0 : 1 + min(points / max_visual_biomass, 1) + (processing & 1)
	set_light(MINIMUM_USEFUL_LIGHT_RANGE, power, LIGHT_COLOR_CYAN)

/obj/machinery/biogenerator/update_overlays()
	. = ..()

	if(panel_open)
		. += mutable_appearance(icon, "[icon_state]_o_panel")

	if(beaker)
		. += mutable_appearance(icon, "[icon_state]_o_container")

	if(points > 0)
		// Get current biomass volume adjusted with sine function (more biomass = less frequent icon changes)
		var/biomass_volume_sin = sin(min(points/max_visual_biomass, 1) * 90)
		// Round up to get the corresponding overlay icon
		var/biomass_level = ROUND_UP(biomass_volume_sin * 7)
		. += mutable_appearance(icon, "[icon_state]_o_biomass_[biomass_level]")
		. += emissive_appearance(icon, "[icon_state]_o_biomass_[biomass_level]", src)

	if(stat & (NOPOWER|BROKEN))
		return

	if(processing)
		. += mutable_appearance(icon, "[icon_state]_o_process")
		. += emissive_appearance(icon, "[icon_state]_o_process", src)

	. += mutable_appearance(icon, "[icon_state]_o_screen")
	. += emissive_appearance(icon, "[icon_state]_o_screen", src)
