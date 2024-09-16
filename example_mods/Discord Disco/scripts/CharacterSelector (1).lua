--Made By thesilliestgeese, credit me if used in a mod!
selectedChar = false
charNum = 1

function onSongStart()
    debugPrint(getProperty("boyfriend.curCharacter"))
end

--local luaDebugMode = true
if not isStoryMode then
    function onCreatePost()
        characters = {
            getProperty("boyfriend.curCharacter"),
            "bf-discord",
            "gf-discord",
            "bf"
        }
        characterNames = {
            "Default",
            "Boyfriend",
            "Girlfriend",
            "Boyfriend (Classic)"
        }
        for i = 1, #characters do
            debugPrint(i)
            addCharacterToList(characters[i])
        end
        makeLuaText("charName", "", 1000, 0, 30)
        setTextSize("charName", 30)
        addLuaText("charName")
        -- dont edit from here on
        debugPrint(#characters)
        triggerEvent("Change Character", "0", characters[charNum])
    end
end

if not isStoryMode then
    function onUpdatePost(elapsed)
        if not selectedChar then
            if keyJustPressed("right") then
                    if charNum + 1 >= #characters + 1 then
                        charNum = 1
                    else
                        charNum = charNum + 1
                    end
                    triggerEvent("Change Character", "0", characters[charNum])
                end

                if keyJustPressed("left") then
                    if charNum == 1 then
                        charNum = #characters
                    else
                        charNum = charNum - 1
                    end
                    triggerEvent("Change Character", "0", characters[charNum])
                end
                screenCenter("charName", "x")
                if keyJustPressed("back") then
                    selectedChar = true
                    startCountdown()
                    restartSong()
                end
                if keyJustPressed("accept") then
                    setProperty("charName.visible", false)
                    selectedChar = true
                    startCountdown()
                end
                setTextString("charName", characterNames[charNum])
            end
        end
    end

if not isStoryMode then
    function onStartCountdown()
        if not selectedChar then
            return Function_Stop
        end
    end
end