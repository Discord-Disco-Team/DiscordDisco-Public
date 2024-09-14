function onCreatePost()

        makeLuaSprite("midbg", "midbg", -1150, -550)
	scaleObject("midbg", 3.5, 3.5)
	setScrollFactor("midbg", 1.1, 1.1)

        makeLuaSprite("memberlist", "memberlist", 3170, -100)
	scaleObject("memberlist", 2.9, 2.9)
	setScrollFactor("memberlist",1.1, 1.1)

        makeLuaSprite("sidebar", "sidebar", -320, -650)
	scaleObject("sidebar", 2.9, 2.9)
	setScrollFactor("sidebar",1.1, 1.1)

        makeLuaSprite("midplatform2", "midplatform2", 550, 950)
	scaleObject("midplatform2", 2.5, 2.5)
	setScrollFactor("midplatform2", 1, 1)

        makeLuaSprite("midplatform1", "midplatform1", 2100, 950)
	scaleObject("midplatform1", 2.5, 2.5)
	setScrollFactor("midplatform1",1, 1)

        addLuaSprite("midbg", false)
        addLuaSprite("sidebar", false)
        addLuaSprite("memberlist", false)
        addLuaSprite("midplatform1", false)
        addLuaSprite("midplatform2", false)
end
