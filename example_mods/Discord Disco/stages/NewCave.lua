function onCreate()
	-- background shit
	
	makeLuaSprite('Sunset', 'Minecraft/Sunset', -200, -400);
	setLuaSpriteScrollFactor('Sunset', 1.1, 1);
	scaleObject('Sunset', 2, 2);
	makeLuaSprite('Cave', 'Minecraft/Foreground', -800, -375);
	setLuaSpriteScrollFactor('Cave', 1, 1);
	scaleObject('Cave', 3, 3);

	makeLuaSprite('ShadowIron', 'Minecraft/Shadow', 10, 610);
	setLuaSpriteScrollFactor('ShadowIron', 1, 1);
	scaleObject('ShadowIron', 0.8, 0.5);

	makeLuaSprite('ShadowGF', 'Minecraft/Shadow', 500, 650);
	setLuaSpriteScrollFactor('ShadowGF', 1, 1);
	scaleObject('ShadowGF', 0.7, 0.4);

	makeLuaSprite('ShadowBF', 'Minecraft/Shadow', 910, 650);
	setLuaSpriteScrollFactor('ShadowBF', 1, 1);
	scaleObject('ShadowBF', 0.8, 0.5);



	addLuaSprite('Sunset', false);
	addLuaSprite('Cave', false);
	addLuaSprite('ShadowIron', false);
	addLuaSprite('ShadowGF', false);
	addLuaSprite('ShadowBF', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end