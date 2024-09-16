function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'black', 0, 0);
	setScrollFactor('stageback', 0.84, 0.87);
	scaleObject('stageback', 10, 10)
	
	makeLuaSprite('stageback2', 'voiceoverlay', -60, -40);
	setScrollFactor('stageback2', 0, 0);
	scaleObject('stageback2', 0.87, 0.8);

    addLuaSprite('stageback', false)
    addLuaSprite('stagefront', false);
    addLuaSprite('stageback3', true)
    addLuaSprite('stageback2', true)
	
	end

    function onEvent(name,value1,value2)
    	if name == 'Play Animation' then
    		if value2 == 0 then

    	setProperty('stageback.visible', true)
    	setProperty('stagefront.visible', true)
    	setProperty('stageback2.visible', true)	
    	setProperty('stageback3.visible', false)
    end
    
    	    if value2 == 1 then

        setProperty('stageback.visible', true)
    	setProperty('stagefront.visible', true)
    	setProperty('stageback2.visible', false)	
    	setProperty('stageback3.visible', true)
    end
    end
    end	    		