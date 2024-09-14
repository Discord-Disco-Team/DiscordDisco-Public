function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    local random = math.random (3)
    if random == 1 then
        playSound("missnote1", 1, "miss1") -- change the decimal number to change the volume
    elseif random == 2 then
        playSound("missnote2", 1, "miss2")
    elseif random == 3 then
        playSound("missnote3", 1, "miss3")
    end
end