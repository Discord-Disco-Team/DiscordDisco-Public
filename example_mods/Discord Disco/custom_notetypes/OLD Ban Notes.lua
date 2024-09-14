function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('OldBanNotes.length')-1 do
		--Check if the note is a Fire Note
		if getPropertyFromGroup('OldBanNotes', i, 'noteType') == 'OLD Ban Notes' then
			setPropertyFromGroup('OldBanNotes', i, 'texture', 'NOTE_Ban_assets-OLD'); --Change texture --Change note splash texture
			--setPropertyFromGroup('OldBanNotes', i, 'x', getPropertyFromGroup('OldBanNotes', i, 'x')-166);

			if getPropertyFromGroup('OldBanNotes', i, 'mustPress') then --Lets Opponent's instakill notes get ignored
				setPropertyFromGroup('OldBanNotes', i, 'ignoreNote', true); --Miss has no penalties
			else
				setPropertyFromGroup('OldBanNotes', i, 'ignoreNote', true);
			end
		end
	end
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Ban Notes' then
		setProperty('health', getProperty('health')-1);
		characterPlayAnim('boyfriend', 'hurt', true);
		setProperty('boyfriend.specialAnim', true);
		ghostmisses = ghostmisses + 1;
		ghostmisses = ghostmisses + 1;
	end
end