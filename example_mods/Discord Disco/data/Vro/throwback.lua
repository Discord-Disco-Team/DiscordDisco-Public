    local shadersEnabled = true
function onCreatePost()
	initLuaShader("vhs")
	makeLuaSprite("vhs")
	makeGraphic("vhs", screenWidth, screenHeight)
	setSpriteShader("vhs", "vhs")

	addHaxeLibrary("ShaderFilter", "openfl.filters")
	runHaxeCode([[
		game.camGame.setFilters([new ShaderFilter(game.getLuaObject("vhs").shader)/*, new ShaderFilter(game.getLuaObject("vhs").shader)*/]);
		game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("vhs").shader)]);
	]])
end

function onUpdate(elapsed)
    setShaderFloat("vhs", "iTime", os.clock())
end