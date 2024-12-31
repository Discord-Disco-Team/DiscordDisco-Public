function onCreate()
	-- background shit
	
	makeLuaSprite('kapland', 'kapysuchy/kapland', -900, 75);
	setLuaSpriteScrollFactor('kapland', 1.0, 1.0);
	scaleObject('kapland', 2, 2);
        
	makeLuaSprite('Blue', 'kapysuchy/kap9', -9000, -9000);
	setLuaSpriteScrollFactor('Blue', 1.0, 1.0);
	scaleObject('Blue', 99, 99);

	makeLuaSprite('Frame1', 'kapysuchy/kap1', -200, 500);
	setLuaSpriteScrollFactor('Frame1', 1.0, 1.0);
        setProperty("Frame1.alpha", 0)
	makeLuaSprite('Frame2', 'kapysuchy/kap2', -350, 450);
	setLuaSpriteScrollFactor('Frame2', 1.0, 1.0);
        setProperty("Frame2.alpha", 0)
	makeLuaSprite('Frame3', 'kapysuchy/kap3', -200, 550);
	setLuaSpriteScrollFactor('Frame3', 1.0, 1.0);
        setProperty("Frame3.alpha", 0)
	scaleObject('Frame3', 1.3, 1.3);
	makeLuaSprite('Frame4', 'kapysuchy/kap4', -200, 550);
	setLuaSpriteScrollFactor('Frame4', 1.0, 1.0);
        setProperty("Frame4.alpha", 0)
	makeLuaSprite('Frame5', 'kapysuchy/kap5', -200, 550);
	setLuaSpriteScrollFactor('Frame5', 1.0, 1.0);
        setProperty("Frame5.alpha", 0)
	makeLuaSprite('Frame6', 'kapysuchy/kap6', -200, 550);
	setLuaSpriteScrollFactor('Frame6', 1.0, 1.0);
        setProperty("Frame6.alpha", 0)
	makeLuaSprite('Frame7', 'kapysuchy/kap7', -200, 450);
	setLuaSpriteScrollFactor('Frame7', 1.0, 1.0);
        setProperty("Frame7.alpha", 0)
	makeLuaSprite('Frame8', 'kapysuchy/kap8', -200, 440);
	setLuaSpriteScrollFactor('Frame8', 1.0, 1.0);
        setProperty("Frame8.alpha", 0)

	makeLuaSprite('Black', 'kapysuchy/Black', -9000, -9000);
	setLuaSpriteScrollFactor('Black', 1.0, 1.0);
	scaleObject('Black', 999, 999);
        setProperty("Black.alpha", 0)

	addLuaSprite('kapland', false);
	addLuaSprite('Blue', true);
	addLuaSprite('Black', true);
	addLuaSprite('Frame1', true);
	addLuaSprite('Frame2', true);
	addLuaSprite('Frame3', true);
	addLuaSprite('Frame4', true);
	addLuaSprite('Frame5', true);
	addLuaSprite('Frame6', true);
	addLuaSprite('Frame7', true);
	addLuaSprite('Frame8', true);
end

function onStepHit()
	if curStep == 1 then
	setProperty("Frame1.alpha", 1)
	end
	if curStep == 30 then
	setProperty("Frame1.alpha", 0)
	setProperty("Frame2.alpha", 1)
	end
	if curStep == 60 then
	setProperty("Frame2.alpha", 0)
	setProperty("Frame3.alpha", 1)
	end
	if curStep == 90 then
	setProperty("Frame3.alpha", 0)
	setProperty("Frame4.alpha", 1)
	end
	if curStep == 120 then
	setProperty("Frame4.alpha", 0)
	setProperty("Frame5.alpha", 1)
	end
	if curStep == 150 then
	setProperty("Frame5.alpha", 0)
	setProperty("Frame6.alpha", 1)
	end
	if curStep == 180 then
	setProperty("Frame6.alpha", 0)
	setProperty("Frame7.alpha", 1)
	end
	if curStep == 210 then
	setProperty("Frame7.alpha", 0)
	setProperty("Frame8.alpha", 1)
	end
	if curStep == 240 then
	setProperty("Frame8.alpha", 0)
	doTweenAlpha('tweenBlue', 'Blue', 0, 1.3)
	end
	if curStep == 1548 then
	setProperty("Black.alpha", 1)
	end
end