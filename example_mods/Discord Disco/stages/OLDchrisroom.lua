function onCreate()
	-- background shit
	
	makeLuaSprite('chrisroom', 'chrisroom', -350, -250);
	setLuaSpriteScrollFactor('chrisroom', 1.0, 1.0);
	scaleObject('chrisroom', 1.2, 1.2);


	
	addLuaSprite('chrisroom', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end