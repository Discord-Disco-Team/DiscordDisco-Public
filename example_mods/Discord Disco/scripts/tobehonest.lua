function onCreatePost()
   setProperty('allowDebugKeys', false); -- prevents key from doing anything
end

function onUpdate()

if keyJustPressed('debug_2') then

   loadSong('To-Be-Honest') -- type any song that you want
   setPropertyFromClass('PlayState', 'chartingMode', false)
end
end