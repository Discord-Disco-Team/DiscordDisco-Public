-- Script By Francisco_Deodato939
downScroll = false
function onCreatePost()
    -- misc
    makeLuaText('misc')
    addLuaText('misc')
    setTextSize('misc', 24)
    setTextAlignment('misc', 'left')
    setObjectCamera('misc', 'other')
    -- playerStrums
    setPropertyFromGroup('playerStrums', 0, 'x', 410)
    setPropertyFromGroup('playerStrums', 1, 'x', 525)
    setPropertyFromGroup('playerStrums', 2, 'x', 640)
    setPropertyFromGroup('playerStrums', 3, 'x', 755)
end
function onUpdate(elapsed)
    -- icons
    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)
    -- gf
    setProperty('gf.visible', false)
    -- mouse
    setPropertyFromClass('flixel.FlxG', 'mouse.visible', false)
    -- frame rate
	setPropertyFromClass('Main', 'fpsVar.visible', false)
    -- opponentStrums
    setPropertyFromGroup('opponentStrums', 0, 'x', 9999)
    setPropertyFromGroup('opponentStrums', 1, 'x', 9999)
    setPropertyFromGroup('opponentStrums', 2, 'x', 9999)
    setPropertyFromGroup('opponentStrums', 3, 'x', 9999)
    -- timeBar
    if getProperty('timeBar.scale.x') < 1 then
        setProperty('timeBar.scale.x', getProperty('timeBar.scale.x') + 0.06)
        setProperty('timeBarBG.scale.x', getProperty('timeBarBG.scale.x') + 0.06)
    end
    -- playerStrums
    if getPropertyFromGroup('playerStrums', 0, 'x') < 410 then
        setPropertyFromGroup('playerStrums', 0, 'x', getPropertyFromGroup('playerStrums', 0, 'x') + 6)
    end
    if getPropertyFromGroup('playerStrums', 1, 'x') < 525 then
        setPropertyFromGroup('playerStrums', 1, 'x', getPropertyFromGroup('playerStrums', 1, 'x') + 3)
    end
    if getPropertyFromGroup('playerStrums', 2, 'x') > 640 then
        setPropertyFromGroup('playerStrums', 2, 'x', getPropertyFromGroup('playerStrums', 2, 'x') - 3)
    end
    if getPropertyFromGroup('playerStrums', 3, 'x') > 755 then
        setPropertyFromGroup('playerStrums', 3, 'x', getPropertyFromGroup('playerStrums', 3, 'x') - 6)
    end
    -- healthBar
    if getProperty('healthBar.scale.x') > 1 then
        setProperty('healthBar.scale.x', getProperty('healthBar.scale.x') - 0.06)
        setProperty('healthBarBG.scale.x', getProperty('healthBarBG.scale.x') - 0.06)
    end
    -- camera
    if getProperty('camGame.angle') < 0 or getProperty('camGame.angle') > 0 then
        setProperty('camGame.angle', 0)
        setProperty('camHUD.angle', 0)
    end
    -- curAnim
    if getProperty('boyfriend.animation.curAnim.name') == 'idle' or getProperty('dad.animation.curAnim.name') == 'idle' then
        setTextString('scoreTxt', 'Score: 0 | Misses: 0 | Rating: ?')
    end
    if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
        -- scoreTxt
        setTextString('scoreTxt', 'On or towards the side of your body that is to the west when you are facing north.')
        -- strumLineNotes
        for singLEFT = 4,4 do
            setPropertyFromGroup('strumLineNotes', singLEFT, 'scale.x', getPropertyFromGroup('strumLineNotes', singLEFT, 'scale.x') - 0.01)
            setPropertyFromGroup('unspawnNotes', singLEFT, 'scale.x', getPropertyFromGroup('unspawnNotes', singLEFT, 'scale.x') - 0.01)
            setPropertyFromGroup('strumLineNotes', singLEFT, 'angle', getPropertyFromGroup('strumLineNotes', singLEFT, 'angle') - 0.1)
        end
        -- notes
		for notes = 0, getProperty('notes.length') - 1 do
            if getPropertyFromGroup('notes', notes, 'multSpeed') >= 0.2 then
                setPropertyFromGroup('notes', notes, 'multSpeed', getPropertyFromGroup('notes', notes, 'multSpeed') - 0.1)
            end
		end
        -- bpm
		setPropertyFromClass('Conductor', 'bpm', getPropertyFromClass('Conductor', 'bpm') - 1)
        -- frame rate
		setPropertyFromClass('flixel.FlxG', 'drawFramerate', getPropertyFromClass('flixel.FlxG', 'drawFramerate') - 1)
        -- boyfriend
        setProperty('boyfriend.x', getProperty('boyfriend.x') - 10)
    elseif getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
        -- scoreTxt
        setTextString('scoreTxt', 'In or towards a low or lower position, from a higher one.')
        -- strumLineNotes
        for singDOWN = 5,5 do
            setPropertyFromGroup('strumLineNotes', singDOWN, 'scale.y', getPropertyFromGroup('strumLineNotes', singDOWN, 'scale.y') - 0.01)
            setPropertyFromGroup('unspawnNotes', singDOWN, 'scale.y', getPropertyFromGroup('unspawnNotes', singDOWN, 'scale.y') - 0.01)
            setPropertyFromGroup('strumLineNotes', singDOWN, 'angle', getPropertyFromGroup('strumLineNotes', singDOWN, 'angle') - 0.1)
        end
        -- notes
		for notes = 0, getProperty('notes.length') - 1 do
            if getPropertyFromGroup('notes', notes, 'multSpeed') >= 0.2 then
                setPropertyFromGroup('notes', notes, 'multSpeed', getPropertyFromGroup('notes', notes, 'multSpeed') - 0.1)
            end
		end
        -- bpm
		setPropertyFromClass('Conductor', 'bpm', getPropertyFromClass('Conductor', 'bpm') - 1)
        -- frame rate
		setPropertyFromClass('flixel.FlxG', 'drawFramerate', getPropertyFromClass('flixel.FlxG', 'drawFramerate') - 1)
        -- boyfriend
        setProperty('boyfriend.y', getProperty('boyfriend.y') + 10)
    elseif getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
        -- scoreTxt
        setTextString('scoreTxt', 'Towards a higher position; towards a higher value, number, or level.')
        -- strumLineNotes
        for singUP = 6,6 do
            setPropertyFromGroup('strumLineNotes', singUP, 'scale.y', getPropertyFromGroup('strumLineNotes', singUP, 'scale.y') + 0.01)
            setPropertyFromGroup('unspawnNotes', singUP, 'scale.y', getPropertyFromGroup('unspawnNotes', singUP, 'scale.y') + 0.01)
            setPropertyFromGroup('strumLineNotes', singUP, 'angle', getPropertyFromGroup('strumLineNotes', singUP, 'angle') + 0.1)
        end
        -- notes
		for notes = 0, getProperty('notes.length') - 1 do
            if getPropertyFromGroup('notes', notes, 'multSpeed') <= 9 then
                setPropertyFromGroup('notes', notes, 'multSpeed', getPropertyFromGroup('notes', notes, 'multSpeed') + 0.1)
            end
		end
        -- bpm
		setPropertyFromClass('Conductor', 'bpm', getPropertyFromClass('Conductor', 'bpm') + 1)
        -- frame rate
		setPropertyFromClass('flixel.FlxG', 'drawFramerate', getPropertyFromClass('flixel.FlxG', 'drawFramerate') + 1)
        -- boyfriend
        setProperty('boyfriend.y', getProperty('boyfriend.y') - 10)
    elseif getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
        -- scoreTxt
        setTextString('scoreTxt', 'Correct.')
        -- strumLineNotes
        for singRIGHT = 7,7 do
            setPropertyFromGroup('strumLineNotes', singRIGHT, 'scale.x', getPropertyFromGroup('strumLineNotes', singRIGHT, 'scale.x') + 0.01)
            setPropertyFromGroup('unspawnNotes', singRIGHT, 'scale.x', getPropertyFromGroup('unspawnNotes', singRIGHT, 'scale.x') + 0.01)
            setPropertyFromGroup('strumLineNotes', singRIGHT, 'angle', getPropertyFromGroup('strumLineNotes', singRIGHT, 'angle') + 0.1)
        end
        -- notes
		for notes = 0, getProperty('notes.length') - 1 do
            if getPropertyFromGroup('notes', notes, 'multSpeed') <= 9 then
                setPropertyFromGroup('notes', notes, 'multSpeed', getPropertyFromGroup('notes', notes, 'multSpeed') + 0.1)
            end
		end
        -- bpm
		setPropertyFromClass('Conductor', 'bpm', getPropertyFromClass('Conductor', 'bpm') + 1)
        -- frame rate
		setPropertyFromClass('flixel.FlxG', 'drawFramerate', getPropertyFromClass('flixel.FlxG', 'drawFramerate') + 1)
        -- boyfriend
        setProperty('boyfriend.x', getProperty('boyfriend.x') + 10)
    elseif getProperty('boyfriend.animation.curAnim.name') == 'singLEFTmiss' then
        -- scoreTxt
        setTextString('scoreTxt', 'To fail to do or experience something, often something planned or expected, or to avoid doing or experiencing something.')
        -- misc
        for singLEFT = 4,4 do
            if getPropertyFromGroup('strumLineNotes', singLEFT, 'alpha') > 0 then
                setPropertyFromGroup('strumLineNotes', singLEFT, 'alpha', getPropertyFromGroup('strumLineNotes', singLEFT, 'alpha') - 0.07)
            end
            setPropertyFromGroup('strumLineNotes', singLEFT, 'scale.x', getPropertyFromGroup('strumLineNotes', singLEFT, 'scale.x') + 0.01)
            setPropertyFromGroup('unspawnNotes', singLEFT, 'scale.x', getPropertyFromGroup('unspawnNotes', singLEFT, 'scale.x') + 0.01)
            setPropertyFromGroup('strumLineNotes', singLEFT, 'angle', getPropertyFromGroup('strumLineNotes', singLEFT, 'angle') + 0.1)
        end
		for notes = 0, getProperty('notes.length') - 1 do
            if getPropertyFromGroup('notes', notes, 'multSpeed') <= 9 then
                setPropertyFromGroup('notes', notes, 'multSpeed', getPropertyFromGroup('notes', notes, 'multSpeed') + 0.1)
            end
		end
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('flixel.FlxG', 'sound.music.time') - 10)
        -- bpm
		setPropertyFromClass('Conductor', 'bpm', getPropertyFromClass('Conductor', 'bpm') + 1)
        -- frame rate
		setPropertyFromClass('flixel.FlxG', 'drawFramerate', getPropertyFromClass('flixel.FlxG', 'drawFramerate') + 1)
        -- boyfriend
        setProperty('boyfriend.x', getProperty('boyfriend.x') + 10)
		setProperty('boyfriend.scale.x', getProperty('boyfriend.scale.x') + 0.1)
    elseif getProperty('boyfriend.animation.curAnim.name') == 'singDOWNmiss' then
        -- scoreTxt
        setTextString('scoreTxt', 'To fail to do or experience something, often something planned or expected, or to avoid doing or experiencing something.')
        -- strumLineNotes
        for singDOWN = 5,5 do
            if getPropertyFromGroup('strumLineNotes', singDOWN, 'alpha') > 0 then
                setPropertyFromGroup('strumLineNotes', singDOWN, 'alpha', getPropertyFromGroup('strumLineNotes', singDOWN, 'alpha') - 0.07)
            end
            setPropertyFromGroup('strumLineNotes', singDOWN, 'scale.y', getPropertyFromGroup('strumLineNotes', singDOWN, 'scale.y') + 0.01)
            setPropertyFromGroup('unspawnNotes', singDOWN, 'scale.y', getPropertyFromGroup('unspawnNotes', singDOWN, 'scale.y') + 0.01)
            setPropertyFromGroup('strumLineNotes', singDOWN, 'angle', getPropertyFromGroup('strumLineNotes', singDOWN, 'angle') + 0.1)
        end
        -- notes
		for notes = 0, getProperty('notes.length') - 1 do
            if getPropertyFromGroup('notes', notes, 'multSpeed') <= 9 then
                setPropertyFromGroup('notes', notes, 'multSpeed', getPropertyFromGroup('notes', notes, 'multSpeed') + 0.1)
            end
		end
        -- sound.music.time
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('flixel.FlxG', 'sound.music.time') - 10)
        -- bpm
		setPropertyFromClass('Conductor', 'bpm', getPropertyFromClass('Conductor', 'bpm') + 1)
        -- frame rate
		setPropertyFromClass('flixel.FlxG', 'drawFramerate', getPropertyFromClass('flixel.FlxG', 'drawFramerate') + 1)
        -- boyfriend
        setProperty('boyfriend.y', getProperty('boyfriend.y') - 10)
		setProperty('boyfriend.scale.y', getProperty('boyfriend.scale.y') - 0.1)
    elseif getProperty('boyfriend.animation.curAnim.name') == 'singUPmiss' then
        -- scoreTxt
        setTextString('scoreTxt', 'To fail to do or experience something, often something planned or expected, or to avoid doing or experiencing something.')
        -- strumLineNotes
        for singUP = 6,6 do
            if getPropertyFromGroup('strumLineNotes', singUP, 'alpha') > 0 then
                setPropertyFromGroup('strumLineNotes', singUP, 'alpha', getPropertyFromGroup('strumLineNotes', singUP, 'alpha') - 0.07)
            end
            setPropertyFromGroup('strumLineNotes', singUP, 'scale.y', getPropertyFromGroup('strumLineNotes', singUP, 'scale.y') - 0.01)
            setPropertyFromGroup('unspawnNotes', singUP, 'scale.y', getPropertyFromGroup('unspawnNotes', singUP, 'scale.y') - 0.01)
            setPropertyFromGroup('strumLineNotes', singUP, 'angle', getPropertyFromGroup('strumLineNotes', singUP, 'angle') - 0.1)
        end
        -- notes
		for notes = 0, getProperty('notes.length') - 1 do
            if getPropertyFromGroup('notes', notes, 'multSpeed') >= 0.2 then
                setPropertyFromGroup('notes', notes, 'multSpeed', getPropertyFromGroup('notes', notes, 'multSpeed') - 0.1)
            end
		end
        -- sound.music.time
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('flixel.FlxG', 'sound.music.time') - 10)
        -- bpm
		setPropertyFromClass('Conductor', 'bpm', getPropertyFromClass('Conductor', 'bpm') - 1)
        -- frame rate
		setPropertyFromClass('flixel.FlxG', 'drawFramerate', getPropertyFromClass('flixel.FlxG', 'drawFramerate') - 1)
        -- boyfriend
        setProperty('boyfriend.y', getProperty('boyfriend.y') + 10)
		setProperty('boyfriend.scale.y', getProperty('boyfriend.scale.y') + 0.1)
    elseif getProperty('boyfriend.animation.curAnim.name') == 'singRIGHTmiss' then
        -- scoreTxt
        setTextString('scoreTxt', 'To fail to do or experience something, often something planned or expected, or to avoid doing or experiencing something.')
        -- strumLineNotes
        for singRIGHT = 7,7 do
            if getPropertyFromGroup('strumLineNotes', singRIGHT, 'alpha') > 0 then
                setPropertyFromGroup('strumLineNotes', singRIGHT, 'alpha', getPropertyFromGroup('strumLineNotes', singRIGHT, 'alpha') - 0.07)
            end
            setPropertyFromGroup('strumLineNotes', singRIGHT, 'scale.x', getPropertyFromGroup('strumLineNotes', singRIGHT, 'scale.x') - 0.01)
            setPropertyFromGroup('unspawnNotes', singRIGHT, 'scale.x', getPropertyFromGroup('unspawnNotes', singRIGHT, 'scale.x') - 0.01)
            setPropertyFromGroup('strumLineNotes', singRIGHT, 'angle', getPropertyFromGroup('strumLineNotes', singRIGHT, 'angle') - 0.1)
        end
        -- notes
		for notes = 0, getProperty('notes.length') - 1 do
            if getPropertyFromGroup('notes', notes, 'multSpeed') >= 0.2 then
                setPropertyFromGroup('notes', notes, 'multSpeed', getPropertyFromGroup('notes', notes, 'multSpeed') - 0.1)
            end
		end
        -- sound.music.time
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('flixel.FlxG', 'sound.music.time') - 10)
        -- bpm
		setPropertyFromClass('Conductor', 'bpm', getPropertyFromClass('Conductor', 'bpm') - 1)
        -- frame rate
		setPropertyFromClass('flixel.FlxG', 'drawFramerate', getPropertyFromClass('flixel.FlxG', 'drawFramerate') - 1)
        -- boyfriend
        setProperty('boyfriend.x', getProperty('boyfriend.x') - 10)
		setProperty('boyfriend.scale.x', getProperty('boyfriend.scale.x') - 0.1)
    end
    if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
        -- scoreTxt
        setTextString('scoreTxt', 'On or towards the side of your body that is to the west when you are facing north.')
        -- strumLineNotes
        for singLEFT = 4,4 do
            if getPropertyFromGroup('strumLineNotes', singLEFT, 'alpha') > 0 then
                setPropertyFromGroup('strumLineNotes', singLEFT, 'alpha', getPropertyFromGroup('strumLineNotes', singLEFT, 'alpha') - 0.07)
            end
            setPropertyFromGroup('strumLineNotes', singLEFT, 'scale.x', getPropertyFromGroup('strumLineNotes', singLEFT, 'scale.x') + 0.01)
            setPropertyFromGroup('unspawnNotes', singLEFT, 'scale.x', getPropertyFromGroup('unspawnNotes', singLEFT, 'scale.x') + 0.01)
            setPropertyFromGroup('strumLineNotes', singLEFT, 'angle', getPropertyFromGroup('strumLineNotes', singLEFT, 'angle') + 0.1)
        end
        -- notes
		for notes = 0, getProperty('notes.length') - 1 do
            if getPropertyFromGroup('notes', notes, 'multSpeed') >= 0.2 then
                setPropertyFromGroup('notes', notes, 'multSpeed', getPropertyFromGroup('notes', notes, 'multSpeed') - 0.1)
            end
		end
        -- sound.music.time
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('flixel.FlxG', 'sound.music.time') - 10)
        -- bpm
		setPropertyFromClass('Conductor', 'bpm', getPropertyFromClass('Conductor', 'bpm') - 1)
        -- frame rate
		setPropertyFromClass('flixel.FlxG', 'drawFramerate', getPropertyFromClass('flixel.FlxG', 'drawFramerate') - 1)
        -- dad
        setProperty('dad.x', getProperty('dad.x') - 10)
		setProperty('dad.scale.x', getProperty('dad.scale.x') - 0.1)
    elseif getProperty('dad.animation.curAnim.name') == 'singDOWN' then
        -- scoreTxt
        setTextString('scoreTxt', 'In or towards a low or lower position, from a higher one.')
        -- strumLineNotes
        for singDOWN = 5,5 do
            if getPropertyFromGroup('strumLineNotes', singDOWN, 'alpha') > 0 then
                setPropertyFromGroup('strumLineNotes', singDOWN, 'alpha', getPropertyFromGroup('strumLineNotes', singDOWN, 'alpha') - 0.07)
            end
            setPropertyFromGroup('strumLineNotes', singDOWN, 'scale.y', getPropertyFromGroup('strumLineNotes', singDOWN, 'scale.y') + 0.01)
            setPropertyFromGroup('unspawnNotes', singDOWN, 'scale.y', getPropertyFromGroup('unspawnNotes', singDOWN, 'scale.y') + 0.01)
            setPropertyFromGroup('strumLineNotes', singDOWN, 'angle', getPropertyFromGroup('strumLineNotes', singDOWN, 'angle') + 0.1)
        end
        -- notes
		for notes = 0, getProperty('notes.length') - 1 do
            if getPropertyFromGroup('notes', notes, 'multSpeed') >= 0.2 then
                setPropertyFromGroup('notes', notes, 'multSpeed', getPropertyFromGroup('notes', notes, 'multSpeed') - 0.1)
            end
		end
        -- sound.music.time
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('flixel.FlxG', 'sound.music.time') - 10)
        -- bpm
		setPropertyFromClass('Conductor', 'bpm', getPropertyFromClass('Conductor', 'bpm') - 1)
        -- frame rate
		setPropertyFromClass('flixel.FlxG', 'drawFramerate', getPropertyFromClass('flixel.FlxG', 'drawFramerate') - 1)
        -- dad
        setProperty('dad.y', getProperty('dad.y') + 10)
		setProperty('dad.scale.y', getProperty('dad.scale.y') + 0.1)
    elseif getProperty('dad.animation.curAnim.name') == 'singUP' then
        -- scoreTxt
        setTextString('scoreTxt', 'Towards a higher position; towards a higher value, number, or level.')
        -- strumLineNotes
        for singUP = 6,6 do
            if getPropertyFromGroup('strumLineNotes', singUP, 'alpha') > 0 then
                setPropertyFromGroup('strumLineNotes', singUP, 'alpha', getPropertyFromGroup('strumLineNotes', singUP, 'alpha') - 0.07)
            end
            setPropertyFromGroup('strumLineNotes', singUP, 'scale.y', getPropertyFromGroup('strumLineNotes', singUP, 'scale.y') - 0.01)
            setPropertyFromGroup('unspawnNotes', singUP, 'scale.y', getPropertyFromGroup('unspawnNotes', singUP, 'scale.y') - 0.01)
            setPropertyFromGroup('strumLineNotes', singUP, 'angle', getPropertyFromGroup('strumLineNotes', singUP, 'angle') + 0.1)
        end
        -- notes
		for notes = 0, getProperty('notes.length') - 1 do
            if getPropertyFromGroup('notes', notes, 'multSpeed') <= 9 then
                setPropertyFromGroup('notes', notes, 'multSpeed', getPropertyFromGroup('notes', notes, 'multSpeed') + 0.1)
            end
		end
        -- sound.music.time
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('flixel.FlxG', 'sound.music.time') - 10)
        -- bpm
		setPropertyFromClass('Conductor', 'bpm', getPropertyFromClass('Conductor', 'bpm') + 1)
        -- frame rate
		setPropertyFromClass('flixel.FlxG', 'drawFramerate', getPropertyFromClass('flixel.FlxG', 'drawFramerate') + 1)
        -- dad
        setProperty('dad.y', getProperty('dad.y') - 10)
		setProperty('dad.scale.y', getProperty('dad.scale.y') - 0.1)
    elseif getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
        -- scoreTxt
        setTextString('scoreTxt', 'Correct.')
        -- strumLineNotes
        for singRIGHT = 7,7 do
            if getPropertyFromGroup('strumLineNotes', singRIGHT, 'alpha') > 0 then
                setPropertyFromGroup('strumLineNotes', singRIGHT, 'alpha', getPropertyFromGroup('strumLineNotes', singRIGHT, 'alpha') - 0.07)
            end
            setPropertyFromGroup('strumLineNotes', singRIGHT, 'scale.x', getPropertyFromGroup('strumLineNotes', singRIGHT, 'scale.x') - 0.01)
            setPropertyFromGroup('unspawnNotes', singRIGHT, 'scale.x', getPropertyFromGroup('unspawnNotes', singRIGHT, 'scale.x') - 0.01)
            setPropertyFromGroup('strumLineNotes', singRIGHT, 'angle', getPropertyFromGroup('strumLineNotes', singRIGHT, 'angle') + 0.1)
        end
        -- notes
		for notes = 0, getProperty('notes.length') - 1 do
            if getPropertyFromGroup('notes', notes, 'multSpeed') <= 9 then
                setPropertyFromGroup('notes', notes, 'multSpeed', getPropertyFromGroup('notes', notes, 'multSpeed') + 0.1)
            end
		end
        -- sound.music.time
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('flixel.FlxG', 'sound.music.time') - 10)
        -- bpm
		setPropertyFromClass('Conductor', 'bpm', getPropertyFromClass('Conductor', 'bpm') + 1)
        -- frame rate
		setPropertyFromClass('flixel.FlxG', 'drawFramerate', getPropertyFromClass('flixel.FlxG', 'drawFramerate') + 1)
        -- dad
        setProperty('dad.x', getProperty('dad.x') + 10)
		setProperty('dad.scale.x', getProperty('dad.scale.x') + 0.1)
    end
    if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
		setProperty('camGame.angle', -1)
		setProperty('camHUD.angle', -1)
    elseif getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
		setProperty('camGame.angle', 1)
		setProperty('camHUD.angle', 1)
    elseif getProperty('boyfriend.animation.curAnim.name') == 'singLEFTmiss' then
		setProperty('camGame.angle', 1)
		setProperty('camHUD.angle', 1)
    elseif getProperty('boyfriend.animation.curAnim.name') == 'singRIGHTmiss' then
		setProperty('camGame.angle', -1)
		setProperty('camHUD.angle', -1)
    end
    if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
		setProperty('camGame.angle', -1)
		setProperty('camHUD.angle', -1)
    elseif getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
		setProperty('camGame.angle', 1)
		setProperty('camHUD.angle', 1)
    end
    -- strumLineNotes
    for singLEFT = 4,4 do
        if getPropertyFromGroup('strumLineNotes', singLEFT, 'alpha') < 1 then
            setPropertyFromGroup('strumLineNotes', singLEFT, 'alpha', getPropertyFromGroup('strumLineNotes', singLEFT, 'alpha') + 0.03)
        end
        if getPropertyFromGroup('strumLineNotes', singLEFT, 'scale.x') <= 0.7 then
            setPropertyFromGroup('strumLineNotes', singLEFT, 'scale.x', getPropertyFromGroup('strumLineNotes', singLEFT, 'scale.x') + 0.001)
            setPropertyFromGroup('unspawnNotes', singLEFT, 'scale.x', getPropertyFromGroup('unspawnNotes', singLEFT, 'scale.x') + 0.001)
        elseif getPropertyFromGroup('strumLineNotes', singLEFT, 'scale.x') >= 0.7 then
            setPropertyFromGroup('strumLineNotes', singLEFT, 'scale.x', getPropertyFromGroup('strumLineNotes', singLEFT, 'scale.x') - 0.001)
            setPropertyFromGroup('unspawnNotes', singLEFT, 'scale.x', getPropertyFromGroup('unspawnNotes', singLEFT, 'scale.x') - 0.001)
        end
        if getPropertyFromGroup('strumLineNotes', singLEFT, 'angle') <= 0 then
            setPropertyFromGroup('strumLineNotes', singLEFT, 'angle', getPropertyFromGroup('strumLineNotes', singLEFT, 'angle') + 0.01)
        elseif getPropertyFromGroup('strumLineNotes', singLEFT, 'angle') >= 0 then
            setPropertyFromGroup('strumLineNotes', singLEFT, 'angle', getPropertyFromGroup('strumLineNotes', singLEFT, 'angle') - 0.01)
        end
    end
    for singDOWN = 5,5 do
        if getPropertyFromGroup('strumLineNotes', singDOWN, 'alpha') < 1 then
            setPropertyFromGroup('strumLineNotes', singDOWN, 'alpha', getPropertyFromGroup('strumLineNotes', singDOWN, 'alpha') + 0.03)
        end
        if getPropertyFromGroup('strumLineNotes', singDOWN, 'scale.y') <= 0.7 then
            setPropertyFromGroup('strumLineNotes', singDOWN, 'scale.y', getPropertyFromGroup('strumLineNotes', singDOWN, 'scale.y') + 0.001)
            setPropertyFromGroup('unspawnNotes', singDOWN, 'scale.y', getPropertyFromGroup('unspawnNotes', singDOWN, 'scale.y') + 0.001)
        elseif getPropertyFromGroup('strumLineNotes', singDOWN, 'scale.y') >= 0.7 then
            setPropertyFromGroup('strumLineNotes', singDOWN, 'scale.y', getPropertyFromGroup('strumLineNotes', singDOWN, 'scale.y') - 0.001)
            setPropertyFromGroup('unspawnNotes', singDOWN, 'scale.y', getPropertyFromGroup('unspawnNotes', singDOWN, 'scale.y') - 0.001)
        end
        if getPropertyFromGroup('strumLineNotes', singDOWN, 'angle') <= 0 then
            setPropertyFromGroup('strumLineNotes', singDOWN, 'angle', getPropertyFromGroup('strumLineNotes', singDOWN, 'angle') + 0.01)
        elseif getPropertyFromGroup('strumLineNotes', singDOWN, 'angle') >= 0 then
            setPropertyFromGroup('strumLineNotes', singDOWN, 'angle', getPropertyFromGroup('strumLineNotes', singDOWN, 'angle') - 0.01)
        end
    end
    for singUP = 6,6 do
        if getPropertyFromGroup('strumLineNotes', singUP, 'alpha') < 1 then
            setPropertyFromGroup('strumLineNotes', singUP, 'alpha', getPropertyFromGroup('strumLineNotes', singUP, 'alpha') + 0.03)
        end
        if getPropertyFromGroup('strumLineNotes', singUP, 'scale.y') <= 0.7 then
            setPropertyFromGroup('strumLineNotes', singUP, 'scale.y', getPropertyFromGroup('strumLineNotes', singUP, 'scale.y') + 0.001)
            setPropertyFromGroup('unspawnNotes', singUP, 'scale.y', getPropertyFromGroup('unspawnNotes', singUP, 'scale.y') + 0.001)
        elseif getPropertyFromGroup('strumLineNotes', singUP, 'scale.y') >= 0.7 then
            setPropertyFromGroup('strumLineNotes', singUP, 'scale.y', getPropertyFromGroup('strumLineNotes', singUP, 'scale.y') - 0.001)
            setPropertyFromGroup('unspawnNotes', singUP, 'scale.y', getPropertyFromGroup('unspawnNotes', singUP, 'scale.y') - 0.001)
        end
        if getPropertyFromGroup('strumLineNotes', singUP, 'angle') <= 0 then
            setPropertyFromGroup('strumLineNotes', singUP, 'angle', getPropertyFromGroup('strumLineNotes', singUP, 'angle') + 0.01)
        elseif getPropertyFromGroup('strumLineNotes', singUP, 'angle') >= 0 then
            setPropertyFromGroup('strumLineNotes', singUP, 'angle', getPropertyFromGroup('strumLineNotes', singUP, 'angle') - 0.01)
        end
    end
    for singRIGHT = 7,7 do
        if getPropertyFromGroup('strumLineNotes', singRIGHT, 'alpha') < 1 then
            setPropertyFromGroup('strumLineNotes', singRIGHT, 'alpha', getPropertyFromGroup('strumLineNotes', singRIGHT, 'alpha') + 0.03)
        end
        if getPropertyFromGroup('strumLineNotes', singRIGHT, 'scale.x') <= 0.7 then
            setPropertyFromGroup('strumLineNotes', singRIGHT, 'scale.x', getPropertyFromGroup('strumLineNotes', singRIGHT, 'scale.x') + 0.001)
            setPropertyFromGroup('unspawnNotes', singRIGHT, 'scale.x', getPropertyFromGroup('unspawnNotes', singRIGHT, 'scale.x') + 0.001)
        elseif getPropertyFromGroup('strumLineNotes', singRIGHT, 'scale.x') >= 0.7 then
            setPropertyFromGroup('strumLineNotes', singRIGHT, 'scale.x', getPropertyFromGroup('strumLineNotes', singRIGHT, 'scale.x') - 0.001)
            setPropertyFromGroup('unspawnNotes', singRIGHT, 'scale.x', getPropertyFromGroup('unspawnNotes', singRIGHT, 'scale.x') - 0.001)
        end
        if getPropertyFromGroup('strumLineNotes', singRIGHT, 'angle') <= 0 then
            setPropertyFromGroup('strumLineNotes', singRIGHT, 'angle', getPropertyFromGroup('strumLineNotes', singRIGHT, 'angle') + 0.01)
        elseif getPropertyFromGroup('strumLineNotes', singRIGHT, 'angle') >= 0 then
            setPropertyFromGroup('strumLineNotes', singRIGHT, 'angle', getPropertyFromGroup('strumLineNotes', singRIGHT, 'angle') - 0.01)
        end
    end
    -- downScroll
    if not downScroll then
        -- playerStrums
		for playerStrums = 0,3 do
            setPropertyFromGroup('playerStrums', playerStrums, 'downScroll', false)
            setPropertyFromGroup('playerStrums', playerStrums, 'y', 46)
		end
        -- time
        setProperty('timeBar.y', 28)
        setProperty('timeBarBG.y', 28)
        setProperty('timeTxt.y', 16)
        -- botplay
        setProperty('botplayTxt.y', 78)
        -- healthBar
        setProperty('healthBar.y', 646)
        setProperty('healthBarBG.y', 646)
        -- score
        setProperty('scoreTxt.y', 678)
        -- misc
        setProperty('misc.y', 0)
    else
        -- playerStrums
		for playerStrums = 0,3 do
            setPropertyFromGroup('playerStrums', playerStrums, 'downScroll', true)
            setPropertyFromGroup('playerStrums', playerStrums, 'y', 560)
		end
        -- time
        setProperty('timeBar.y', 678)
        setProperty('timeBarBG.y', 678)
        setProperty('timeTxt.y', 666)
        -- botplay
        setProperty('botplayTxt.y', 592)
        -- healthBar
        setProperty('healthBar.y', 64)
        setProperty('healthBarBG.y', 64)
        -- score
        setProperty('scoreTxt.y', 17)
        -- misc
        setProperty('misc.y', 650)
    end
    -- misc
    if getPropertyFromGroup('notes', notes, 'multSpeed') == 'multSpeed' then
        setTextString('misc', 'BPM: '..getPropertyFromClass('Conductor', 'bpm')..'\nNotes Speed: ?\nFrame Rate: '..getPropertyFromClass('flixel.FlxG', 'drawFramerate'))
    else
        setTextString('misc', 'BPM: '..getPropertyFromClass('Conductor', 'bpm')..'\nNotes Speed: '..getPropertyFromGroup('notes', notes, 'multSpeed')..'\nFrame Rate: '..getPropertyFromClass('flixel.FlxG', 'drawFramerate'))
    end
end
function onBeatHit()
    if curBeat % 4 == 0 then
        -- timeBar
        setProperty('timeBar.scale.x', getProperty('timeBar.scale.x') - 1)
        setProperty('timeBarBG.scale.x', getProperty('timeBarBG.scale.x') - 1)
        -- playerStrums
        setPropertyFromGroup('playerStrums', 0, 'x', getPropertyFromGroup('playerStrums', 0, 'x') - 100)
        setPropertyFromGroup('playerStrums', 1, 'x', getPropertyFromGroup('playerStrums', 1, 'x') - 50)
        setPropertyFromGroup('playerStrums', 2, 'x', getPropertyFromGroup('playerStrums', 2, 'x') + 50)
        setPropertyFromGroup('playerStrums', 3, 'x', getPropertyFromGroup('playerStrums', 3, 'x') + 100)
        -- healthBar
        setProperty('healthBar.scale.x', getProperty('healthBar.scale.x') + 1)
        setProperty('healthBarBG.scale.x', getProperty('healthBarBG.scale.x') + 1)
        -- downScroll
        if not downScroll then
            downScroll = true
            playSound('scrollMenu')
        else
            downScroll = false
            playSound('scrollMenu')
        end
    end
end
function onDestroy()
    -- mouse
    setPropertyFromClass('flixel.FlxG', 'mouse.visible', true)
    -- frame rate
	setPropertyFromClass('Main', 'fpsVar.visible', true)
	setPropertyFromClass('flixel.FlxG', 'drawFramerate', 60)
end