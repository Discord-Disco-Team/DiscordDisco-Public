function onCreatePost()
   setProperty('allowDebugKeys', false); -- prevents key from doing anything
end

function onUpdate()

if keyJustPressed('debug_1') then

   loadSong('Ruined') -- type any song that you want
   setPropertyFromClass('PlayState', 'chartingMode', false)
end
end