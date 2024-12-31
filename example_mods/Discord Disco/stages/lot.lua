function onCreate()
	-- background shit
	
	makeLuaSprite('lot', 'lot', -500, -250);
	setLuaSpriteScrollFactor('lot', 1.0, 1.0);
	scaleObject('lot', 1.2, 1.2);


	
	addLuaSprite('lot', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end