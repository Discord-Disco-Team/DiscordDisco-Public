function opponentNoteHit()
    if curStep > 944 then
    health = getProperty('health')
    if getProperty('health') > 0.1 then
        setProperty('health', health- 0.01);
    end
    end
end