function onCreate()
	-- background shit
	
	makeLuaSprite('ironscave', 'ironscave', -500, -200);
	setLuaSpriteScrollFactor('ironscave', 1.0, 1.0);
	scaleObject('ironscave', 1.2, 1.2);


	
	addLuaSprite('ironscave', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end