function onCreatePost()

        makeLuaSprite("sky", "GenericStage/sky", -2370, -1620)
		scaleObject("sky", 3.2, 3.2)
		setScrollFactor("sky", 0, 0)

        makeLuaSprite("stars", "GenericStage/stars", -1280, -520)
		scaleObject("stars", 2, 2)
		setScrollFactor("stars", 0.2, 0.2)

        makeLuaSprite("stage", "GenericStage/stage", -780, -410)
		scaleObject("stage", 2.6, 2.6)
		setScrollFactor("stage", 1, 1)

        addLuaSprite("sky", false)
        addLuaSprite("stars", false)
        addLuaSprite("stage", false)

end
