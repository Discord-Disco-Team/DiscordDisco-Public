local Data = {
    SecretKey = "fuck",

    StepActivation = false,
    StepToActivate = 0,
    StepToDeactivate = 0,

    SoundToPlay = "intro-discord",
    SoundVolume = 1,
    Delay = 0.3,
}

local KeyPressed = 1;
local MaxKeys = 0;

local GameOverKeyPressed = false;
local canType = true;

accel_x = 0
accel_x2 = 0
bounce = 0
bf_flip = 1
pos_x = 800

function executeSplit(string)
    local returnTable = {};
    for letter in string.gmatch(string,".") do 
        table.insert(returnTable, letter);
    end 
    return returnTable;
end

function tablelength(T)
    local count = 0;
    for _ in pairs(T) do count = count + 1 end
    return count;
end

local SecretKey = executeSplit(Data.SecretKey:upper());
local PrevHealth = 1;

MaxKeys = tablelength(SecretKey) + 1

function onGameOver() --Stops the GameOver function from triggering
    if PrevHealth > 0 and GameOverKeyPressed == true then
        if canType then
            setProperty('health', PrevHealth);
            return Function_Stop;
        end
    else
        if canType then
            return Function_Continue;
        end
    end
end

function CheckKey()
    if KeyPressed == MaxKeys then
        canType = false;
        if Data.SoundToPlay ~= "" and Data.SoundToPlay ~= nil and Data.SoundToPlay ~= 'none' then
            playSound(Data.SoundToPlay, Data.SoundVolume);
        end
        runTimer('timer1', Data.Delay);
        KeyPressed = 1;
    end
end

function onCreate()
    if Data.StepActivation == true then
        canType = false;
    end
end

function goodNoteHit()
    PrevHealth = getProperty('health');
end

function noteMiss()
    PrevHealth = getProperty('health');
end

function onTimerCompleted(tag)
    if tag == 'timer1' then
        if keyPressed("left") then
            bounce = (1 - math.abs(accel_x)/5)
            bf_flip = 1
        elseif keyPressed("up") then
            bounce = bounce*0.8 + 0.25
        elseif keyPressed("down") then
            bounce = bounce*0.7 + 0.25
        elseif keyPressed("right") then
            bounce = (1 - math.abs(accel_x)/5)
            bf_flip = -1
        else
            accel_x2 = accel_x2 + (1 - bounce)/5
            bounce = (bounce*0.8 + 0.2) + accel_x2
        end
    
        if keyPressed("left") then
            accel_x = accel_x*0.75 - 1*0.25
        elseif keyPressed("right") then
            accel_x = accel_x*0.75 + 1*0.25
        else
            accel_x = (accel_x)*0.8
        end
    
        pos_x = pos_x + accel_x*6
        setProperty('boyfriend.x', pos_x - 1/bounce * 150)
            setProperty('boyfriend.y', 100 + 1/bounce * 350)
        scaleObject('boyfriend', bf_flip/bounce, bounce)
        end
    end
end

function onStepHit()
    if Data.StepActivation == true and curStep == Data.StepToActivate then
        canType = true;
    end
    if Data.StepActivation == true and curStep == Data.StepToDeactivate then
        canType = false;
    end
end

function onUpdate()
    if keyboardJustPressed(SecretKey[1]) and canType then --CREDITS TO CAPTAIN BALDI FOR MAKING A SIMPLE VERSION!!!!
        if keyJustPressed('reset') then GameOverKeyPressed = true; else
            GameOverKeyPressed = false;
        end
        KeyPressed = KeyPressed + 1;
        table.remove(SecretKey, 1);
        CheckKey();
    end
end