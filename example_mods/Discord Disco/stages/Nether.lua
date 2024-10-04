function onCreate()
	-- background shit
	
	makeLuaSprite('Cave', 'Minecraft/Nether', -800, -375);
	setLuaSpriteScrollFactor('Cave', 1, 1);
	scaleObject('Cave', 1.8, 1.8);

	makeLuaSprite('ShadowIron', 'Minecraft/Shadow', 10, 610);
	setLuaSpriteScrollFactor('ShadowIron', 1, 1);
	scaleObject('ShadowIron', 0.8, 0.5);

	makeLuaSprite('ShadowGF', 'Minecraft/Shadow', 500, 650);
	setLuaSpriteScrollFactor('ShadowGF', 1, 1);
	scaleObject('ShadowGF', 0.7, 0.4);

	makeLuaSprite('ShadowBF', 'Minecraft/Shadow', 910, 650);
	setLuaSpriteScrollFactor('ShadowBF', 1, 1);
	scaleObject('ShadowBF', 0.8, 0.5);

	makeLuaSprite('Over', 'Minecraft/Overlay', -800, -375);
	setLuaSpriteScrollFactor('Over', 1, 1);
	scaleObject('Over', 2, 2);


	addLuaSprite('Cave', false);
	addLuaSprite('ShadowIron', false);
	addLuaSprite('ShadowGF', false);
	addLuaSprite('ShadowBF', false);
	addLuaSprite('Over', true);

end