function onCreatePost()
	addHaxeLibrary('ClientPrefs')
	addHaxeLibrary('StrumNote')

	runHaxeCode([[
		for (i in 0...4) {
			var third = new StrumNote(0, game.strumLine.y, i + 4, 0);
			third.alpha = 0;

			third.downScroll = ClientPrefs.downScroll;
			game.strumLineNotes.insert(i + 4, third);

			game.opponentStrums.add(third);
			third.postAddedToGroup();

			third.cameras = [game.camHUD];
			setVar('third' + i, third);
		};

		for (i in 0...game.strumLineNotes.members.length) game.strumLineNotes.members[i].scale.set(0.67, 0.67);

		for (i in 0...game.unspawnNotes.length) {
			if (game.unspawnNotes[i].noteType == 'GF Sing' && !game.unspawnNotes[i].mustPress) {
				game.unspawnNotes[i].noteData += 4;
			};
			if (!game.unspawnNotes[i].isSustainNote) game.unspawnNotes[i].scale.set(0.67, 0.67);
		};
	]])

	for i = 0, 3 do
		setPropertyFromGroup("opponentStrums", i + 4, "x", (104 * (i + 4)) + 14)
	end
end

singAnimations = {[0] = 'singLEFT', [1] = 'singDOWN', [2] = 'singUP', [3] = 'singRIGHT'}
function opponentNoteHit(i, d, t, s)
	if t == 'GF Sing' then
		playAnim('gf', singAnimations[d - 4], true)

		-- Useless 2-line code
		--[[runHaxeCode([[
			game.opponentStrums.members[].. d + 4 ..[].playAnim('confirm', true);
			game.opponentStrums.members[].. d + 4 ..[].resetAnim = 0.15;
		]]--)
	end
end

defaultOpponentStrumXs = {[0] = 92, [1] = 204, [2] = 316, [3] = 428}
defaultPlayerStrumXs = {[0] = 732, [1] = 844, [2] = 956, [3] = 1068}
function onEvent(name, v1)
	if name == 'Toggle Third Strumline' then
		if v1 == 'true' then
			for i = 0, 11 do
				doTweenX("strumX"..i, "strumLineNotes.members["..i.."]", (104 * i) + 14, 0.5, 'quintOut')
			end
			for i = 0, 3 do
				doTweenAlpha("thirdStrumAlpha"..i, "opponentStrums.members[".. i + 4 .."]", 1, 0.5, 'quintOut')
			end
		else
			for i = 0, 3 do
				doTweenX("strumX"..i..'_1', "opponentStrums.members[".. i .."]", defaultOpponentStrumXs[i], 0.5, 'quintOut')
				doTweenX("strumX"..i..'_2', "playerStrums.members[".. i .."]", defaultPlayerStrumXs[i], 0.5, 'quintOut')
			end
			for i = 0, 3 do
				doTweenAlpha("thirdStrumAlpha"..i, "opponentStrums.members[".. i + 4 .."]", 0, 0.5, 'quintOut')
			end
		end
		-- TBA
	end
end

function onUpdatePost(elapsed)
	runHaxeCode([[
		// For strum fade
		for (i in 0...game.unspawnNotes.length) {
			game.unspawnNotes[i].x = game.strumLineNotes.members[game.unspawnNotes[i].noteData].x;
			game.unspawnNotes[i].alpha = game.strumLineNotes.members[game.unspawnNotes[i].noteData].alpha;
			if (game.unspawnNotes[i].isSustainNote) game.unspawnNotes[i].alpha -= 0.4;
		}

		for (i in 0...game.notes.members.length) {
			game.notes.members[i].alpha = game.strumLineNotes.members[game.notes.members[i].noteData].alpha;
			if (game.notes.members[i].isSustainNote) game.notes.members[i].alpha -= 0.4;
		};
	]])
end