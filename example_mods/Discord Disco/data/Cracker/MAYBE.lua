function onEndSong()
   if isStoryMode and not botPlay then
       loadSong(misses > 10 and 'moderator' or 'gaylord')
       return Function_Stop
   end
end

function opponentNoteHit()
    if curStep > 944 and misses <= 10 then
    health = getProperty('health')
    if getProperty('health') > 0.1 then
        setProperty('health', health- 0.01);
    end
    end
end