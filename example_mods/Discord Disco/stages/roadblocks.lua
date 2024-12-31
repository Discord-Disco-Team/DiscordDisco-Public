function onCreate()
	-- background shit
	
	makeLuaSprite('roadblocks', 'roadblocks', -425, -350);
	setLuaSpriteScrollFactor('roadblocks', 1.0, 1.0);
	scaleObject('roadblocks', 2.9, 2.9);


	
	addLuaSprite('roadblocks', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end