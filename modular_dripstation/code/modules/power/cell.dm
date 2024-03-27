/obj/item/stock_parts/cell
	icon = 'modular_dripstation/icons/obj/power.dmi'
	var/indicator_icon = "standard"
	var/last_overlay_state = null // Used to optimize calls.

/obj/item/stock_parts/cell/Initialize(mapload, override_maxcharge)
	. = ..()
	update_appearance(UPDATE_OVERLAYS)

/obj/item/stock_parts/cell/update_overlays()
	. = ..()
	if(grown_battery)
		cut_overlays()
		. += image('icons/obj/power.dmi',"grown_wires")
	var/ratio = clamp(round(charge / maxcharge, 0.25) * 100, 0, 100)
	var/new_state = "[indicator_icon]_[ratio]"
	if(new_state != last_overlay_state)
		cut_overlay(last_overlay_state)
		add_overlay(new_state)
		last_overlay_state = new_state

