function onEvent(name, value1, value2)
	if flashingLights == true then
		if name == 'HUDRotato' then
			duration = tonumber(value1);
			if duration < 0 then
				duration = 0;
			end

			targetAngle = tonumber(value2);
		
			if duration == 0 then
				setProperty('camHUD.angle', targetAngle);
			else
				doTweenAngle('turn', 'camHUD', targetAngle, duration, 'quadIn')
			end
			--debugPrint('Event triggered: ', name, duration, targetAlpha);
		end
	end
end