 function onCreate()
	--the stage--
	setProperty('gfGroup.visible', false);
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-alt');
	makeLuaSprite('bg', 'V/bonus/whitebg',-246, -181)
	makeLuaSprite('landscape', 'V/bonus/mountains', -120, -86)
	makeLuaSprite('ground', 'V/bonus/base', -220, 475)
	makeAnimatedLuaSprite('dahouse', 'V/bonus/house',382, -225)
	luaSpriteAddAnimationByPrefix('dahouse', 'smoke', 'housescaled', 24, true)
	setLuaSpriteScrollFactor('dahouse', 0.9, 0.9)
	setLuaSpriteScrollFactor('landscape', 0.5, 0.5)
	luaSpritePlayAnimation('dahouse', 'smoke', true);
	--the bg bros--
	makeAnimatedLuaSprite('yotsobaa', 'V/bonus/bg/yo', 282, 388);
		luaSpriteAddAnimationByPrefix('yotsobaa', 'aaaa', 'yotsuscaled' ,24,false)
	makeAnimatedLuaSprite('botbro', 'V/bonus/bg/r9k', -290, 0);
		luaSpriteAddAnimationByPrefix('botbro', 'ded', 'r9k' ,24,false)
	makeAnimatedLuaSprite('blackbro', 'V/bonus/bg/black', -150,-10);
		luaSpriteAddAnimationByPrefix('blackbro', 'ded', 'black' ,24,false)
		scaleLuaSprite('blackbro', 1.2, 1.2)
	makeAnimatedLuaSprite('smilebro', 'V/bonus/bg/smile', -190, 290);
		luaSpriteAddAnimationByPrefix('smilebro','ded', 'crawling' ,24,false)
	makeAnimatedLuaSprite('catbro', 'V/bonus/bg/cat', -200, -10);
		luaSpriteAddAnimationByPrefix('catbro','ded', 'runnigcat' ,24,false)
		scaleLuaSprite('catbro', 1.2, 1.2)
	addLuaSprite('bg', false)
	addLuaSprite('landscape', false)	
	addLuaSprite('dahouse', false)
	addLuaSprite('ground', false)
		--the layering--
	setObjectOrder('bg', 1)
	setObjectOrder('landscape', 2)
	setObjectOrder('dahouse', 4)
	setObjectOrder('ground', 5)
	setObjectOrder('dadGroup', 6)
	setObjectOrder('boyfriendGroup', 11)
	setObjectOrder('bffall', 13)
		--make the peeps dissapear--
		
end	
		
  		--the bg bros--
  beatHitFuncs = {
	[10] = function() 
	addLuaSprite('yotsobaa', false)
	setObjectOrder('yotsobaa', 3)
	end,
	[68] = function()
	addLuaSprite('botbro', false)
	setObjectOrder('botbro', 8)
	end,
	[150] = function()
	addLuaSprite('blackbro', false)
	setObjectOrder('blackbro', 7)
	end,
	[260] = function()
	addLuaSprite('smilebro', false)
	setObjectOrder('smilebro', 9)
	end,
	[352] = function()
	addLuaSprite('catbro', false)
	setObjectOrder('catbro', 10)
	end,
	[446] = function()
	addLuaSprite('AAAAAA', true)
	setProperty('dad.visible', false);
	end,
	[448] = function()
	removeLuaSprite('AAAAAA')
	setProperty('dad.visible', true);
	end
}
function onBeatHit()
	if beatHitFuncs[curBeat] then 
		beatHitFuncs[curBeat]()
	
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if curBeat > 445 and curBeat < 447 then
	triggerEvent('Screen Shake', '0.25, 0.05', '0.1, 0.01')
	end
end 
 -- this is fucking stupid idk why i added this--