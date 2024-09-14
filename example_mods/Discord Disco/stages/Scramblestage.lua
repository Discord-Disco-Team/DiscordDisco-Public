function onCreate()
	-- background shit
	
	makeLuaSprite('Scimblstage', 'Scimblstage', -500, -1250);
	setLuaSpriteScrollFactor('Scimblstage', 1.0, 1.0);
	scaleObject('Scimblstage', 5, 5);


	
	addLuaSprite('Scimblstage', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end