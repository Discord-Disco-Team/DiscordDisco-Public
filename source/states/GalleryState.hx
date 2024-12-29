package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.group.FlxGroup.FlxTypedGroup;

import flixel.math.FlxMath;
import flixel.addons.display.FlxBackdrop;
import flixel.addons.display.FlxGridOverlay;

import flixel.addons.display.FlxRuntimeShader;
import sys.io.File;
import openfl.filters.ShaderFilter;
import haxe.Json;

class GalleryState extends MusicBeatState
{
    // DATA STUFF
    var itemGroup:FlxTypedGroup<GalleryImage>;

    var imagePaths:Array<String>;
    var imageDescriptions:Array<String>;
    var imageTitle:Array<String>;
    var linkOpen:Array<String>;
    var descriptionText:FlxText;
    var controlsText:FlxText;
    var tvShader:FlxRuntimeShader;

    var currentIndex:Int = 0;
    var allowInputs:Bool = true;

    // UI STUFF
    var imageSprite:FlxSprite;
    var background:FlxSprite;
    var titleText:FlxText;
    var bars:FlxSprite;
    var backspace:FlxSprite;
    
    // Customize the image path here
    var imagePath:String = "gallery/";

    override public function create():Void
    {   
        FlxG.sound.playMusic(Paths.music("galleryMusic"));

        var jsonData:String = File.getContent("assets/shared/images/gallery/gallery.json");
        var imageData:Array<ImageData> = haxe.Json.parse(jsonData);

        imagePaths = [];
        imageDescriptions = [];
        imageTitle = [];
        linkOpen = [];
        
        for (data in imageData) {
            imagePaths.push(data.path);
            imageDescriptions.push(data.description);
            imageTitle.push(data.title);
            linkOpen.push(data.link);
        }
    
        itemGroup = new FlxTypedGroup<GalleryImage>();
    
        for (i in 0...imagePaths.length) {
            var newItem = new GalleryImage();
            newItem.loadGraphic(Paths.image(imagePath + imagePaths[i]));
            newItem.antialiasing = ClientPrefs.data.antialiasing;
            newItem.screenCenter();
            newItem.ID = i;
            itemGroup.add(newItem);
        }
    
        background = new FlxSprite(10, 50).loadGraphic(Paths.image("gallery/ui/background"));
        background.screenCenter();
        add(background);

        var grid:FlxBackdrop = new FlxBackdrop(FlxGridOverlay.createGrid(80, 80, 160, 160, true, 0x33FFFFFF, 0x0));
        grid.velocity.set(-40, 40);
        grid.alpha = 0;
        FlxTween.tween(grid, {alpha: 0.75}, 0.15, {ease: FlxEase.quadOut});
        add(grid);

        bars = new FlxSprite(10, 50).loadGraphic(Paths.image("gallery/ui/bars"));
        bars.screenCenter();
        add(bars);

        add(itemGroup);
    
        descriptionText = new FlxText(50, -100, FlxG.width - 100, imageDescriptions[currentIndex]);
        descriptionText.setFormat("sansman.ttf", 25, 0xffffff, "center");
        descriptionText.screenCenter();
        descriptionText.y += 275;
        descriptionText.setFormat(Paths.font("sansman.ttf"), 32);
        add(descriptionText);

        controlsText = new FlxText(50, -100, FlxG.width - 100, "Left and Right to move, Up and Down to move 3x, esc to exit");
        controlsText.setFormat("vcr.ttf", 15, 0xFFFF00FF, "left");
        controlsText.screenCenter();
        controlsText.y += 325;
        controlsText.setFormat(Paths.font("vcr.ttf"), 20);
        add(controlsText);
    
        titleText = new FlxText(50, 50, FlxG.width - 100, imageTitle[currentIndex]);
        titleText.screenCenter(X);
        titleText.setFormat(null, 40, 0xffffff, "center");
        titleText.setFormat(Paths.font("sansman.ttf"), 32);
        add(titleText);
    
        persistentUpdate = true;
        changeSelection();
    
        super.create();
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        if ((controls.UI_LEFT_P || controls.UI_RIGHT_P) && allowInputs) {
            changeSelection(controls.UI_LEFT_P ? -1 : 1);
            FlxG.sound.play(Paths.sound("scrollMenu"));
        }

        if ((controls.UI_DOWN_P || controls.UI_UP_P) && allowInputs) {
            changeSelection(controls.UI_DOWN_P ? -3 : 3);
            FlxG.sound.play(Paths.sound("scrollMenu"));
        }
    
        if (controls.BACK && allowInputs)
        {
            allowInputs = false;
            FlxG.sound.play(Paths.sound('cancelMenu'));
            MusicBeatState.switchState(new MainMenuState());
            FlxG.sound.playMusic(Paths.music('freakyMenu'));
        }
    
        if (controls.ACCEPT && allowInputs)
            CoolUtil.browserLoad(linkOpen[currentIndex]);
    }
    
    private function changeSelection(i:Int = 0)
    {
        currentIndex = FlxMath.wrap(currentIndex + i, 0, imageTitle.length - 1);
    
        descriptionText.text = imageDescriptions[currentIndex];
        titleText.text = imageTitle[currentIndex]; 

        var change = 0;
        for (item in itemGroup) {
            item.posX = change++ - currentIndex;
            item.alpha = (item.ID == currentIndex) ? 1 : 0.6;
        }
    }
}

class GalleryImage extends FlxSprite {
    public var lerpSpeed:Float = 6;
    public var posX:Float = 0;
    
    override function update(elapsed:Float) {
        super.update(elapsed);
        x = FlxMath.lerp(x, (FlxG.width - width) / 2 + posX * 760, boundTo(elapsed * lerpSpeed, 0, 1));
    }
}

function boundTo(value:Float, min:Float, max:Float):Float {
    var newValue:Float = value;
    if(newValue < min) newValue = min;
    else if(newValue > max) newValue = max;
    return newValue;
}

typedef ImageData = {
    path:String,
    description:String,
    title:String,
    link:String
}
