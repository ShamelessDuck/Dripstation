/// The subsystem used to tick digital clocks //tg port
PROCESSING_SUBSYSTEM_DEF(digital_clock)
	name = "Digital Clocks"
	flags = SS_NO_INIT|SS_BACKGROUND|SS_KEEP_TIMING
	wait = 1 SECONDS
