function onCreate() 

	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf_ourple')
	makeLuaSprite('backstage','cucky', -550,-580)
	scaleObject('backstage', 99, 99)
	updateHitbox('backstage')
	setProperty('backstage.antialiasing', false)
	addLuaSprite('backstage',false)
	close(true)

end