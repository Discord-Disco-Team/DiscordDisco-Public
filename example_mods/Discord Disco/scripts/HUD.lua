local charColors = {
  ['ironboyo'] = {{'354147', 'B0D8EA', '7994A1'}},
  ['ironboyo-player'] = {{'354147', 'B0D8EA', '7994A1'}},
  ['iron-vc'] = {{'354147', 'B0D8EA', '7994A1'}},
  ['iron-vc-player'] = {{'354147', 'B0D8EA', '7994A1'}},
  ['luifann'] = {{'004722', 'D2FFD5', '00f878'},{'332354', 'D5BEFF', '9868F8'}},
  ['luigi-vc'] = {{'004722', 'D2FFD5', '00f878'},{'332354', 'D5BEFF', '9868F8'}},
  ['luigi-vc-gf'] = {{'004722', 'D2FFD5', '00f878'},{'332354', 'D5BEFF', '9868F8'}},
  ['luigi-vc-player'] = {{'004722', 'D2FFD5', '00f878'},{'332354', 'D5BEFF', '9868F8'}},
  ['luifann-player'] = {{'004722', 'D2FFD5', '00f878'},{'332354', 'D5BEFF', '9868F8'}},
  ['chris'] = {{'dc6d1c', 'fff09f', 'e5c82d'},{'7D7D7D', 'FFFFFF', 'ECECEC'},{'101010', '565656', '303030'},{'1E2640', '5B75C1', '384676'}},
  ['chris-vc'] = {{'dc6d1c', 'fff09f', 'e5c82d'},{'7D7D7D', 'FFFFFF', 'ECECEC'},{'101010', '565656', '303030'},{'1E2640', '5B75C1', '384676'}},
  ['chris-vc-right'] = {{'dc6d1c', 'fff09f', 'e5c82d'},{'7D7D7D', 'FFFFFF', 'ECECEC'},{'101010', '565656', '303030'},{'1E2640', '5B75C1', '384676'}},
  ['chrisalticon'] = {{'dc6d1c', 'fff09f', 'e5c82d'},{'7D7D7D', 'FFFFFF', 'ECECEC'},{'101010', '565656', '303030'},{'1E2640', '5B75C1', '384676'}},
  ['chrisalticon-right'] = {{'dc6d1c', 'fff09f', 'e5c82d'},{'7D7D7D', 'FFFFFF', 'ECECEC'},{'101010', '565656', '303030'},{'1E2640', '5B75C1', '384676'}},
  ['chrisalticon-player'] = {{'dc6d1c', 'fff09f', 'e5c82d'},{'7D7D7D', 'FFFFFF', 'ECECEC'},{'101010', '565656', '303030'},{'1E2640', '5B75C1', '384676'}},
  ['antichris'] = {{'770000', 'f0b4b4', 'b71c6f'}},
  ['anti-vc'] = {{'770000', 'f0b4b4', 'b71c6f'}},
  ['anti-vc-right'] = {{'770000', 'f0b4b4', 'b71c6f'}},
  ['anti-vc-player'] = {{'770000', 'f0b4b4', 'b71c6f'}},
  ['antinerd'] = {{'770000', 'f0b4b4', 'b71c6f'}},
  ['Nina'] = {{'9e440d', 'd96b0b', 'eb9346'},{'300c73', '781aa1', 'c45ee0'},{'300c73', '781aa1', 'c45ee0'},{'9e440d', 'd96b0b', 'eb9346'}},
  ['Scrimblo'] = {{'ffffff', '000000', '000000'}},
  ['Mid'] = {{'111111', '5F5F5F', '212121'},{'631213', 'FFA4A4', 'FF2D32'},{'7D7D7D', 'FFFFFF', 'ECECEC'},{'5D0C27', 'FFB3C5', 'AB164A'}},
  ['furret'] = {{'ffffff', '000000', '000000'}},
  ['paint-luigi'] = {{'000000', 'b5e61d', 'b5e61d'},{'000000', 'b97a57', 'b97a57'},{'000000', '880015', '880015'},{'000000', '7092be', '7092be'}},
  ['ninaface'] = {{'000000', 'ffc90e', 'ffc90e'},{'000000', 'c8bfe7', 'c8bfe7'},{'000000', 'a349a4', 'a349a4'},{'000000', '3f48cc', '3f48cc'}},
  ['LuigiLore'] = {{'004722', 'D2FFD5', '00f878'},{'4F281A', 'FFA29A', '9f5235'},{'003E45', '00DDFF', '008299'},{'332354', 'D5BEFF', '9868F8'}},
  ['ron'] = {{'dcad1c', 'fff09f', 'c9e52d'}},



  ['pico'] = {{'88ff88', 'ddffdd', '008800'}},
  ['pico-player'] = {{'88ff88', 'ddffdd', '008800'}},
  ['spooky'] = {{'dddddd', 'ffffff', '444444'},{'ffdd00', 'ffdd88', '884400'}},
  ['gf'] = {{'ff88dd', 'ffddff', '880000'}},
  ['dad'] = {{'ff88ff', 'ffddff', '884488'}},
  ['mom-car'] = {{'ff8888', 'ffdddd', '880000'}},
  ['mom'] = {{'ff8888', 'ffdddd', '880000'}},
  ['monster'] = {{'ffff88', 'ffff88', '888844'}},
  ['monster-christmas'] = {{'ffff88', 'ffff88', '888844'}},
  ['parents-christmas'] = {{'ff88ff', 'ffddff', '884488'},{'ff8888', 'ffdddd', '880000'}},
  ['Facte'] = {{'dd0000', 'ffffff', '000000'}},
}
local noteTypeColors = {
  ['Hurt Note'] = {{'ff0000','440000','000000'}}
}
function onCreatePost()
  luaDebugMode = true
  if charColors[boyfriendName] then
    for i = 0,3 do
      local e = #charColors[boyfriendName]
      local a = (i%e)+1
      local colors = {}
      colors[1] = getColorFromHex(charColors[boyfriendName][a][1])
      colors[2] = getColorFromHex(charColors[boyfriendName][a][2])
      colors[3] = getColorFromHex(charColors[boyfriendName][a][3])
      setColors(i+4,colors)
    end
  end
  if charColors[dadName] then
    for i = 0,3 do
      local e = #charColors[dadName]
      local a = (i%e)+1
      local colors = {}
      colors[1] = getColorFromHex(charColors[dadName][a][1])
      colors[2] = getColorFromHex(charColors[dadName][a][2])
      colors[3] = getColorFromHex(charColors[dadName][a][3])
      setColors(i,colors)
    end
  end
  runHaxeCode([[
    for (strum in game.strumLineNotes){
      strum.playAnim('pressed', true);
      strum.resetAnim = 0.15;
    }
  ]])
  runHaxeCode([[game.callOnLuas('addCharColors', ['Blenis',[['fffffff','000000','000000'] ] ])]])
end
function onSpawnNote(i,d,nt,s)
  if noteTypeColors[nt] then
    local e = #noteTypeColors[nt]
    local a = (d%e)+1
    setPropertyFromGroup('notes',i,'rgbShader.r',getColorFromHex(noteTypeColors[nt][a][1]))
    setPropertyFromGroup('notes',i,'rgbShader.g',getColorFromHex(noteTypeColors[nt][a][2]))
    setPropertyFromGroup('notes',i,'rgbShader.b',getColorFromHex(noteTypeColors[nt][a][3]))
  else
    if getPropertyFromGroup('notes',i,'mustPress') then
      if charColors[boyfriendName] then
        local e = #charColors[boyfriendName]
        local a = (d%e)+1
        setPropertyFromGroup('notes',i,'rgbShader.r',getColorFromHex(charColors[boyfriendName][a][1]))
        setPropertyFromGroup('notes',i,'rgbShader.g',getColorFromHex(charColors[boyfriendName][a][2]))
        setPropertyFromGroup('notes',i,'rgbShader.b',getColorFromHex(charColors[boyfriendName][a][3]))
      end
    else
      if charColors[dadName] then
        local e = #charColors[dadName]
        local a = (d%e)+1
        setPropertyFromGroup('notes',i,'rgbShader.r',getColorFromHex(charColors[dadName][a][1]))
        setPropertyFromGroup('notes',i,'rgbShader.g',getColorFromHex(charColors[dadName][a][2]))
        setPropertyFromGroup('notes',i,'rgbShader.b',getColorFromHex(charColors[dadName][a][3]))
      end
    end
    if getPropertyFromGroup('notes', i, 'gfNote') and charColors[gfName] then
      local e = #charColors[gfName]
      local a = (d%e)+1
      setPropertyFromGroup('notes',i,'rgbShader.r',getColorFromHex(charColors[gfName][a][1]))
      setPropertyFromGroup('notes',i,'rgbShader.g',getColorFromHex(charColors[gfName][a][2]))
      setPropertyFromGroup('notes',i,'rgbShader.b',getColorFromHex(charColors[gfName][a][3]))
    end
  end
end
function onEvent(n)
  if n == 'Change Character' then
    for i = 0, getProperty('notes.length')-1 do
      local d = getPropertyFromGroup('notes', i, 'noteData')
      local nt = getPropertyFromGroup('notes', i, 'noteType')
      if noteTypeColors[nt] then
        local e = #noteTypeColors[nt]
        local a = (d%e)+1
        setPropertyFromGroup('notes',i,'rgbShader.r',getColorFromHex(noteTypeColors[nt][a][1]))
        setPropertyFromGroup('notes',i,'rgbShader.g',getColorFromHex(noteTypeColors[nt][a][2]))
        setPropertyFromGroup('notes',i,'rgbShader.b',getColorFromHex(noteTypeColors[nt][a][3]))
      else
        if getPropertyFromGroup('notes',i,'mustPress') then
          if charColors[boyfriendName] then
            local e = #charColors[boyfriendName]
            local a = (d%e)+1
            setPropertyFromGroup('notes',i,'rgbShader.r',getColorFromHex(charColors[boyfriendName][a][1]))
            setPropertyFromGroup('notes',i,'rgbShader.g',getColorFromHex(charColors[boyfriendName][a][2]))
            setPropertyFromGroup('notes',i,'rgbShader.b',getColorFromHex(charColors[boyfriendName][a][3]))
          end
        else
          if charColors[dadName] then
            local e = #charColors[dadName]
            local a = (d%e)+1
            setPropertyFromGroup('notes',i,'rgbShader.r',getColorFromHex(charColors[dadName][a][1]))
            setPropertyFromGroup('notes',i,'rgbShader.g',getColorFromHex(charColors[dadName][a][2]))
            setPropertyFromGroup('notes',i,'rgbShader.b',getColorFromHex(charColors[dadName][a][3]))
          end
        end
        if getPropertyFromGroup('notes', i, 'gfNote') and charColors[gfName] then
          local e = #charColors[gfName]
          local a = (d%e)+1
          setPropertyFromGroup('notes',i,'rgbShader.r',getColorFromHex(charColors[gfName][a][1]))
          setPropertyFromGroup('notes',i,'rgbShader.g',getColorFromHex(charColors[gfName][a][2]))
          setPropertyFromGroup('notes',i,'rgbShader.b',getColorFromHex(charColors[gfName][a][3]))
        end
      end
    end
  end
end
function goodNoteHit(i,d)
  local colors = {}
  colors[1] = getPropertyFromGroup('notes',i,'rgbShader.r')
  colors[2] = getPropertyFromGroup('notes',i,'rgbShader.g')
  colors[3] = getPropertyFromGroup('notes',i,'rgbShader.b')
  setColors(d+4,colors)
end
function opponentNoteHit(i,d)
  local colors = {}
  colors[1] = getPropertyFromGroup('notes',i,'rgbShader.r')
  colors[2] = getPropertyFromGroup('notes',i,'rgbShader.g')
  colors[3] = getPropertyFromGroup('notes',i,'rgbShader.b')
  setColors(d,colors)
end
function noteMiss(i,d)
  if getPropertyFromGroup('notes',i,'hitCausesMiss') then
    local colors = {}
    colors[1] = getPropertyFromGroup('notes',i,'rgbShader.r')
    colors[2] = getPropertyFromGroup('notes',i,'rgbShader.g')
    colors[3] = getPropertyFromGroup('notes',i,'rgbShader.b')
    setColors(d+4,colors)
  end
end
function setColors(d,colors)
  setPropertyFromGroup('strumLineNotes',d,'rgbShader.r', colors[1])
  setPropertyFromGroup('strumLineNotes',d,'rgbShader.g', colors[2])
  setPropertyFromGroup('strumLineNotes',d,'rgbShader.b', colors[3])
end
function addCharColors(char, colors)
  charColors[char] = colors
end
function addNoteColors(t, colors)
  noteTypeColors[t] = colors
end


function onCreatePost()
    setTextColor('scoreTxt', getHealthColor('dad'));
    setTextColor('botplayTxt', getHealthColor('dad'));
end
function onUpdatePost(e)
    setProperty('iconP1.origin.x', 20);
    setProperty('iconP1.origin.y', 0);
    setProperty('iconP2.origin.x', 80);
    setProperty('iconP2.origin.y', 0);
    setProperty('iconP1.scale.x', lerp(getProperty('iconP1.scale.x'), 1, 0.25));
    setProperty('iconP2.scale.x', lerp(getProperty('iconP2.scale.x'), 1, 0.25));
    if ratingFC == 'SFC' or ratingFC == 'GFC' or ratingFC == 'FC' or ratingFC == 'SDCB' or ratingFC == 'Clear' then
        setTextString('scoreTxt', 'Bitrate: '..getProperty('songScore')..'  //  Ping: '..getProperty('songMisses')..'  //  Accuracy: '..(math.floor(getProperty('ratingPercent') * 10000) / 100)..'%  //  ['..ratingFC..']');
    else
        setTextString('scoreTxt', 'Bitrate: '..getProperty('songScore')..'  //  Ping: '..getProperty('songMisses')..'  //  Accuracy: '..(math.floor(getProperty('ratingPercent') * 10000) / 100)..'%  //  N/A');
    end
end
function onEndSong()
    setProperty('timeBarBGS.visible', false);
end
function getHealthColor(char)
    return string.format('%02x%02x%02x', getProperty(char..'.healthColorArray[0]'), getProperty(char..'.healthColorArray[1]'), getProperty(char..'.healthColorArray[2]'))
end

function lerp(a,b,t) return a * (1-t) + b * t end --https://love2d.org/forums/viewtopic.php?t=83180
