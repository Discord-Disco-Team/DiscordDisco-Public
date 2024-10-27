function onCreatePost()
	initLuaShader("retroVCR")
	makeLuaSprite("retroVCR")
	makeGraphic("retroVCR", screenWidth, screenHeight)
	setSpriteShader("retroVCR", "retroVCR")

	addHaxeLibrary("ShaderFilter", "openfl.filters")
	runHaxeCode([[
		game.camGame.setFilters([new ShaderFilter(game.getLuaObject("retroVCR").shader)/*, new ShaderFilter(game.getLuaObject("sampleVHS").shader)*/]);
		game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("retroVCR").shader)]);
	]])
end

function onUpdate(elapsed)
    setShaderFloat("retroVCR", "iTime", os.clock())
end