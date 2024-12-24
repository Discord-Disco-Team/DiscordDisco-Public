function onCreate()
  
  if songName == "Gaylord" then
    removeLuaScript('scripts/ghostNoteTrail')
  end
  if songName == "Stainless" then
    removeLuaScript('scripts/ghostNoteTrail')
  end
  if songName == "Stainless-nitro" then
    removeLuaScript('scripts/ghostNoteTrail')
  end
  if hideHud == true or isStoryMode == true then
    removeLuaScript('scripts/RH_Perfect')
  end
  
end
