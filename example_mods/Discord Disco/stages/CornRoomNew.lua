function onCreate()
	-- background shit
	
	makeLuaSprite('outside', 'ChrisStuff/outsideSunset', -500, -310);
	setLuaSpriteScrollFactor('outside', 1.08, 1.0);
	scaleObject('outside', 1.1, 1.1);
	makeLuaSprite('Room', 'ChrisStuff/Room', -500, -310);
	setLuaSpriteScrollFactor('Room', 1, 1);
	scaleObject('Room', 1.1, 1.1);
	makeLuaSprite('Chair', 'ChrisStuff/Chair', -1750, -100);
	setLuaSpriteScrollFactor('Chair', 1.0, 1.0);
	scaleObject('Chair', 1, 1);
	
	addLuaSprite('outside', false);
	addLuaSprite('Room', false);
	addLuaSprite('Chair', true);

if songName == "Cracker" then	
	makeLuaSprite('outside', 'ChrisStuff/outsideCracker', -500, -310);
	setLuaSpriteScrollFactor('outside', 1.08, 1.0);
	scaleObject('outside', 1.1, 1.1);
	makeLuaSprite('Room', 'ChrisStuff/Room', -500, -310);
	setLuaSpriteScrollFactor('Room', 1, 1);
	scaleObject('Room', 1.1, 1.1);
	makeLuaSprite('Chair', 'ChrisStuff/Chair', -1750, -100);
	setLuaSpriteScrollFactor('Chair', 1.0, 1.0);
	scaleObject('Chair', 1, 1);
	
	addLuaSprite('outside', false);
	addLuaSprite('Room', false);
	addLuaSprite('Chair', true);
end

if songName == "Gaylord" then	
		makeLuaSprite('outside', 'ChrisStuff/outsideGaylord', -500, -310);
		setLuaSpriteScrollFactor('outside', 1.08, 1.0);
		scaleObject('outside', 1.1, 1.1);
		makeLuaSprite('Room', 'ChrisStuff/GaylordRoom', -500, -310);
		setLuaSpriteScrollFactor('Room', 1, 1);
		scaleObject('Room', 1.1, 1.1);
	
		addLuaSprite('outside', false);
		addLuaSprite('Room', false);

end

function onStepHit()
	if songName == "Gaylord" then
		if curStep == 1 then
			doTweenX('tweenChair', 'Chair', -3500, 0.5, 'linear');
	if curStep == 688 then
		makeLuaSprite('Overlay', 'ChrisStuff/GayOverlay', -500, -310);
		setLuaSpriteScrollFactor('Overlay', 1.0, 1.0);
		scaleObject('Overlay', 1.1, 1.1);

		addLuaSprite('Overlay', true);	

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end
end
end
end
end