/datum/category_item/catalogue/fauna/horror/TinyTim
	name = "%%OST$OSTLOSTLOS%@!"
	desc = "%WARNING% PROCESSING FAILURE! RETURN SCANNER TO A CENTRAL \
	ADMINISTRATOR FOR IMMEDIATE MAINTENANCE! %ERROR%"
	value = CATALOGUER_REWARD_TRIVIAL

/mob/living/simple_mob/horror/TinyTim
	name = "???"
	desc = "A tall figure wearing ripped clothes. Its eyes are placed on the bulb of skin that's folded over the front of its face."

	icon_state = "timling"
	icon_living = "timling"
	icon_dead = "tt_head"
	icon_rest = "timling"
	faction = "horror"
	icon = 'icons/mob/horror_show/tallhorror.dmi'
	icon_gib = "generic_gib"
	catalogue_data = list(/datum/category_item/catalogue/fauna/horror/TinyTim)

	attack_sound = 'sound/h_sounds/youknowwhoitis.ogg'

	maxHealth = 200
	health = 200

	melee_damage_lower = 30
	melee_damage_upper = 40
	grab_resist = 100

	response_help = "pets the"
	response_disarm = "bops the"
	response_harm = "hits the"
	attacktext = list("mutilate")
	friendly = list("nuzzles", "boops", "headbumps against", "leans on")


	say_list_type = /datum/say_list/TinyTim
	ai_holder_type = /datum/ai_holder/simple_mob/horror

	bone_amount = 3
	hide_amount = 5
	exotic_amount = 1

/mob/living/simple_mob/horror/TinyTim/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/horror_aura)

/mob/living/simple_mob/horror/TinyTim/death()
	playsound(src, 'sound/h_sounds/shitty_tim.ogg', 50, 1)
	..()

/mob/living/simple_mob/horror/TinyTim/bullet_act()
	playsound(src, 'sound/h_sounds/holla.ogg', 50, 1)
	..()

/mob/living/simple_mob/horror/TinyTim/attack_hand(mob/user, list/params)
	playsound(src, 'sound/h_sounds/holla.ogg', 50, 1)
	..()

/mob/living/simple_mob/horror/TinyTim/throw_impacted(atom/movable/AM, datum/thrownthing/TT)
	. = ..()
	playsound(src, 'sound/h_sounds/holla.ogg', 50, 1)

/mob/living/simple_mob/horror/TinyTim/attackby()
	playsound(src, 'sound/h_sounds/holla.ogg', 50, 1)
	..()

/datum/say_list/TinyTim
	speak = list("Wuuuuuhhuuhhhhh?","Urk! Aaaaahaaa!", "Yuhyuhyuhyuh...")
	emote_hear = list("shrieks", "groans in pain", "flaps", "gnashes its teeth")
	emote_see = list("jiggles its teeth", "shakes violently", "stares aggressively")
	say_maybe_target = list("Uuurrgghhh?")
	say_got_target = list("AAAHHHHH!")
