function onCreate()
    setProperty("skipCountdown", true)
end

function onCreatePost()
    makeLuaSprite('statBox','',0,0)
    makeGraphic('statBox',1,105,'000000')
    setObjectCamera('statBox', 'hud')
    screenCenter('statBox', 'y')
    setProperty('statBox.alpha', 0.5)
    addLuaSprite('statBox', true)

    makeLuaText('statTxtShad', "Stats", 150, 0,0)
    setTextFont('statTxtShad', "minecraft_font.ttf")
	setTextColor('statTxtShad', '3F3F3F')
	setTextBorder('statTxtShad', 0, '000000')
	setTextSize('statTxtShad', 16)
    setTextAlignment('statTxtShad', 'center')
    setObjectCamera('statTxtShad', 'hud')
    screenCenter('statTxtShad', 'y')
    setProperty('statTxtShad.y', getProperty('statTxtShad.y') - 39)
	addLuaText('statTxtShad')

    makeLuaText('labelTxtShad', "Score\nMisses\nRating\nAcc", 0, 0,0)
    setTextFont('labelTxtShad', "minecraft_font.ttf")
    setTextColor('labelTxtShad', '3F3F3F')
	setTextBorder('labelTxtShad', 0, '000000')
	setTextSize('labelTxtShad', 16)
    setTextAlignment('labelTxtShad', 'left')
    setObjectCamera('labelTxtShad', 'hud')
    screenCenter('labelTxtShad', 'y')
    setProperty('labelTxtShad.y', getProperty('labelTxtShad.y') + 9)
	addLuaText('labelTxtShad')

    makeLuaText('scrTxtShad', "0\n0\nN/A\n0%", 0, 0,0)
    setTextFont('scrTxtShad', "minecraft_font.ttf")
    setTextColor('scrTxtShad', '3F1515')
	setTextBorder('scrTxtShad', 0, '000000')
	setTextSize('scrTxtShad', 16)
    setTextAlignment('scrTxtShad', 'right')
    setObjectCamera('scrTxtShad', 'hud')
    screenCenter('scrTxtShad', 'y')
    setProperty('scrTxtShad.y', getProperty('scrTxtShad.y') + 9)
	addLuaText('scrTxtShad')


    makeLuaText('statTxt', "Stats", 150, 0,0)
    setTextFont('statTxt', "minecraft_font.ttf")
	setTextColor('statTxt', 'FFFFFF')
	setTextBorder('statTxt', 0, '000000')
	setTextSize('statTxt', 16)
    setTextAlignment('statTxt', 'center')
    setObjectCamera('statTxt', 'hud')
    screenCenter('statTxt', 'y')
    setProperty('statTxt.y', getProperty('statTxt.y') - 41)
	addLuaText('statTxt')

    makeLuaText('labelTxt', "Score\nMisses\nRating\nAcc", 0, 0,0)
    setTextFont('labelTxt', "minecraft_font.ttf")
    setTextColor('labelTxt', 'FFFFFF')
	setTextBorder('labelTxt', 0, '000000')
	setTextSize('labelTxt', 16)
    setTextAlignment('labelTxt', 'left')
    setObjectCamera('labelTxt', 'hud')
    screenCenter('labelTxt', 'y')
    setProperty('labelTxt.y', getProperty('labelTxt.y') + 7)
	addLuaText('labelTxt')

    makeLuaText('scrTxt', "0\n0\nN/A\n0%", 0, 0,0)
    setTextFont('scrTxt', "minecraft_font.ttf")
    setTextColor('scrTxt', 'FF5555')
	setTextBorder('scrTxt', 0, '000000')
	setTextSize('scrTxt', 16)
    setTextAlignment('scrTxt', 'right')
    setObjectCamera('scrTxt', 'hud')
    screenCenter('scrTxt', 'y')
    setProperty('scrTxt.y', getProperty('scrTxt.y') + 7)
	addLuaText('scrTxt')

    onRecalculateRating()
    bartype = "exp"
    if downscroll then bartype = "boss" end

    makeLuaSprite('timBarBack', 'brine/'..bartype..'barbrineback', 85, 25)
    scaleObject('timBarBack', 0.5, 0.5)
    updateHitbox('timBarBack')
    setProperty('timBarBack.x', (screenWidth - getProperty('timBarBack.width'))/2)
    setObjectCamera('timBarBack', 'hud')
	addLuaSprite('timBarBack', true)

    makeLuaSprite('timBar', 'brine/'..bartype..'barbrinefill', 94, 27)
    scaleObject('timBar', 0.5, 0.5)
    updateHitbox('timBar')
    setProperty('timBar.x', (screenWidth - 360)/2)
    setProperty('timBar.alpha', 0)
    setObjectCamera('timBar', 'hud')
	addLuaSprite('timBar', true)

    makeLuaSprite('timBarOver', 'brine/'..bartype..'barbrineoverlay', 85, 25)
    scaleObject('timBarOver', 0.5, 0.5)
    updateHitbox('timBarOver')
    setProperty('timBarOver.x', (screenWidth - getProperty('timBarOver.width'))/2)
    setObjectCamera('timBarOver', 'hud')
	addLuaSprite('timBarOver', true)

    setTextWidth("timeTxt", screenWidth)
    setProperty('timeTxt.x', 0)
    setProperty("timeTxt.y", 1)
    setTextFont('timeTxt', "minecraft_font.ttf")
    if not downscroll then 
        strumpos = 0
        setTextColor('timeTxt', "55FF55") 
        setTextBorder('timeTxt', 2, '000000')
    else
        setTextBorder('timeTxt', 0, '000000')
    end
    setProperty('timeTxt.antialiasing', false)
    setTextSize('timeTxt', 16)

    makeLuaText('timeTxtShad', "", screenWidth, 2, 3)
    setTextString('timeTxtShad', getProperty("timeTxt.text"))
    setTextFont('timeTxtShad', "minecraft_font.ttf")
	setTextColor('timeTxtShad', '3F3F3F')
	setTextBorder('timeTxtShad', 0, '000000')
	setTextSize('timeTxtShad', 16)
    setTextAlignment('timeTxtShad', 'center')
    setProperty("timeTxtShad.alpha", 0)
    setObjectCamera('timeTxtShad', 'hud')
    if downscroll then addLuaText('timeTxtShad') end
    setObjectOrder('timeTxt', getObjectOrder('timBarOver') + 2)

    if downscroll then
        setProperty("scoreTxt.y", 48)
    else
        setProperty("timeTxt.y", screenHeight - 38)

        setProperty("timBarBack.y", (screenHeight - 44) + 23.5)
        setProperty("timBar.y", (screenHeight - 44) + 25.75)
        setProperty("timBarOver.y", (screenHeight - 44) + 23.5)
    end
    disableHUD()

    for i = 0,3 do
        makeLuaText('testTxt'..i..'Shad', "", 150, 0,0)
        setProperty('testTxt'..i..'Shad'..'.x', getPropertyFromGroup('playerStrums', i, 'x') - 35 + 4)
        setProperty('testTxt'..i..'Shad'..'.y', getPropertyFromGroup('playerStrums', i, 'y') + 80 - 8 + 4)
        setTextFont('testTxt'..i..'Shad', "minecraft_font.ttf")
        setTextColor('testTxt'..i..'Shad', '3F3F3F')
        setTextBorder('testTxt'..i..'Shad', 0, '000000')
        setTextSize('testTxt'..i..'Shad', 32)
        setTextAlignment('testTxt'..i..'Shad', 'right')
        setObjectCamera('testTxt'..i..'Shad', 'hud')
        addLuaText('testTxt'..i..'Shad')

        makeLuaText('testTxt'..i, "", 150, 0,0)
        setProperty('testTxt'..i..'.x', getPropertyFromGroup('playerStrums', i, 'x') - 35)
        setProperty('testTxt'..i..'.y', getPropertyFromGroup('playerStrums', i, 'y') + 80 - 8)
        setTextFont('testTxt'..i, "minecraft_font.ttf")
        setTextColor('testTxt'..i, 'FFFFFF')
        setTextBorder('testTxt'..i, 0, '000000')
        setTextSize('testTxt'..i, 32)
        setTextAlignment('testTxt'..i, 'right')
        setObjectCamera('testTxt'..i, 'hud')
        addLuaText('testTxt'..i)
    end
end

function onSongStart()
    setProperty('timBar.alpha', 1)
    doTweenAlpha('timeShad', 'timeTxtShad', 1, 0.5, 'circOut')
end

function onRecalculateRating() 
    ronting = ratingFC
    if (ronting == "") then ronting = "N/A" end
    setTextString('scrTxt', score.."\n"..misses.."\n"..ronting.."\n"..(math.floor(rating * 10000) / 100).."%")
    setProperty('scrTxt.x', screenWidth - (getProperty('scrTxt.width') + 10))
    setProperty('labelTxt.x', screenWidth - (getProperty('scrTxt.width') + 100))
    setTextWidth('statTxt', (getProperty('scrTxt.width') + 90))
    setProperty('statTxt.x', screenWidth - (getProperty('statTxt.width') + 10))

    setTextString('scrTxtShad', score.."\n"..misses.."\n"..ronting.."\n"..(math.floor(rating * 10000) / 100).."%")
    setProperty('scrTxtShad.x', screenWidth - (getProperty('scrTxtShad.width') + 8))
    setProperty('labelTxtShad.x', screenWidth - (getProperty('scrTxtShad.width') + 98))
    setTextWidth('statTxtShad', (getProperty('scrTxtShad.width') + 90))
    setProperty('statTxtShad.x', screenWidth - (getProperty('statTxtShad.width') + 8))

    setProperty('statBox.scale.x', (getProperty('scrTxt.width') + 98))
    updateHitbox('statBox')
    setProperty('statBox.x', screenWidth - (getProperty('scrTxt.width') + 105))

    if (getProperty('statTxt.width') > 125) then 
        setTextString('statTxt', "Statistics")
        setTextString('statTxtShad', "Statistics")
    else 
        setTextString('statTxt', "Stats") 
        setTextString('statTxtShad', "Stats") 
    end

end

function onUpdatePost()
    setTextString('timeTxtShad', getProperty("timeTxt.text"))
    scaleObject('timBar', 360 * (getSongPosition() / songLength), 0.5)
end

function disableHUD() --hopefully reduces lag from existing components
    fuckasses = {"scoreTxt", "timeBar"}
    for i, hudspr in ipairs(fuckasses) do
        setProperty(hudspr..".visible", false)
        setProperty(hudspr..".active", false)
    end
end