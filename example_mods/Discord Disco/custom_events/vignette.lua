function onEvent(name, value1)
    local var length = tonumber(0 + value1)
    if name == "vignette" then

        runTimer('lyricalTho', length, 1)
	   makeLuaSprite('image', 'vignette', 0, 0, 0);
	   addLuaSprite('image', true);
	   setObjectCamera('image', 'other');
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'lyricalTho' then
        removeLuaSprite('image', true);
    end
end