function onCreatePost()

        makeLuaSprite("sky", "GenericStage/sky", -2370, -1620)
		scaleObject("sky", 3.2, 3.2)
		setScrollFactor("sky", 0, 0)

        makeLuaSprite("stars", "GenericStage/stars", -1280, -520)
		scaleObject("stars", 2, 2)
		setScrollFactor("stars", 0.2, 0.2)

        makeLuaSprite("stage", "GenericStage/stage", -780, -520)
		scaleObject("stage", 2.6, 2.6)
		setScrollFactor("stage", 1, 1)
        
        makeAnimatedLuaSprite('back', 'GenericStage/back', -740, -460)
		addAnimationByPrefix('back', 'back', 'back', 24 , true)
		scaleObject("back", 2.5, 2.5)
		setScrollFactor("back", 1, 1)

        makeAnimatedLuaSprite('front', 'GenericStage/front', -740, -490)
		addAnimationByPrefix('front', 'idle', 'front', 24 , true)
		scaleObject("front", 2.5, 2.5)
		setScrollFactor("front", 1, 1)

        addLuaSprite("sky", false)
        addLuaSprite("stars", false)
        addLuaSprite("back", false)
        addLuaSprite("stage", false)
        addLuaSprite("front", true)

end

function onBeatHti()
	playAnim('back', 'back', true)
	playAnim('front', 'front', true)
end
