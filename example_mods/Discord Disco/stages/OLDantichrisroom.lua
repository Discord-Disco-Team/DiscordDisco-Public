function onCreate()
	-- background shit
	
	makeLuaSprite('antichrisroom', 'antichrisroom', -350, -250);
	setLuaSpriteScrollFactor('antichrisroom', 1.0, 1.0);
	scaleObject('antichrisroom', 1.2, 1.2);


	
	addLuaSprite('antichrisroom', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end