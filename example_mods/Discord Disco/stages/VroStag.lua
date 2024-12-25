function onCreatePost()

        makeLuaSprite("sky", "VroYo/Sky", -370, -120)
		scaleObject("sky", 2.5, 2.5)
		setScrollFactor("sky", 0.2, 0.2)

        makeLuaSprite("bars", "VroYo/Bars", 300, 20)
		scaleObject("bars", 1, 1)
		setScrollFactor("bars", 0.8, 0.8)

        makeLuaSprite("stage", "VroYo/Stage", -80, -320)
		scaleObject("stage", 1.5, 1.5)
		setScrollFactor("stage", 1, 1)
        
        makeLuaSprite("black", "VroYo/Black", -380, -320)
		scaleObject("black", 1.5, 1.5)
		setScrollFactor("black", 0, 0)
        setProperty("black.alpha", 1)

        makeAnimatedLuaSprite("fire", "VroYo/Fire", 0, -270)
        addAnimationByPrefix("fire", "burn", "f96dfb9f9d4e0b42af3888de8b9473a7", 24, true)
		scaleObject("fire", 5, 5)
		setScrollFactor("fire", 0.8, 0.8)
        setProperty("fire.alpha", 0)

        addLuaSprite("sky", false)
        addLuaSprite("fire", false)
        addLuaSprite("bars", false)
        addLuaSprite("stage", false)
        addLuaSprite("black", true)
end

function onBeatHit()
    playAnim("fire", "burn")
end

function onStepHit()
	if curStep == 160 then
	doTweenAlpha('tweenblack', 'black', 0.2, 3)
	doTweenAlpha('tweenfire', 'fire', 0.2, 35)
end
	if curStep == 1200 then
	doTweenAlpha('tweenfire', 'fire', 0.5, 0)
end
end