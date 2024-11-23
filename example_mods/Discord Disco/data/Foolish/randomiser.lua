colorCorrection = false
randomizeColors = true
randomizeSustainColors = true
randomizeChart = true

local og = {180, 90, 270, 0}
local holder = {}

function onSpawnNote(i,d,t,s)
    if gameGimmicks == false then

        local e = d
        local cols = getPropertyFromClass('backend.ClientPrefs', 'data.arrowRGB')

        if getPropertyFromClass('states.PlayState', 'isPixelStage') then
            local cols = getPropertyFromClass('backend.ClientPrefs', 'data.arrowRGBPixel')
        end

        if randomizeChart then
        e = getRandomInt(0,3)
        local prevCounter = 0
        
        if getProperty('notes.length') > 1 then
            if getRandomBool(95) then
                repeat
                e = getRandomInt(0,3)
                until getPropertyFromGroup('notes',i+1,'noteData') ~= e
            end
        end
        
        if getRandomBool(20) then e = d end

        local targAng = og[e+1]
        local ang = og[getPropertyFromGroup('notes',i,'noteData')+1]
        setPropertyFromGroup('notes',i,'noteData',e)
        table.insert(holder,0,ang)

        if s then
        repeat
            prevCounter = prevCounter+1
        until getPropertyFromGroup('notes',i,'mustPress') == getPropertyFromGroup('notes',i+prevCounter,'mustPress')
        
        local r =getPropertyFromGroup('notes',i+prevCounter,'noteData')
        setPropertyFromGroup('notes', i, 'noteData', r)
        
        if colorCorrection then
            setPropertyFromGroup('notes', i, 'rgbShader.r', cols[r+1][1])
            setPropertyFromGroup('notes', i, 'rgbShader.g', cols[r+1][2])
            setPropertyFromGroup('notes', i, 'rgbShader.b', cols[r+1][3])
        end
        
        else
        setPropertyFromGroup('notes',i,'copyAngle',false)
        setPropertyFromGroup('notes',i,'angle',(targAng-ang))
        end
        
        if colorCorrection then
        setPropertyFromGroup('notes', i, 'rgbShader.r', cols[e+1][1])
        setPropertyFromGroup('notes', i, 'rgbShader.g', cols[e+1][2])
        setPropertyFromGroup('notes', i, 'rgbShader.b', cols[e+1][3])
        end
        end

        if randomizeColors then
            if s then
            setPropertyFromGroup('notes', i, 'rgbShader.r', getPropertyFromGroup('notes', i+1, 'rgbShader.r'))
            setPropertyFromGroup('notes', i, 'rgbShader.g', getPropertyFromGroup('notes', i+1, 'rgbShader.g'))
            setPropertyFromGroup('notes', i, 'rgbShader.b', getPropertyFromGroup('notes', i+1, 'rgbShader.b'))
            end
            if (not s) or randomizeSustainColors then
            local t = getRandomInt(1,4)
            setPropertyFromGroup('notes', i, 'rgbShader.r', cols[t][1])
            setPropertyFromGroup('notes', i, 'rgbShader.g', cols[t][2])
            setPropertyFromGroup('notes', i, 'rgbShader.b', cols[t][3])
            end
        end
        end
    end
function goodNoteHit(i,d)
    if gameGimmicks == false then
        setPropertyFromGroup('playerStrums',d,'rgbShader.r',getPropertyFromGroup('notes',i,'rgbShader.r'))
        setPropertyFromGroup('playerStrums',d,'rgbShader.g',getPropertyFromGroup('notes',i,'rgbShader.g'))
        setPropertyFromGroup('playerStrums',d,'rgbShader.b',getPropertyFromGroup('notes',i,'rgbShader.b'))
    end
end
function opponentNoteHit(i,d)
    if gameGimmicks == false then
        setPropertyFromGroup('opponentStrums',d,'rgbShader.r',getPropertyFromGroup('notes',i,'rgbShader.r'))
        setPropertyFromGroup('opponentStrums',d,'rgbShader.g',getPropertyFromGroup('notes',i,'rgbShader.g'))
        setPropertyFromGroup('opponentStrums',d,'rgbShader.b',getPropertyFromGroup('notes',i,'rgbShader.b'))
    end
end