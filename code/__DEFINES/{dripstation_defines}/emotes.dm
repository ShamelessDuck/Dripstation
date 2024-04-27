// Sounds used by species for emotes

//Order is
//1.laugh
//2.giggle
//3.scream
//4.gasp
//5.cough
//6.sigh
//7.sneeze
//8.sniff
//9.cry
//10.moan
//11.yawn

//################ HUMAN(DEFAUL) ################

#define SPECIES_DEFAULT_LAUGH_SOUND(user) user.gender == FEMALE ? pick(\
		'modular_dripstation/sound/emotes/human/female/laugh_female_1.ogg',\
		'modular_dripstation/sound/emotes/human/female/laugh_female_2.ogg',\
		'modular_dripstation/sound/emotes/human/female/laugh_female_3.ogg') : pick(\
		'modular_dripstation/sound/emotes/human/male/laugh_male_1.ogg',\
		'modular_dripstation/sound/emotes/human/male/laugh_male_2.ogg',\
		'modular_dripstation/sound/emotes/human/male/laugh_male_3.ogg')

#define SPECIES_DEFAULT_GIGGLE_SOUND(user) user.gender == FEMALE ? pick(\
		'modular_dripstation/sound/emotes/human/female/giggle_female_1.ogg',\
		'modular_dripstation/sound/emotes/human/female/giggle_female_2.ogg',\
		'modular_dripstation/sound/emotes/human/female/giggle_female_3.ogg',\
		'modular_dripstation/sound/emotes/human/female/giggle_female_4.ogg') : pick(\
		'modular_dripstation/sound/emotes/human/male/giggle_male_1.ogg',\
		'modular_dripstation/sound/emotes/human/male/giggle_male_2.ogg')

#define SPECIES_DEFAULT_SCREAM_SOUND(user) user.gender == FEMALE ? pick(\
		'sound/voice/human/femalescream_1.ogg',\
		'sound/voice/human/femalescream_5.ogg') : pick(\
		'sound/voice/human/malescream_2.ogg',\
		'sound/voice/human/malescream_3.ogg',\
		'sound/voice/human/malescream_4.ogg',\
		'sound/voice/human/malescream_5.ogg')

#define SPECIES_DEFAULT_GASP_SOUND(user) user.gender == FEMALE ? pick(\
		'modular_dripstation/sound/emotes/human/female/gasp_female1.ogg',\
		'modular_dripstation/sound/emotes/human/female/gasp_female2.ogg',\
		'modular_dripstation/sound/emotes/human/female/gasp_female3.ogg',\
		'modular_dripstation/sound/emotes/human/female/gasp_female4.ogg',\
		'modular_dripstation/sound/emotes/human/female/gasp_female5.ogg',\
		'modular_dripstation/sound/emotes/human/female/gasp_female6.ogg',\
		'modular_dripstation/sound/emotes/human/female/gasp_female7.ogg') : pick(\
		'modular_dripstation/sound/emotes/human/male/gasp_male1.ogg',\
		'modular_dripstation/sound/emotes/human/male/gasp_male2.ogg',\
		'modular_dripstation/sound/emotes/human/male/gasp_male3.ogg',\
		'modular_dripstation/sound/emotes/human/male/gasp_male4.ogg',\
		'modular_dripstation/sound/emotes/human/male/gasp_male5.ogg',\
		'modular_dripstation/sound/emotes/human/male/gasp_male6.ogg',\
		'modular_dripstation/sound/emotes/human/male/gasp_male7.ogg',\
		'modular_dripstation/sound/emotes/human/male/gasp_male8.ogg',\
		'modular_dripstation/sound/emotes/human/male/gasp_male9.ogg',\
		'modular_dripstation/sound/emotes/human/male/gasp_male10.ogg')

#define SPECIES_DEFAULT_COUGH_SOUND(user) user.gender == FEMALE ? pick(\
		'modular_dripstation/sound/emotes/human/female/female_cough_1.ogg',\
		'modular_dripstation/sound/emotes/human/female/female_cough_2.ogg') : pick(\
		'modular_dripstation/sound/emotes/human/male/male_cough_1.ogg',\
		'modular_dripstation/sound/emotes/human/male/male_cough_2.ogg',\
		'modular_dripstation/sound/emotes/human/male/male_cough_3.ogg',\
		'modular_dripstation/sound/emotes/human/male/male_cough_4.ogg')

#define SPECIES_DEFAULT_SIGH_SOUND(user) user.gender == FEMALE ? 'modular_dripstation/sound/emotes/human/female/sigh_female.ogg' : 'modular_dripstation/sound/emotes/human/male/sigh_male.ogg'

#define SPECIES_DEFAULT_SNEEZE_SOUND(user) user.gender == FEMALE ? 'modular_dripstation/sound/emotes/human/female/female_sneeze.ogg' : pick('modular_dripstation/sound/emotes/human/male/male_sneeze_1.ogg', 'modular_dripstation/sound/emotes/human/male/male_sneeze_2.ogg')

#define SPECIES_DEFAULT_SNIFF_SOUND(user) user.gender == FEMALE ? 'modular_dripstation/sound/emotes/human/female/female_sniff.ogg' : 'modular_dripstation/sound/emotes/human/male/male_sniff.ogg'

#define SPECIES_DEFAULT_CRY_SOUND(user) user.gender == FEMALE ? pick(\
		'modular_dripstation/sound/emotes/human/female/cry_female_1.ogg',\
		'modular_dripstation/sound/emotes/human/female/cry_female_2.ogg',\
		'modular_dripstation/sound/emotes/human/female/cry_female_3.ogg') : pick(\
		'modular_dripstation/sound/emotes/human/male/cry_male_1.ogg',\
		'modular_dripstation/sound/emotes/human/male/cry_male_2.ogg')

#define SPECIES_DEFAULT_MOAN_SOUND(user) user.gender == FEMALE ? pick(\
		'modular_dripstation/sound/emotes/human/female/moan_female_1.ogg',\
		'modular_dripstation/sound/emotes/human/female/moan_female_2.ogg',\
		'modular_dripstation/sound/emotes/human/female/moan_female_3.ogg') : pick(\
		'modular_dripstation/sound/emotes/human/male/moan_male_1.ogg',\
		'modular_dripstation/sound/emotes/human/male/moan_male_2.ogg',\
		'modular_dripstation/sound/emotes/human/male/moan_male_3.ogg')

#define SPECIES_DEFAULT_YAWN_SOUND(user) user.gender == FEMALE ? pick(\
		'modular_dripstation/sound/emotes/human/female/yawn_female_1.ogg',\
		'modular_dripstation/sound/emotes/human/female/yawn_female_2.ogg',\
		'modular_dripstation/sound/emotes/human/female/yawn_female_3.ogg') : pick(\
		'modular_dripstation/sound/emotes/human/male/yawn_male_1.ogg',\
		'modular_dripstation/sound/emotes/human/male/yawn_male_2.ogg')
