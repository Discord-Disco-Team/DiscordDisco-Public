local pauseMusic = 'breakfast'
local txtFont = 'vcr.ttf'
local songEnd = 90
local splashText = {'wawawawawawawa', ':3333', 'Do you ever just', 'discord disco', 'Ronning rn', 'What are you doing Bob-san?', 'Dont stop gooning for me Luigi!', 'this is just splash text', 'Skibidi Dom Dom Yes Yes', '',};


function onCreate()
    precacheSound(pauseMusic)
    precacheSound('scrollMenu')
    precacheSound('clickText')

    makeLuaSprite('bgFade', nil, 0, 0)
    makeGraphic("bgFade", 1280, 720, '000000')
    setObjectCamera('bgFade', 'camOther')
    screenCenter('bgFade','xy')
    addLuaSprite('bgFade', true)
    setProperty('bgFade.alpha', 0)

    makeLuaText('splashTxt', 'where did the splash messages go?', 500, 725, -20)
    setTextFont('splashTxt', txtFont)
    setTextColor("splashTxt", "FFFFFF")
    setTextSize("splashTxt", 30)
    setTextAlignment("splashTxt", 'center')
    setObjectCamera("splashTxt", 'camOther')
    setProperty('splashTxt.alpha', 0)
    addLuaText('splashTxt')
end

option = {'Resume', 'Restart', 'Options', 'Exit'}

function onPause()
    openCustomSubstate('pauseState', true);
    return Function_Stop;
end
function onCustomSubstateCreate(name)
    if name == 'pauseState' then
        playSound(pauseMusic, 0, 'pauseSongTag')
        soundFadeIn('pauseSongTag', 15)
        runTimer('loopPauseTag', songEnd, 0)
    end
end
function onCustomSubstateSoundFinished(name)
    if name == 'pauseState' then
        playSound(pauseMusic, 1, 'pauseSongTag')
        runTimer('loopPauseTag', songEnd, 0)
    end
end
function onCustomSubstateUpdate(name)
    if keyJustPressed('back') then
        closePause()
    end
end


function onCustomSubstateCreatePost(name)
    if name == 'pauseState' then

    doTweenAlpha("bgalpha", "bgFade", 0.85, 0.4, 'linear')

    doTweenAlpha('splashTxtAlpha', 'splashTxt', 1, 0.5, 'linear')
    doTweenY("splashTxtMove", "splashTxt", 20, 0.5, 'sineOut')
    setTextString('splashTxt', splashText[getRandomInt(1, #splashText)])

    makeLuaText('resumeTxt', 'Continue Game', 0, 50, 365)
    setTextFont('resumeTxt', txtFont)
    setTextSize("resumeTxt", 40)
    setObjectCamera("resumeTxt", 'camOther')
    setProperty('resumeTxt.alpha', 0)
    addLuaText('resumeTxt')
    doTweenY('resumeTxtPause', 'resumeTxt', 415, 0.5, 'sineOut')
    doTweenAlpha('resumeTxtAlpha', 'resumeTxt', 1, 0.5, 'sineOut')

    makeLuaText('restartTxt', 'Restart Song', 0, 50, 440)
    setTextFont('restartTxt', txtFont)
    setTextSize("restartTxt", 40)
    setObjectCamera("restartTxt", 'camOther')
    setProperty('restartTxt.alpha', 0)
    addLuaText('restartTxt')
    doTweenY('restartTxtPause', 'restartTxt', 490, 0.5, 'sineOut')
    doTweenAlpha('restartTxtAlpha', 'restartTxt', 1, 0.5, 'sineOut')

    makeLuaText('optionsTxt', 'Settings', 0, 50, 515)
    setTextFont('optionsTxt', txtFont)
    setTextSize("optionsTxt", 40)
    setObjectCamera("optionsTxt", 'camOther')
    setProperty('optionsTxt.alpha', 0)
    addLuaText('optionsTxt')
    doTweenY('optionsTxtPause', 'optionsTxt', 565, 0.5, 'sineOut')
    doTweenAlpha('optionsTxtAlpha', 'optionsTxt', 1, 0.5, 'sineOut')

    makeLuaText('exitTxt', 'Leave to Menu', 0, 50, 590)
    setTextFont('exitTxt', txtFont)
    setTextSize("exitTxt", 40)
    setObjectCamera("exitTxt", 'camOther')
    setProperty('exitTxt.alpha', 0)
    addLuaText('exitTxt')
    doTweenY('exitTxtPause', 'exitTxt', 640, 0.5, 'sineOut')
    doTweenAlpha('exitTxtAlpha', 'exitTxt', 1, 0.5, 'sineOut')

    changeDiscordPresence("Paused", songName..' - ('..difficultyName..')', nil, 0, 0.0)

    playSound('clickText', 0.5)

    end
end

function onCustomSubstateTimerCompleted(tag, loops, loopsLeft)
	if tag == 'loopPauseTag' then
        playSound(pauseMusic, 1, 'pauseSongTag')
	end
end

function onCustomSubstateUpdatePost(name)
    if name == 'pauseState' then
        if keyboardJustPressed('ENTER') and optionSelected == 1 then
            stopSound('pauseSongTag')
            cancelTimer('loopPauseTag')
            closeCustomSubstate();

            for i = 1,#option do
                removeLuaText('option_'..i,false);
            end

            doTweenAlpha("bgalpha", "bgFade", 0, 0.8, 'linear')

            doTweenAlpha('splashTxtAlpha', 'splashTxt', 0, 0.5, 'linear')
            doTweenY("splashTxtMove", "splashTxt", -20, 0.5, 'sineOut')

            doTweenY('resumeTxtPause', 'resumeTxt', 465, 0.5, 'sineOut')
            doTweenAlpha('resumeTxtAlpha', 'resumeTxt', 0, 0.5, 'sineOut')
            doTweenY('restartTxtPause', 'restartTxt', 540, 0.5, 'sineOut')
            doTweenAlpha('restartTxtAlpha', 'restartTxt', 0, 0.5, 'sineOut')
            doTweenY('optionsTxtPause', 'optionsTxt', 615, 0.5, 'sineOut')
            doTweenAlpha('optionsTxtAlpha', 'optionsTxt', 0, 0.5, 'sineOut')
            doTweenY('exitTxtPause', 'exitTxt', 690, 0.5, 'sineOut')
            doTweenAlpha('exitTxtAlpha', 'exitTxt', 0, 0.5, 'sineOut')
        end

        if keyboardJustPressed('ENTER') and optionSelected == 2 then
            stopSound('pauseSongTag')
	        playSound('scrollMenu')
            restartSong(false);
        end

        if keyboardJustPressed('ENTER') and optionSelected == 3 then
            runHaxeCode([[
                import options.OptionsState;
                import backend.MusicBeatState;
                game.paused = true; // For lua
                game.vocals.volume = 0;
                MusicBeatState.switchState(new OptionsState());
                if (ClientPrefs.data.pauseMusic != 'None') {
                    FlxG.sound.playMusic(Paths.music(Paths.formatToSongPath(ClientPrefs.data.pauseMusic)), game.modchartSounds('pauseMusic').volume);
                    FlxTween.tween(FlxG.sound.music, {volume: 1}, 0.8);
                    FlxG.sound.music.time = game.modchartSounds('pauseMusic').time;
                }
                OptionsState.onPlayState = true;
            ]])
        end

        if keyboardJustPressed('ENTER') and optionSelected == 4 then
            stopSound('pauseSongTag')
	        playSound('scrollMenu')
            exitSong(false);
        end

        if optionSelected == 1 then
            doTweenColor('resumeTxtCol', 'resumeTxt', '00CCFF', 0.1, 'linear')
            doTweenColor('restartTxtCol', 'restartTxt', 'FFFFFF', 0.1, 'linear')
            doTweenColor('optionsTxtCol', 'optionsTxt', 'FFFFFF', 0.1, 'linear')
            doTweenColor('exitTxtCol', 'exitTxt', 'FFFFFF', 0.1, 'linear')

            doTweenX('resumeTxtSelect', 'resumeTxt', 55, 0.1, 'linear')
            doTweenX('restartTxtSelect', 'restartTxt', 50, 0.1, 'linear')
            doTweenX('optionsTxtSelect', 'optionsTxt', 50, 0.1, 'linear')
            doTweenX('exitTxtSelect', 'exitTxt', 50, 0.1, 'linear')

        elseif optionSelected == 2 then
            doTweenColor('resumeTxtCol', 'resumeTxt', 'FFFFFF', 0.1, 'linear')
            doTweenColor('restartTxtCol', 'restartTxt', '00CCFF', 0.1, 'linear')
            doTweenColor('optionsTxtCol', 'optionsTxt', 'FFFFFF', 0.1, 'linear')
            doTweenColor('exitTxtCol', 'exitTxt', 'FFFFFF', 0.1, 'linear')

            doTweenX('resumeTxtSelect', 'resumeTxt', 50, 0.1, 'linear')
            doTweenX('restartTxtSelect', 'restartTxt', 55, 0.1, 'linear')
            doTweenX('optionsTxtSelect', 'optionsTxt', 50, 0.1, 'linear')
            doTweenX('exitTxtSelect', 'exitTxt', 50, 0.1, 'linear')

        elseif optionSelected == 3 then
            doTweenColor('resumeTxtCol', 'resumeTxt', 'FFFFFF', 0.1, 'linear')
            doTweenColor('restartTxtCol', 'restartTxt', 'FFFFFF', 0.1, 'linear')
            doTweenColor('optionsTxtCol', 'optionsTxt', '00CCFF', 0.1, 'linear')
            doTweenColor('exitTxtCol', 'exitTxt', 'FFFFFF', 0.1, 'linear')

            doTweenX('resumeTxtSelect', 'resumeTxt', 50, 0.1, 'linear')
            doTweenX('restartTxtSelect', 'restartTxt', 50, 0.1, 'linear')
            doTweenX('optionsTxtSelect', 'optionsTxt', 55, 0.1, 'linear')
            doTweenX('exitTxtSelect', 'exitTxt', 50, 0.1, 'linear')

        elseif optionSelected == 4 then 
            doTweenColor('resumeTxtCol', 'resumeTxt', 'FFFFFF', 0.1, 'linear')
            doTweenColor('restartTxtCol', 'restartTxt', 'FFFFFF', 0.1, 'linear')
            doTweenColor('optionsTxtCol', 'optionsTxt', 'FFFFFF', 0.1, 'linear')
            doTweenColor('exitTxtCol', 'exitTxt', '00CCFF', 0.1, 'linear')

            doTweenX('resumeTxtSelect', 'resumeTxt', 50, 0.1, 'linear')
            doTweenX('restartTxtSelect', 'restartTxt', 50, 0.1, 'linear')
            doTweenX('optionsTxtSelect', 'optionsTxt', 50, 0.1, 'linear')
            doTweenX('exitTxtSelect', 'exitTxt', 55, 0.1, 'linear')
        end

        if keyboardJustPressed('W') then
            chooseOption(-1)
	        playSound('scrollMenu')
        elseif keyboardJustPressed('S') then
            chooseOption(1)
	        playSound('scrollMenu')
        end
        if keyboardJustPressed('UP') then
            chooseOption(-1)
	        playSound('scrollMenu')
        elseif keyboardJustPressed('DOWN') then
            chooseOption(1)
	        playSound('scrollMenu')
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'loopPauseTag' then
		playSound(pauseMusic, 1, 'pauseSongTag')
	end
end

optionSelected = 1
function chooseOption(choose)
    optionSelected = optionSelected + choose;

    if optionSelected >= #option + 1 then
        optionSelected = 1;
    elseif optionSelected <= 0 then
        optionSelected = #option;
    end
end