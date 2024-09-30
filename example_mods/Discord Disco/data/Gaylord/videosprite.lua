function onStepHit()
	if curStep == 1742 then
	    makeVideoSprite("myCutscene", "gaylordDialogue", -700, -1000, "game", false) -- Tag, Path, X, Y, Default Camera, Loop

	    setObjectCamera("myCutscene", "other") -- Changing Camera
	
	    scaleObject("myCutscene", 0.666, 0.666) -- Changing Scale
	
	    setProperty("myCutscene.alpha", 1) -- Changing Properties
	end
end