local alphaBF, alphaDAD = 1, 1 -- choose your transparency, the first is bf and second dad (dads alpha doesnt work in middlescroll and hide opponent notes)
local colors = {"Purple","Blue","Green","Red"}
function createSprite(color, suffix)
local wawa ="hold" .. color .. suffix
makeAnimatedLuaSprite(wawa, 'holdCover' .. color)
addAnimationByPrefix(wawa,"hold", 'holdCover' .. color, 24, true)
addAnimationByPrefix(wawa,"end", 'holdCoverEnd' .. color, 24, false)
addLuaSprite(wawa,true)
setProperty(wawa .. '.visible', false)
setProperty(wawa .. '.alpha', suffix =="BF" and alphaBF or alphaDAD)
end

function onCreatePost() 
for i, color in ipairs(colors) do
createSprite(color,"BF")   
createSprite(color,"DAD")    
end
for i, suffix in ipairs({"BF","DAD"}) do
for i, color in ipairs(colors) do
local wawa ="hold" .. color .. suffix
if version > '1' then
setProperty(wawa .. '.camera', instanceArg('camHUD'), false, true)  
else
setObjectCamera(wawa, 'camHUD')
end
end
end
end

function noteHit(isOpponent, membersIndex, noteData, isSustainNote)
if isSustainNote then
local color = colors[noteData + 1]
local wawa ="hold" .. color .. (isOpponent and"DAD" or"BF")
setProperty(wawa .. '.visible', true)
playAnim(wawa, stringEndsWith(getPropertyFromGroup('notes', membersIndex, 'animation.curAnim.name'), 'end') and 'end' or 'hold')
end
end
function goodNoteHit(membersIndex, noteData, noteType, isSustainNote) noteHit(false, membersIndex, noteData, isSustainNote)end
function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote) noteHit(true, membersIndex, noteData, isSustainNote)end
function noteMiss(id, nT) setProperty("hold" .. colors[nT + 1] .. "BF.visible", false)end

function onUpdate()
for i, color in ipairs(colors) do
for j, suffix in ipairs({"BF","DAD"}) do
local wawa ="hold" .. color .. suffix
if getProperty(wawa .. ".animation.curAnim.name") == 'end' and getProperty(wawa .. ".animation.curAnim.finished") then
setProperty(wawa .. '.visible', false)
playAnim(wawa, 'hold')
end
local offsetX = (suffix =="BF" and -105 or -750)
setProperty(wawa .. '.x', getPropertyFromGroup("strumLineNotes", i + 3, 'x') + offsetX)
setProperty(wawa .. '.y', getPropertyFromGroup("strumLineNotes", i + 3, 'y') - 100)
if middlescroll and suffix == "DAD" then
setProperty(wawa .. '.x', getPropertyFromGroup("strumLineNotes", i + 3, 'x') + ({-440, -440, 230, 230})[i])
setProperty(wawa .. '.alpha', getPropertyFromGroup('strumLineNotes', 0, 'alpha'))
elseif suffix =="DAD" then
setProperty(wawa .. '.alpha', getPropertyFromGroup('strumLineNotes', 0, 'alpha'))-- fix????? LOL
end
end
end
end