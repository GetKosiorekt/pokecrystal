	object_const_def
	const ROUTE20_SWIMMER_GIRL1
	const ROUTE20_SWIMMER_GIRL2
	const ROUTE20_SWIMMER_GUY
	const ROUTE20_LORELEI

Route20_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route20ClearRocksCallback

Route20ClearRocksCallback:
	setevent EVENT_CINNABAR_ROCKS_CLEARED
	endcallback

TrainerSwimmerfNicole:
	trainer SWIMMERF, NICOLE, EVENT_BEAT_SWIMMERF_NICOLE, SwimmerfNicoleSeenText, SwimmerfNicoleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfNicoleAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfLori:
	trainer SWIMMERF, LORI, EVENT_BEAT_SWIMMERF_LORI, SwimmerfLoriSeenText, SwimmerfLoriBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfLoriAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermCameron:
	trainer SWIMMERM, CAMERON, EVENT_BEAT_SWIMMERM_CAMERON, SwimmermCameronSeenText, SwimmermCameronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermCameronAfterBattleText
	waitbutton
	closetext
	end
	
LoreleiScript:
    checkevent EVENT_BEAT_LORELEI
	iftrue .FightDone
    opentext
	writetext LoreleiIntroText 
	waitbutton
	closetext
	faceplayer
	opentext
	writetext LoreleiMatchText
	yesorno
    iftrue .DoMatch
	; keep going if false
	
.DontDoMatch:
    writetext LoreleiMatchRefuseText
    waitbutton
    closetext
    end
	
.DoMatch:
    writetext LoreleiMatchAcceptText
    waitbutton
    closetext
    winlosstext LoreleiMatchLossText, 0
    loadtrainer LORELEI, LORELEI1
    loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
    startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LORELEI
    opentext
    writetext LoreleiMatchAfterText
    waitbutton
    closetext
    end
	
.FightDone:
    faceplayer
	opentext
    writetext LoreleiRematchText
	yesorno
	iftrue .DoRematch
	; keep going if false 
	
.DontDoRematch:
    writetext LoreleiMatchRefuseText
    waitbutton
    closetext
    end
	
.DoRematch:
    checkevent EVENT_BEAT_RED
	iftrue .DoReMatch2
; player hasn't beaten Red yet
    writetext LoreleiMatchAcceptText
    waitbutton
    closetext
    winlosstext LoreleiMatchLossText, 0
    loadtrainer LORELEI, LORELEI1
    loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
    startbattle
    reloadmapafterbattle
    faceplayer
	opentext 
    writetext LoreleiRematchAfterText
    waitbutton
    closetext
    end
	
.DoReMatch2:
    writetext LoreleiMatchAcceptText
    waitbutton
    closetext
    winlosstext LoreleiMatchLossText, 0
    loadtrainer LORELEI, LORELEI2
    loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
    startbattle
    reloadmapafterbattle
    faceplayer
	opentext 
    writetext LoreleiRematchAfterText
    waitbutton
    closetext
    end

CinnabarGymSign:
	jumptext CinnabarGymSignText

SwimmerfNicoleSeenText:
	text "I feel so much"
	line "lighter in water."
	done

SwimmerfNicoleBeatenText:
	text "Oh, no!"
	done

SwimmerfNicoleAfterBattleText:
	text "Swimming exercises"
	line "your full body."

	para "It's really good"
	line "for you."
	done

SwimmerfLoriSeenText:
	text "What an impressive"
	line "collection of GYM"

	para "BADGES. We should"
	line "battle!"
	done

SwimmerfLoriBeatenText:
	text "No!"
	done

SwimmerfLoriAfterBattleText:
	text "SURF is no longer"
	line "the only HM move"
	cont "you use in water."
	done

SwimmermCameronSeenText:
	text "I guess it's im-"
	line "possible to swim"

	para "all the way to"
	line "JOHTO."
	done

SwimmermCameronBeatenText:
	text "Aiyah!"
	done

SwimmermCameronAfterBattleText:
	text "Besides the sea, I"
	line "can also swim in"
	cont "ponds and rivers."
	done
	
LoreleiIntroText:
    text "So this is what's"
	line "left of ARTICUNO's"
	cont "former home…"
	done 
	
LoreleiMatchText:
    text "Oh, excuse me, I"
	line "was lost in"
	cont "thought."
	
	para "I am LORELEI."
	line "And you are?"
	
	para "…"
	
	para "I see, so you"
	line "are <PLAY_G>."
	
	para "I used to be a"
	line "member of the"
	cont "ELITE FOUR in"
	cont "in the past."
	
	para "I assume you're"
	line "here to challenge"
	cont "BLAINE?"
	
	para "You have the aura"
	line "of a powerful"
	cont "trainer."
	
	para "Would you like"
	line "to battle?"
	done 
	
LoreleiMatchAcceptText:
    text "No one can best"
	line "me when it comes"
	cont "to ICE #MON."
	
	para "Your #MON"
	line "will be at my"
	cont "mercy when they"
	cont "are frozen solid!"
	done  

LoreleiMatchRefuseText:
    text "I see…"
	done 
	
LoreleiMatchLossText:
    text "…Things"
	line "shouldn't be"
	cont "this way!"
	done 
	
LoreleiMatchAfterText:
    text "You are a"
	line "very talented"
	cont "trainer."
	
	para "It's no wonder"
	line "you've gotten"
	cont "this far."
	done 
	
LoreleiRematchText:
    text "Hey! Fantastic"
	line "timing!"
	
	para "I was thinking"
	line "how much I'd"
	cont "like to battle"
	cont "you again."
	
	para "I hope you're"
	line "ready."
	done 
	
LoreleiRematchAfterText:
    text "Looks like"
	line "you've gotten"
	cont "stronger since"
	cont "we last fought!"
	done 

CinnabarGymSignText:
	text "What does this"
	line "sign say?"

	para "CINNABAR GYM"
	line "LEADER: BLAINE"
	done

Route20_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 38,  7, SEAFOAM_GYM, 1

	def_coord_events

	def_bg_events
	bg_event 37, 11, BGEVENT_READ, CinnabarGymSign

	def_object_events
	object_event 52,  8, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfNicole, -1
	object_event 45, 13, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfLori, -1
	object_event 12, 13, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermCameron, -1
    object_event 39, 10, SPRITE_LORELEI, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LoreleiScript, -1