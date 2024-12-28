function onCreate()
	-- background shit
	
	makeLuaSprite('kapland', 'kapysuchy/kapland', -900, 75);
	setLuaSpriteScrollFactor('kapland', 1.0, 1.0);
	scaleObject('kapland', 2, 2);
        
	addLuaSprite('kapland', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end