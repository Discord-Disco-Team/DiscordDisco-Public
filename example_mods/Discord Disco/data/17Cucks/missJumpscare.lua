function noteMiss(id, direction, noteType, isSustainNote)
	makeLuaSprite('imageE', 'nomoreboar', 300, 100);
	scaleObject('imageE', 1, 1)
   addLuaSprite('imageE', true);
doTweenColor('helloE', 'imageE', 'FF000000', 0.5, 'quartIn');
setObjectCamera('imageE', 'hud');
playSound('YouFuckinBitch')
	 triggerEvent('Screen Shake', '0.5, 0.01', '0.2, 0.01');
runTimer('waitE', 0.013);

function onTimerCompleted(tag, loops, loopsleft)
if tag == 'waitE' then
	doTweenAlpha('byebyeE', 'imageE', 0, 0.5, 'linear');
end
end

function onTweenCompleted(tag)
if tag == 'byebyeE' then
	removeLuaSprite('imageE', true);
end
end
end