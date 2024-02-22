/datum/mood_event/focused
	mood_change = 10	//Used for syndies, nukeops etc so they can focus on their goals

/datum/mood_event/slaughter
	description ="<span class='alertsyndie'>These pitiful NanoTrasen scam will have to drink vacuum sooner or later. Slaughter... THEM... ALL!!</span>\n"
	mood_change = 15

/datum/mood_event/heretics
	mood_change = 8

/datum/mood_event/cult
	mood_change = 15	//maybe being a cultist isnt that bad after all

/datum/mood_event/drankblood
	mood_change = 8

/datum/mood_event/sacrifice_geometer
	description ="<span class='cult italic'>The Great Geometer of Blood is pleased with this offering!</span>\n"
	mood_change = 5
	timeout = 3 MINUTES

/datum/mood_event/sacrifice_heretic
	description ="<span class='nicegreen'>Your patrons are pleased with this offering!</span>\n"
	mood_change = 5
	timeout = 3 MINUTES

/datum/mood_event/jolly_moderate
	description = "<span class='nicegreen'>That was a really funny joke that my inner self told me!</span>\n"
	mood_change = 9
	timeout = 2 MINUTES