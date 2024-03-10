/obj/machinery/computer
	icon = 'modular_dripstation/icons/obj/computer.dmi'
	light_system = STATIC_LIGHT
	light_range = 2
	light_power = 1

/obj/machinery/computer/prisoner
	light_color = LIGHT_COLOR_INTENSE_RED

/obj/machinery/computer/secure_data
	light_color = LIGHT_COLOR_INTENSE_RED

/obj/machinery/computer/security
	light_color = LIGHT_COLOR_INTENSE_RED

/obj/machinery/computer/gulag_teleporter_computer
	light_color = LIGHT_COLOR_INTENSE_RED

/obj/machinery/computer/warrant
	light_color = LIGHT_COLOR_INTENSE_RED

/obj/machinery/computer/telecomms
	light_color = LIGHT_COLOR_ELECTRIC_GREEN

/obj/machinery/computer/bank_machine
	light_color = LIGHT_COLOR_GREEN

/obj/machinery/computer/cryopod
	light_color = LIGHT_COLOR_ELECTRIC_GREEN

/obj/machinery/computer/apc_control
	light_color = COLOR_ENGINEERING_ORANGE

/obj/machinery/computer/security/wooden_tv
	light_color = COLOR_SILVER

/obj/machinery/computer/security/mining
	light_color = LIGHT_COLOR_PINK

/obj/machinery/computer/security/qm
	icon_screen = "cameras_civil"
	icon_keyboard = "power_key"
	light_color = COLOR_SILVER

/obj/machinery/computer/camera_advanced/syndie
	icon_screen = "syndicam"

/obj/machinery/computer/camera_advanced/abductor
	light_color = LIGHT_COLOR_PINK

/obj/machinery/computer/launchpad
	light_color = LIGHT_COLOR_BLUE

/obj/machinery/computer/pod
	light_color = LIGHT_COLOR_ELECTRIC_GREEN

/obj/machinery/computer/pod/old
	light_color = COLOR_SILVER

/obj/machinery/computer/mecha
	light_color = LIGHT_COLOR_PINK

/obj/machinery/computer/bounty
	light_color = COLOR_TANGERINE_YELLOW

/obj/machinery/computer/cargo
	light_color = COLOR_TANGERINE_YELLOW

/obj/machinery/computer/piratepad_control
	light_color = LIGHT_COLOR_ELECTRIC_GREEN

/obj/machinery/computer/bsa_control
	light_color = LIGHT_COLOR_CYAN

/obj/machinery/computer/sat_control
	light_color = LIGHT_COLOR_ELECTRIC_GREEN

/obj/machinery/computer/holodeck
	light_color = LIGHT_COLOR_CYAN

/obj/machinery/computer/monitor
	light_color = COLOR_ENGINEERING_ORANGE

/obj/machinery/computer/turbine_computer
	light_color = LIGHT_COLOR_CYAN

/obj/machinery/computer/reactor
	icon_state = "oldcomp_alt"
	icon_screen = "oldcomp_alt_broken"
	light_color = LIGHT_COLOR_DARK_BLUE

/obj/machinery/computer/rdservercontrol
	light_color = LIGHT_COLOR_PINK

/obj/machinery/computer/nanite_chamber_control 
	light_color = COLOR_BLUE_GRAY

/obj/machinery/computer/nanite_cloud_controller
	light_color = LIGHT_COLOR_GREEN

/obj/machinery/computer/emergency_shuttle
	light_color = LIGHT_COLOR_CYAN

/obj/machinery/computer/atmos_sim
	light_color = LIGHT_COLOR_CYAN

/obj/machinery/computer/cryopod
	icon = 'modular_dripstation/icons/obj/terminals.dmi'
	icon_state = "wallconsole"
	icon_screen = "wallconsole_cryo"

/obj/machinery/computer/shuttle/pod/update_overlays()
	. = ..()
	if(stat & (NOPOWER|BROKEN))
		return

	. += mutable_appearance(icon, icon_screen)
	. += emissive_appearance(icon, icon_screen, src)

/obj/machinery/computer/auxiliary_base
	icon = 'modular_dripstation/icons/obj/terminals.dmi'
	icon_state = "pod_off"
	icon_screen = "pod_on"
	light_color = LIGHT_COLOR_BLUE

/obj/machinery/computer/auxiliary_base/pod/update_overlays()
	. = ..()
	if(stat & (NOPOWER|BROKEN))
		return

	. += mutable_appearance(icon, icon_screen)
	. += emissive_appearance(icon, icon_screen, src)
