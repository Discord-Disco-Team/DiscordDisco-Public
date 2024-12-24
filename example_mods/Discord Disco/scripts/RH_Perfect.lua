function onCreate()
	precacheSound('Pfail')

    makeLuaSprite('Go for a Perfect', 'perfecto', 94, 4)

	makeAnimatedLuaSprite('P', 'P', 20, 14)
	addAnimationByPrefix('P', 'P fail', 'P fail', 60, false)
	addAnimationByPrefix('P', 'el pp', 'el pp', 60, false)
	addAnimationByPrefix('P', 'Pidle', 'Pidle', 60, false)
end

function onSongStart()
	addLuaSprite('Go for a Perfect', true)
	setProperty('Go for a Perfect.antialiasing', true)
	setObjectCamera('Go for a Perfect', 'hud')
	setObjectOrder('Go for a Perfect', 100)

	addLuaSprite('P', true)
	scaleObject('P', 0.85, 0.85)
	setProperty('P.antialiasing', true)
	setObjectCamera('P', 'hud')
	setObjectOrder('P', 99)
end

function onBeatHit()
    if curBeat % 2 == 0 then
        setProperty('Go for a Perfect.alpha', 0)
    end
    
    if curBeat % 4 == 0 then
        setProperty('Go for a Perfect.alpha', 1)
    end
end

function onUpdate()
	if botPlay then
		removeLuaSprite('Go for a Perfect')
		removeLuaSprite('P')
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if isSustainNote == false and misses == 0 then
		playAnim('P', 'el pp')
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if misses == 1 then
		removeLuaSprite('Go for a Perfect')
		playAnim('P', 'P fail')
		setProperty('P.y', 9)
		playSound('Pfail')
		runTimer('chau', 0.9)
	end
end

function onTimerCompleted(tag)
	if tag == 'chau' then
		removeLuaSprite('P')
	end
end
