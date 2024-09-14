function onCreate()
	-- background shit
	
	makeLuaSprite('neonsunset', 'neonsunset', -500, -200);
	setLuaSpriteScrollFactor('neonsunset', 1.0, 1.0);
	scaleObject('neonsunset', 1.2, 1.2);


	
	addLuaSprite('neonsunset', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end