
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


