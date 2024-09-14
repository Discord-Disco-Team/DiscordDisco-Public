function onEvent(name, value1, value2)
    local var string = (value1)
    local var length = tonumber(0 + value2)
    if name == "gaylyrics" then

        makeLuaText('captions', 'Lyrics go here', 1000, 150, 500)
        setTextString('captions',  '' .. string)
        setTextFont('captions', 'Times New Roman.ttf')
        setTextColor('captions', '0xe660e6')
        setTextSize('captions', 30);
        addLuaText('captions')
        setObjectCamera('captions', 'other');
        setTextAlignment('captions', 'center')
        runTimer('lyricalTho', length, 1)
        --removeLuaText('captions', true)
	   makeLuaSprite('image', 'gay', 600, 375, 500);
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
