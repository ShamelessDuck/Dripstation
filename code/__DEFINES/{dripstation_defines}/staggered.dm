#define adjust_staggered(duration) adjust_timed_status_effect(duration, /datum/status_effect/staggered)
#define adjust_staggered_up_to(duration, up_to) adjust_timed_status_effect(duration, /datum/status_effect/staggered, up_to)
#define set_staggered(duration) set_timed_status_effect(duration, /datum/status_effect/staggered)
#define set_staggered_if_lower(duration) set_timed_status_effect(duration, /datum/status_effect/staggered, TRUE)
#define STAGGERED_SLOWDOWN_LENGTH 30
#define STAGGERED_SLOWDOWN_STRENGTH 0.85
#define MOVESPEED_ID_STAGGERED                        "STAGGERED"