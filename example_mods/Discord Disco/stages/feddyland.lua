function onCreate()
	-- background shit
	
	makeLuaSprite('feddyland', 'feddyland', -900, 75);
	setLuaSpriteScrollFactor('feddyland', 1.0, 1.0);
	scaleObject('feddyland', 2, 2);
        
        makeAnimatedLuaSprite('hungry', 'hungry', -250, 250)
	addAnimationByPrefix('hungry', 'dance', 'idle', 12 , true)
        objectPlayAnimation('hungry', 'dance', false)
        setScrollFactor('hungry', 0.9, 0.9);

	
	addLuaSprite('feddyland', false);
	addLuaSprite('hungry', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end