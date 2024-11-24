function onCreatePost()
    --if gameGimmicks == true then
        setProperty('health',2)
        for strumLineNotes = 0,3 do
            setPropertyFromGroup('strumLineNotes',strumLineNotes,'visible',false)
        end
    --end
end
function onUpdate()
    --if gameGimmicks == true then
        for notesLength = 0,getProperty('notes.length') do
            if getPropertyFromGroup('notes', notesLength,'mustPress') == false then
                setPropertyFromGroup('notes',notesLength,'visible',false)
            end
            if getPropertyFromGroup('notes',notesLength,'hitHealth') > 0 then
                setPropertyFromGroup('notes',notesLength,'hitHealth',0)
            end
        end
    --end
end
function onBeatHit()
    --if gameGimmicks == true then
        if curBeat % 12 == 0 then
            setProperty('health',getProperty('health') - 0.02)
        end
    --end
end
