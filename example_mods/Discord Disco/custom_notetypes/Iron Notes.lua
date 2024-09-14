function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Iron Notes
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Iron Notes' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_Iron_assets'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', 1); --Change amount of health to take when you miss like a fucking moron
		end
	end
	--debugPrint('Script started!')
end

function badNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Iron Notes' then
		setProperty('health', getProperty('health')-1);
		characterPlayAnim('boyfriend', 'hurt', true);
		setProperty('boyfriend.specialAnim', true);
		ghostmisses = ghostmisses + 1;
		ghostmisses = ghostmisses + 1;
	end
end