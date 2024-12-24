function onCreate()
	-- background shit
	
	makeLuaSprite('BurgerKBack', 'BurgerKBack', 0, 0);
	setLuaSpriteScrollFactor('BurgerKBack', 1, 1);
	scaleObject('BurgerKBack', 1.7, 1.7);
	addLuaSprite('BurgerKBack', false);

	makeLuaSprite('BurgerKFront', 'BurgerKFront', 0, 0);
	setLuaSpriteScrollFactor('BurgerKFront', 1, 1);
	scaleObject('BurgerKFront', 1.7, 1.7);
	addLuaSprite('BurgerKFront', false);
	
end