-- [settings] --

local composer = "FurretWithATophat" -- the song's composer
local icon = "furret" --  the composer's icon, put it in "images/introCard/icons" (has to be 56x56)
local disappearBeat = 8 -- the beat on which the card disappears
local playDiscordSound = true -- set this to false if you dont want the notification sound to play
local discordSoundVolume = 1.0 -- change this to change the notification sound volume

-- [code] --

function onCreate()
    makeLuaSprite("intro-notifbg", "introCard/notifBG", screenWidth + 200, screenHeight - 130)
    setObjectCamera("intro-notifbg", "other")
    addLuaSprite("intro-notifbg", false)

    makeLuaSprite("intro-icon", "introCard/icons/"..icon, screenWidth + 200, screenHeight - 86)
    setObjectCamera("intro-icon", "other")
    updateHitbox("intro-icon")
    addLuaSprite("intro-icon", false)

    makeLuaText("intro-composer", composer, 1280, screenWidth, screenHeight - 77)
    setTextSize("intro-composer", 16)
    setObjectCamera("intro-composer", "other")
    setTextAlignment("intro-composer", "left")
    screenCenter("intro-composer", "x")
    addLuaText("intro-composer")

    makeLuaText("intro-songname", songName, 1280, screenWidth, screenHeight - 57)
    setTextSize("intro-songname", 16)
    setTextColor("intro-songname", "939393")
    setObjectCamera("intro-songname", "other")
    setTextAlignment("intro-songname", "left")
    screenCenter("intro-songname", "x")
    addLuaText("intro-songname")
end

function onSongStart()
    doTweenX("intro-tween", "intro-notifbg", screenWidth - 360, 0.5, "circOut")
    if playDiscordSound == true then
        playSound("intro-discord", discordSoundVolume)
    end
end

function onUpdate(elapsed)
    setProperty("intro-icon.x", getProperty("intro-notifbg.x") + 17)
    setProperty("intro-composer.x", getProperty("intro-notifbg.x") + 89)
    setProperty("intro-songname.x", getProperty("intro-notifbg.x") + 89)
end

function onBeatHit()
    if curBeat == disappearBeat then
        removeLuaSprite("intro-notifbg", true)
        removeLuaSprite("intro-icon", true)
        removeLuaText("intro-composer", true)
        removeLuaText("intro-songname", true)
    end
end