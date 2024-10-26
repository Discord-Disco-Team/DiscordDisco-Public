function onEvent(name, value1, value2)
	if name == 'CameraRotato' then
		duration = tonumber(value1);
		if duration < 0 then
			duration = 0;
		end

		targetAngle = tonumber(value2);
		
		if duration == 0 then
			setProperty('camGame.angle', targetAngle);
		else
			doTweenAngle('turn', 'camGame', targetAngle, duration, 'quadIn')
		end
		--debugPrint('Event triggered: ', name, duration, targetAlpha);
	end
end