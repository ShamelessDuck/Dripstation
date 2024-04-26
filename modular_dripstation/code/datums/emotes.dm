/datum/emote
	/// Emote flags (EMOTE_AUDIBLE and EMOTE_ANIMATED)
	var/emote_type = 0

	// Animated emote stuff
	// ~~~~~~~~~~~~~~~~~~~

	/// Animated emotes - Time to flick the overlay for in ticks, use SECONDS defines please.
	var/emote_length
	/// Animated emotes - pixel_x offset
	var/overlay_x_offset = 0
	/// Animated emotes - pixel_y offset
	var/overlay_y_offset = 0
	/// Animated emotes - Icon file for the overlay
	var/icon/overlay_icon = 'modular_dripstation/icons/effects/overlay_effects.dmi'
	/// Animated emotes - Icon state for the overlay
	var/overlay_icon_state
	/// If animated emote has directions
	var/directional
	/// Animated emote layer
	var/emote_layer = ABOVE_MOB_LAYER
