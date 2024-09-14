function onCreatePost()
runHaxeCode([[
	game.introSoundsSuffix = "-mspaint"; //Change this
	
	//Example images: mods/images/go-custom.png
	//Example sounds: mods/sounds/intro2-custom.ogg
]])

end

function onCountdownTick(a)
runHaxeCode([[
	var t = ]]..a..[[;
	
	var p = game.introSoundsSuffix ;
	var assetNames = [
		'ready'+p, 
		'set'+p, 
		'go'+p
	];	
	
	if(game.countdownReady!=null && t<2){
		game.countdownReady.loadGraphic(Paths.image(assetNames[0]));
		game.countdownReady.updateHitbox();
	}
	if(game.countdownSet!=null && t<3){
		game.countdownSet.loadGraphic(Paths.image(assetNames[1]));
		game.countdownSet.updateHitbox();
	}
	if(game.countdownGo!=null && t<4){
		game.countdownGo.loadGraphic(Paths.image(assetNames[2]));
		game.countdownGo.updateHitbox();
	}
]])

end

function onCreatePost()
    setTimeBarColors('44d844', '2e412e');
end

function onCreate()
makeLuaSprite('', 'Black', -130, -1005)
addLuaSprite('', false)
setObjectCamera('', 'camHud')
scaleObject('', 0.1, 1)
setScrollFactor('', 1, 1)

makeLuaSprite('Black1', 'Black', 1120, -285)
addLuaSprite('Black1', false)
setObjectCamera('Black1', 'camHud')
scaleObject('Black1', 0.1, 1)
setScrollFactor('Black1', 1, 1)
end

function onUpdate()
noteTweenX('Note0', 0,185,0.1, true)
noteTweenX('Note1', 1,295,0.1, true)
noteTweenX('Note2', 2,405,0.1, true)
noteTweenX('Note3', 3,515,0.1, true)
noteTweenX('Note4', 4,675,0.1, true)
noteTweenX('Note5', 5,785,0.1, true)
noteTweenX('Note6', 6,895,0.1, true)
noteTweenX('Note7', 7,1005,0.1, true)
end

function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    local random = math.random (3)
    if random == 1 then
        playSound("RuinMiss1", 1, "miss1") -- change the decimal number to change the volume
    elseif random == 2 then
        playSound("RuinMiss2", 1, "miss2")
    elseif random == 3 then
        playSound("RuinMiss3", 1, "miss3")
    end
end