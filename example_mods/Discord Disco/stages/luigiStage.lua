function onCreate()
    makeLuaSprite("whitespace", null, -300, -600)
    makeGraphic("whitespace", 1280, 720, '000000')
    scaleObject("whitespace", 2, 2)
    setScrollFactor("whitespace", 0, 0)
    screenCenter("whitespace", 'xy')
    addLuaSprite("whitespace", false)

    makeLuaSprite("wall", "NeonStage/Luigisky", -400, -530)
    setScrollFactor("wall", 0, 0)
    scaleObject("wall", 1.0, 1.0, true)

    makeLuaSprite("wallagain", "NeonStage/Luigimountains", -400, -460)
    setScrollFactor("wallagain", 0.2, 0.2)
    scaleObject("wallagain", 1.0, 0.8, true)


    makeLuaSprite("bushA", "NeonStage/Luigibush1", -300, 500)
    setScrollFactor("bushA", 1, 1)
    scaleObject("bushA", 0.8, 0.8, true)

    makeLuaSprite("bushB", "NeonStage/Luigibush2", 790, 580)
    setScrollFactor("bushB", 1, 1)
    scaleObject("bushB", 0.8, 0.8, true)

    makeLuaSprite("bushC", "NeonStage/Luigibush1", 1050, 510)
    setScrollFactor("bushC", 1, 1)
    scaleObject("bushC", 1.0, 1.0, true)

    makeLuaSprite("bushD", "NeonStage/Luigibush2", 90, 630)
    setScrollFactor("bushD", 1, 1)
    scaleObject("bushD", 1.0, 1.0, true)



    makeLuaSprite("boxA", "NeonStage/Luigibox1", 50, 200)
    setScrollFactor("boxA", 0.45, 0.45)
    scaleObject("boxA", 0.8, 0.8, true)

    makeLuaSprite("boxB", "NeonStage/Luigibox2", -80, 200)
    setScrollFactor("boxB", 0.45, 0.45)
    scaleObject("boxB", 0.8, 0.8, true)



    makeLuaSprite("boxC", "NeonStage/Luigibox2", 800, 200)
    setScrollFactor("boxC", 0.5, 0.5)
    scaleObject("boxC", 1.0, 1.0, true)

    makeLuaSprite("boxD", "NeonStage/Luigibox1", 960, 200)
    setScrollFactor("boxD", 0.5, 0.5)
    scaleObject("boxD", 1.0, 1.0, true)

    makeLuaSprite("boxE", "NeonStage/Luigibox2", 1120, 200)
    setScrollFactor("boxE", 0.5, 0.5)
    scaleObject("boxE", 1.0, 1.0, true)


    makeLuaSprite("floor", "NeonStage/Luigifloor", -1600, -1400)
    setScrollFactor("floor", 1, 1)
    scaleObject("floor", 2, 2, true)
    
    addLuaSprite("wall", false)
    addLuaSprite("wallagain", false)
    addLuaSprite("floor", false)

    addLuaSprite("bushA", false)
    addLuaSprite("bushB", false)
    addLuaSprite("bushC", false)
    addLuaSprite("bushD", false)

    addLuaSprite("boxA", false)
    addLuaSprite("boxB", false)
    addLuaSprite("boxC", false)
    addLuaSprite("boxD", false)
    addLuaSprite("boxE", false)
end

function onUpdate(elapsed)
    setPerspective("floor", 0.8)

    setScrollFactor("gfGroup", 0.775, 0.775)

    runHaxeCode("game.comboGroup.cameras = [game.camGame];")
end