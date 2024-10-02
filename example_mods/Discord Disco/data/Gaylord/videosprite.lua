function onStepHit()
	if curStep == 1742 then
	    makeVideoSprite("myCutscene", "gaylordDialogue", 0, 0, "game", false) -- Tag, Path, X, Y, Default Camera, Loop

	    setObjectCamera("myCutscene", "other") -- Changing Camera
	
	    scaleObject("myCutscene", 1, 1) -- Changing Scale
	
	    setProperty("myCutscene.alpha", 1) -- Changing Properties
	end
end