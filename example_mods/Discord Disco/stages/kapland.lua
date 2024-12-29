function onCreate()
	-- background shit
	
	makeLuaSprite('kapland', 'kapysuchy/kapland', -900, 75);
	setLuaSpriteScrollFactor('kapland', 1.0, 1.0);
	scaleObject('kapland', 2, 2);
        
	makeLuaSprite('Blue', 'kapysuchy/kap9', -9000, -9000);
	setLuaSpriteScrollFactor('Blue', 1.0, 1.0);
	scaleObject('Blue', 99, 99);

	makeLuaSprite('Frame1', 'kapysuchy/kap1', -900, 75);
	setLuaSpriteScrollFactor('Frame1', 1.0, 1.0);
	screenCenter('Frame1')
        setProperty("Frame1.alpha", 0)
	makeLuaSprite('Frame2', 'kapysuchy/kap2', -900, 75);
	setLuaSpriteScrollFactor('Frame2', 1.0, 1.0);
	screenCenter('Frame2')
        setProperty("Frame2.alpha", 0)
	makeLuaSprite('Frame3', 'kapysuchy/kap3', -900, 75);
	setLuaSpriteScrollFactor('Frame3', 1.0, 1.0);
	screenCenter('Frame3')
        setProperty("Frame3.alpha", 0)
	makeLuaSprite('Frame4', 'kapysuchy/kap4', -900, 75);
	setLuaSpriteScrollFactor('Frame4', 1.0, 1.0);
	screenCenter('Frame4')
        setProperty("Frame4.alpha", 0)
	makeLuaSprite('Frame5', 'kapysuchy/kap5', -900, 75);
	setLuaSpriteScrollFactor('Frame5', 1.0, 1.0);
	screenCenter('Frame5')
        setProperty("Frame5.alpha", 0)
	makeLuaSprite('Frame6', 'kapysuchy/kap6', -900, 75);
	setLuaSpriteScrollFactor('Frame6', 1.0, 1.0);
	screenCenter('Frame6')
        setProperty("Frame6.alpha", 0)
	makeLuaSprite('Frame7', 'kapysuchy/kap7', -900, 75);
	setLuaSpriteScrollFactor('Frame7', 1.0, 1.0);
	screenCenter('Frame7')
        setProperty("Frame7.alpha", 0)
	makeLuaSprite('Frame8', 'kapysuchy/kap8', -900, 75);
	setLuaSpriteScrollFactor('Frame8', 1.0, 1.0);
	screenCenter('Frame8')
        setProperty("Frame8.alpha", 0)

	makeLuaSprite('Black', 'kapysuchy/Black', -900, 75);
	setLuaSpriteScrollFactor('Black', 1.0, 1.0);
	scaleObject('Blue', 99, 99);
	screenCenter('Black')
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
	if curStep == 256 then
	setProperty("Blue.alpha", 0)
	end

	if curStep == 1548 then
	setProperty("Black.alpha", 1)
	end
end