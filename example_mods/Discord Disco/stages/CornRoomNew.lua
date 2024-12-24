function onCreate()
	-- background shit
	if songName == "Moderator" then
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
	end

	if songName == "Cracker" then	
		makeLuaSprite('outside', 'ChrisStuff/outsideCracker', -500, -310);
		setLuaSpriteScrollFactor('outside', 1.08, 1.0);
		scaleObject('outside', 1.1, 1.1);
		makeLuaSprite('Room', 'ChrisStuff/Room', -500, -310);
		setLuaSpriteScrollFactor('Room', 1, 1);
		scaleObject('Room', 1.1, 1.1);
		makeLuaSprite('Roomfuck', 'ChrisStuff/Roomfuck', -500, -310);
		setLuaSpriteScrollFactor('Roomfuck', 1, 1);
		scaleObject('Roomfuck', 1.1, 1.1);
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
			makeLuaSprite('Overlay', 'ChrisStuff/GayOverlay', -500, -310);
			setLuaSpriteScrollFactor('Overlay', 1.0, 1.0);
			scaleObject('Overlay', 1.1, 1.1);

			makeLuaSprite('Room1', 'ChrisStuff/GaytenseRoom', -500, -310);
			setLuaSpriteScrollFactor('Room1', 1, 1);
			scaleObject('Room1', 1.1, 1.1);
			makeLuaSprite('Tense', 'ChrisStuff/TenseOverlay', -500, -310);
			setLuaSpriteScrollFactor('Tense', 1, 1);
			scaleObject('Tense', 1.1, 1.1);

			makeAnimatedLuaSprite('blub', 'ChrisStuff/blubblub', -600, -250);
			addAnimationByPrefix('blub', 'blooble', 'blubblub', 12, true)
			setProperty('blub.antialiasing', false); 
			setScrollFactor('blub', 1, 1);
			scaleObject('blub', 1, 1);
			makeAnimatedLuaSprite('blub1', 'ChrisStuff/blubblub', 50, -195);
			addAnimationByPrefix('blub1', 'blooble', 'blubblub', 12, true)
			setProperty('blub1.antialiasing', false); 
			setScrollFactor('blub1', 1, 1);
			scaleObject('blub1', 1, 1);
			makeAnimatedLuaSprite('blub2', 'ChrisStuff/blubblub', 900, -240);
			addAnimationByPrefix('blub2', 'blooble', 'blubblub', 12, true)
			setProperty('blub2.antialiasing', false); 
			setScrollFactor('blub2', 1, 1);
			scaleObject('blub2', 1, 1);	

			addLuaSprite('outside', false);
			addLuaSprite('Room', false);

	end
	endLoop = false
end

function onStepHit()
	
		if endLoop == false and misses >= 10 then
			removeLuaSprite('Room', false);
			addLuaSprite('Roomfuck', false);
			endloop = true
		end

		if curStep == 688 then
			addLuaSprite('Overlay', true);	

		elseif curStep == 1199 then
			addLuaSprite('Room1', false);
			addLuaSprite('Tense', true);
			addLuaSprite('blub', true);
			addLuaSprite('blub1', true);
			addLuaSprite('blub2', true);

		end
end