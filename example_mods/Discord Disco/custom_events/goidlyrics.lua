function onEvent(name, value1, value2)
    local var string = (value1)
    local var length = tonumber(0 + value2)
    if name == "goidlyrics" then

        makeLuaText('captions', 'Lyrics go here', 1000, 150, 500)
        setTextString('captions',  '' .. string)
        setTextFont('captions', 'vcr.ttf')
        setTextColor('captions', '0x485E85')
        setTextSize('captions', 30);
        addLuaText('captions')
        setObjectCamera('captions', 'other');
        setTextAlignment('captions', 'center')
        runTimer('lyricalTho', length, 1)
        --removeLuaText('captions', true)
	   makeLuaSprite('image', 'Goid', 600, 375, 500);
	   addLuaSprite('image', true);
	   setObjectCamera('image', 'other');
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'lyricalTho' then
        removeLuaText('captions', true)
        removeLuaSprite('image', true);
    end
end
