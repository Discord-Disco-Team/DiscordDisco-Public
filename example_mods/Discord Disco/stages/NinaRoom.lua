function onCreate()
	-- background shit
	
	makeLuaSprite('Back', 'NinaStuff/Back', -500, -200);
	setLuaSpriteScrollFactor('Back', 1.05, 1);
	scaleObject('Back', 1.1, 1.1);
	makeLuaSprite('Main', 'NinaStuff/Main', -500, -200);
	setLuaSpriteScrollFactor('Main', 1, 1);
	scaleObject('Main', 1.1, 1.1);
	makeLuaSprite('Scrimblo', 'NinaStuff/Scrimblo', -500, -200);
	setLuaSpriteScrollFactor('Scrimblo', 1, 1);
	scaleObject('Scrimblo', 1.1, 1.1);

	addLuaSprite('Back', false);
	addLuaSprite('Main', false);
end

function onStepHit()
	if curStep == 1375 then
		addLuaSprite('Scrimblo', false)
end
end