package options;

import states.MainMenuState;
import backend.StageData;

class OptionsState extends MusicBeatState
{
	var options:Array<String> = ['Note Colors', 'Controls', 'Delay + Combo', 'Graphics', 'Visuals + UI', 'Gameplay'];
	private var grpOptions:FlxTypedGroup<Alphabet>;
	private static var curSelected:Int = 0;
	private static var curSelectedPeep:Int = 0;
	public static var menuBG:FlxSprite;
	public static var onPlayState:Bool = false;

	var luigi:FlxSprite = new FlxSprite().loadGraphic(Paths.image('dd_menu-luigi'));
	var screen:FlxSprite = new FlxSprite().loadGraphic(Paths.image('dd_menu-screen'));
	var meko:FlxSprite = new FlxSprite().loadGraphic(Paths.image('dd_menu-meko'));
	var iron:FlxSprite = new FlxSprite().loadGraphic(Paths.image('dd_menu-iron'));
	var goob:FlxSprite = new FlxSprite().loadGraphic(Paths.image('dd_menu-goobers'));
	var scrimblo:FlxSprite = new FlxSprite().loadGraphic(Paths.image('dd_menu-scrimblo'));

	function openSelectedSubstate(label:String) {
		switch(label) {
			case 'Note Colors':
				openSubState(new options.NotesSubState());
			case 'Controls':
				openSubState(new options.ControlsSubState());
			case 'Graphics':
				openSubState(new options.GraphicsSettingsSubState());
			case 'Visuals + UI':
				openSubState(new options.VisualsUISubState());
			case 'Gameplay':
				openSubState(new options.GameplaySettingsSubState());
			case 'Delay + Combo':
				MusicBeatState.switchState(new options.NoteOffsetState());
		}
	}

	var selectorLeft:Alphabet;
	var selectorRight:Alphabet;

	override function create() {
		#if DISCORD_ALLOWED
		DiscordClient.changePresence("Options Menu", null);
		#end

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.antialiasing = ClientPrefs.data.antialiasing;
		bg.color = 0xFFea71fd;
		bg.updateHitbox();
		bg.screenCenter();
		add(bg);

		luigi.antialiasing = ClientPrefs.data.antialiasing;
		luigi.scrollFactor.set(0, 0);
		luigi.screenCenter(X);
		luigi.visible = false;
		luigi.updateHitbox();
		add(luigi);

		screen.antialiasing = ClientPrefs.data.antialiasing;
		screen.scrollFactor.set(0, 0);
		screen.screenCenter(X);
		screen.visible = false;
		screen.updateHitbox();
		add(screen);

		meko.antialiasing = ClientPrefs.data.antialiasing;
		meko.scrollFactor.set(0, 0);
		meko.screenCenter(X);
		meko.visible = false;
		meko.updateHitbox();
		add(meko);

		iron.antialiasing = ClientPrefs.data.antialiasing;
		iron.scrollFactor.set(0, 0);
		iron.screenCenter(X);
		iron.visible = false;
		iron.updateHitbox();
		add(iron);

		goob.antialiasing = ClientPrefs.data.antialiasing;
		goob.scrollFactor.set(0, 0);
		goob.screenCenter(X);
		goob.visible = false;
		goob.updateHitbox();
		add(goob);

		scrimblo.antialiasing = ClientPrefs.data.antialiasing;
		scrimblo.scrollFactor.set(0, 0);
		scrimblo.screenCenter(X);
		scrimblo.visible = false;
		scrimblo.updateHitbox();
		add(scrimblo);

		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		for (i in 0...options.length)
		{
			var optionText:Alphabet = new Alphabet(0, 0, options[i], true);
			optionText.screenCenter();
			optionText.x = 1200;
			optionText.alignment = RIGHT;
			optionText.y += (100 * (i - (options.length / 2))) + 50;
			grpOptions.add(optionText);
		}

		selectorLeft = new Alphabet(0, 0, '<', true);
		add(selectorLeft);

		changeSelection();
		ClientPrefs.saveSettings();

		super.create();
	}

	override function closeSubState() {
		super.closeSubState();
		ClientPrefs.saveSettings();
		#if DISCORD_ALLOWED
		DiscordClient.changePresence("Options Menu", null);
		#end
	}

	override function update(elapsed:Float) {
		super.update(elapsed);

		if (controls.UI_UP_P) {
			changeSelection(-1);
		}
		if (controls.UI_DOWN_P) {
			changeSelection(1);
		}

		if (controls.BACK) {
			FlxG.sound.play(Paths.sound('cancelMenu'));
			if(onPlayState)
			{
				StageData.loadDirectory(PlayState.SONG);
				LoadingState.loadAndSwitchState(new PlayState());
				FlxG.sound.music.volume = 0;
			}
			else MusicBeatState.switchState(new MainMenuState());
		}
		else if (controls.ACCEPT) openSelectedSubstate(options[curSelected]);
	}
	
	function changeSelection(change:Int = 0) {
		curSelected += change;
		if (curSelected < 0)
			curSelected = options.length - 1;
		if (curSelected >= options.length)
			curSelected = 0;

		var bullShit:Int = 0;

		for (item in grpOptions.members) {
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			if (item.targetY == 0) {
				item.alpha = 1;
				selectorLeft.x = item.x + 20;
				selectorLeft.y = item.y;
			}
		}
		luigi.visible = (0 == curSelected);
		screen.visible = (1 == curSelected);
		meko.visible = (2 == curSelected);
		iron.visible = (3 == curSelected);
		goob.visible = (4 == curSelected);
		scrimblo.visible = (5 == curSelected);
		FlxG.sound.play(Paths.sound('scrollMenu'));
	}

	override function destroy()
	{
		ClientPrefs.loadPrefs();
		super.destroy();
	}
}