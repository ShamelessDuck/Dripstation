/obj/machinery/computer/gulag_teleporter_computer
	var/emergency_access = list(ACCESS_SECURITY)
	var/default_access = list(ACCESS_ARMORY)
	req_access = null

/obj/machinery/computer/gulag_teleporter_computer/ui_act(action, list/params, mob/user)
	/// If there is a warden or HoS, we can delegate them to be able to use machinery
	/// If not, let the officers do it
	req_one_access = emergency_access
	for(var/datum/data/record/gen_record in GLOB.data_core.general)
		if(gen_record.fields["real_rank"] == "Head of Security" || gen_record.fields["real_rank"] == "Warden")
			req_access = default_access
			break
	. = ..()