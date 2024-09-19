local allowCountdown = false
local startedDialogue = false

function onStartCountdown()
    if not allowCountdown and isStoryMode and not startedDialogue then
        setProperty('inCutscene', true);
        runTimer('startDialogue', 0.8);
        startedDialogue = true;
        return Function_Stop;
    end
    return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'startDialogue' then
        startDialogue('dialogue', 'blammed');
    elseif tag == 'startDialogueEnd' then
        startDialogue('dialogueEnd', 'blammed');
    end
end