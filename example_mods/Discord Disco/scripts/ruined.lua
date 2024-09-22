function onCreatePost()
   setProperty('allowDebugKeys', false);
end

function onUpdate()
   if keyJustPressed('debug_1') and keyPressed('up') or keyJustPressed('debug_2') and keyPressed('up') then
      setProperty('allowDebugKeys', true)
   elseif keyJustPressed('debug_1') and not keyPressed('up') or keyJustPressed('debug_2') and not keyPressed('up') then
      loadSong('Ruined')
      setPropertyFromClass('PlayState', 'chartingMode', false)
   end
end