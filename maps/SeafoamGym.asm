	object_const_def
	const SEAFOAMGYM_BLAINE
	const SEAFOAMGYM_GYM_GUIDE

SeafoamGym_MapScripts:
	def_scene_scripts
	scene_script SeafoamGymNoopScene ; unusable

	def_callbacks

SeafoamGymNoopScene:
	end

SeafoamGymBlaineScript:
	faceplayer
	opentext
	checkflag ENGINE_VOLCANOBADGE
	iftrue .FightDone
	writetext BlaineIntroText
	waitbutton
	closetext
	winlosstext BlaineWinLossText, 0
	loadtrainer BLAINE, BLAINE1
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	startbattle
	iftrue .ReturnAfterBattle
	appear SEAFOAMGYM_GYM_GUIDE
.ReturnAfterBattle:
	reloadmapafterbattle
	setevent EVENT_BEAT_BLAINE
	opentext
	writetext ReceivedVolcanoBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_VOLCANOBADGE
	writetext BlaineAfterBattleText
	waitbutton
	closetext
	end

.FightDone:
    checkevent EVENT_BEAT_RED
	iftrue .OfferRematch
; player hasn't beaten red yet
	writetext BlaineFightDoneText
	waitbutton
	closetext
	end
	
.OfferRematch:
    writetext BlaineRematchText
    yesorno
    iftrue .DoRematch
    ; keep going if false
	
.DontDoRematch:
    writetext BlaineRematchRefuseText
    waitbutton
    closetext
    end
	
.DoRematch:
    writetext BlaineRematchAcceptText
    waitbutton
    closetext
    winlosstext BlaineRematchLossText, 0
    loadtrainer BLAINE, BLAINE2
    loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
    startbattle
    reloadmapafterbattle
    opentext
    writetext BlaineRematchAfterText
    waitbutton
    closetext
    end

SeafoamGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_SEAFOAM_GYM_GUIDE_ONCE
	iftrue .TalkedToSeafoamGymGuideScript
	writetext SeafoamGymGuideWinText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_SEAFOAM_GYM_GUIDE_ONCE
	end

.TalkedToSeafoamGymGuideScript:
	writetext SeafoamGymGuideWinText2
	waitbutton
	closetext
	end

BlaineIntroText:
	text "BLAINE: Waaah!"

	para "My GYM in CINNABAR"
	line "burned down."

	para "My fire-breathing"
	line "#MON and I are"

	para "homeless because"
	line "of the volcano."

	para "Waaah!"

	para "But I'm back in"
	line "business as a GYM"

	para "LEADER here in"
	line "this cave."

	para "If you can beat"
	line "me, I'll give you"
	cont "a BADGE."

	para "Ha! You'd better"
	line "have equipped an"
	cont "ICE BERRY!"
	done

BlaineWinLossText:
	text "BLAINE: Awesome."
	line "I've burned out…"

	para "You've earned"
	line "VOLCANOBADGE!"
	done

ReceivedVolcanoBadgeText:
	text "<PLAYER> received"
	line "VOLCANOBADGE."
	done

BlaineAfterBattleText:
	text "BLAINE: I did lose"
	line "this time, but I'm"

	para "going to win the"
	line "next time."

	para "When I rebuild my"
	line "CINNABAR GYM,"

	para "we'll have to have"
	line "a rematch."
	done

BlaineFightDoneText:
	text "BLAINE: My fire"
	line "#MON will be"

	para "even stronger."
	line "Just you watch!"
	done
	
BlaineRematchText:
    text "BLAINE: So you"
	line "made your way"
	cont "back here!"
	
	para "My fire types"
	line "are in top shape!"
	
	para "Let's get cookin'!"
	done 
	
BlaineRematchAcceptText:
    text "My firey #MON"
	line "will incinerate"
	cont "all challengers!"
	done 
	
BlaineRematchRefuseText:
    text "No need to be shy."
	line "Come on!"
	done 
	
BlaineRematchLossText:
    text "I have burned down"
	line "to nothing!"
	
	para "Not even ashes"
	line "remain!"
	done 
	
BlaineRematchAfterText:
    text "Excellent! Come"
	line "challenge me"
	cont "again!"
	done 

SeafoamGymGuideWinText:
	text "Yo!"

	para "… Huh? It's over"
	line "already?"

	para "Sorry, sorry!"

	para "CINNABAR GYM was"
	line "gone, so I didn't"

	para "know where to find"
	line "you."

	para "But, hey, you're"
	line "plenty strong even"

	para "without my advice."
	line "I knew you'd win!"
	done

SeafoamGymGuideWinText2:
	text "A #MON GYM can"
	line "be anywhere as"

	para "long as the GYM"
	line "LEADER is there."

	para "There's no need"
	line "for a building."
	done

SeafoamGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, ROUTE_20, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SeafoamGymBlaineScript, -1
	object_event  6,  5, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamGymGuideScript, EVENT_SEAFOAM_GYM_GYM_GUIDE
