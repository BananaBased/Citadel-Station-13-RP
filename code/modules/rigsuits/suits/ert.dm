/obj/item/clothing/head/helmet/space/rig/ert
	light_overlay = "helmet_light_dual"
	camera_networks = list(NETWORK_ERT)

/datum/armor/rig/ert
	melee = 0.6
	bullet = 0.5
	laser = 0.3
	energy = 0.15
	bomb = 0.3
	bio = 1.0
	rad = 1.0

/obj/item/rig/ert
	name = "ERT-C hardsuit control module"
	desc = "A suit worn by the commander of an Emergency Response Team. Has blue highlights. Armoured and space ready."
	suit_type = "ERT commander"
	icon_state = "ert_commander_rig"

	helm_type = /obj/item/clothing/head/helmet/space/rig/ert

	req_access = list(ACCESS_CENTCOM_ERT)
	siemens_coefficient= 0.5

	armor_type = /datum/armor/rig/ert
	allowed = list(
		/obj/item/flashlight,
		/obj/item/tank,
		/obj/item/t_scanner,
		/obj/item/rcd,
		/obj/item/tool/crowbar,
		/obj/item/tool/screwdriver,
		/obj/item/weldingtool,
		/obj/item/tool/wirecutters,
		/obj/item/tool/wrench,
		/obj/item/multitool,
		/obj/item/radio,
		/obj/item/analyzer,
		/obj/item/storage/briefcase/inflatable,
		/obj/item/melee/baton,
		/obj/item/gun,
		/obj/item/storage/firstaid,
		/obj/item/reagent_containers/hypospray,
		/obj/item/roller,
		/obj/item/storage/backpack,
		/obj/item/bluespace_radio,
	)

	initial_modules = list(
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/datajack,
		)

/obj/item/rig/ert/engineer
	name = "ERT-E suit control module"
	desc = "A suit worn by the engineering division of an Emergency Response Team. Has orange highlights. Armoured and space ready."
	suit_type = "ERT engineer"
	icon_state = "ert_engineer_rig"
	glove_type = /obj/item/clothing/gloves/gauntlets/rig/eva

	initial_modules = list(
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/device/plasmacutter,
		/obj/item/rig_module/device/rcd
		)

/obj/item/rig/ert/medical
	name = "ERT-M suit control module"
	desc = "A suit worn by the medical division of an Emergency Response Team. Has white highlights. Armoured and space ready."
	suit_type = "ERT medic"
	icon_state = "ert_medical_rig"

	initial_modules = list(
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/device/healthscanner,
		/obj/item/rig_module/chem_dispenser/injector/advanced
		)

/obj/item/rig/ert/security
	name = "ERT-S suit control module"
	desc = "A suit worn by the security division of an Emergency Response Team. Has red highlights. Armoured and space ready."
	suit_type = "ERT security"
	icon_state = "ert_security_rig"

	initial_modules = list(
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/grenade_launcher,
		/obj/item/rig_module/mounted/egun,
		)

/obj/item/rig/ert/janitor
	name = "ERT-J suit control module"
	desc = "A suit worn by the janitorial division of an Emergency Response Team. Has purple highlights. Armoured and space ready."
	suit_type = "ERT janitor"
	icon_state = "ert_janitor_rig"

	initial_modules = list(
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/grenade_launcher/cleaner,
		)

/datum/armor/rig/ert/deathsquad
	melee = 0.8
	bullet = 0.65
	laser = 0.5
	energy = 0.25
	bomb = 0.8
	bio = 1.0

/obj/item/rig/ert/assetprotection
	name = "Heavy Asset Protection suit control module"
	desc = "A heavy suit worn by the highest level of Asset Protection, don't mess with the person wearing this. Armoured and space ready."
	suit_type = "heavy asset protection"
	icon_state = "asset_protection_rig"
	armor_type = /datum/armor/rig/ert/deathsquad
	siemens_coefficient= 0.3
	glove_type = /obj/item/clothing/gloves/gauntlets/rig/eva

	initial_modules = list(
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/grenade_launcher,
		/obj/item/rig_module/vision/multi,
		/obj/item/rig_module/mounted/egun,
		/obj/item/rig_module/chem_dispenser/injector,
		/obj/item/rig_module/device/plasmacutter,
		/obj/item/rig_module/device/rcd,
		/obj/item/rig_module/datajack
		)

/obj/item/rig/ert/para
	name = "PARA suit control module"
	desc = "A sleek module decorated with intricate glyphs and alien wards. When worn by a trained agent, the various glyphs faintly glow."
	suit_type = "PMD agent"
	icon_state = "para_ert_rig"
	action_button_name = "Enable RIG Sigils"

	var/anti_magic = FALSE
	var/blessed = FALSE
	var/emp_proof = FALSE

	initial_modules = list(
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/device/anomaly_scanner,
		/obj/item/rig_module/armblade,
		/obj/item/rig_module/datajack,
		/obj/item/rig_module/grenade_launcher/holy,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/vision/meson,
		/obj/item/rig_module/self_destruct
		)

/obj/item/rig/ert/para/attack_self(mob/user)
	. = ..()
	if(.)
		return
	if(user.mind.isholy && !anti_magic && !emp_proof && !blessed)
		anti_magic = TRUE
		blessed = TRUE
		emp_proof = TRUE
		to_chat(user, "<font color=#4F49AF>You enable the RIG's protective sigils.</font>")
	else
		anti_magic = FALSE
		blessed = FALSE
		emp_proof = FALSE
		to_chat(user, "<font color=#4F49AF>You disable the RIG's protective sigils.</font>")

	if(!user.mind.isholy)
		to_chat(user, "<font color='red'>You can't figure out what these symbols do.</font>")

/obj/item/rig/ert/para/emp_act(severity)
	if(emp_proof)
		emp_protection = 75
	else
		return
