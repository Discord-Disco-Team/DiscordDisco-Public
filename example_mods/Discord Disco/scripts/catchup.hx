// script by subpurr [[discord: subpurrowo]]
// please do not use without credit.
// no explicit permission needed to use

// CONFIG:
final TIMER_LENGTH:Float = 0.25; // length in seconds for initial note drawback
final WARPY_LENGTH:Float = 0.25; // length in seconds for song speed warp
final WARP_SECONDS:Float = 0.3;  // how much time in seconds do the notes rewind

final START_TIME = 0.5;
function compNumTween(twn:FlxTween) {
    if (twn != null && twn.onComplete != null) {
        twn.onComplete(twn);
        twn.cancel();
    }
}

var newPos:Float = 0;
var stunSet:Bool = false;
var isStunned:Bool = false;

var curPlayback:Float = 1;
var curScrSpeed:Float = 1;
var curPosition:Float = 0;

var subPauseSpeed:FlxTween;
var subConduction:FlxTween;
var strumColors:Array<Int> = [0xFFFFFF, 0xFFFFFF, 0xFFFFFF, 0xFFFFFF]; // why do i bother with storing these again...

var bfHold:Float = 0;
var gfHold:Float = 0;
var ddHold:Float = 0;
function onResume() {
    compNumTween(subPauseSpeed);

    if (Conductor.songPosition > curPosition) {
        curPosition = Conductor.songPosition;
        if (Conductor.songPosition > WARP_SECONDS * 1000)
            newPos = Conductor.songPosition - WARP_SECONDS * 1000;
        else
            newPos = 0;
    }

    if (Conductor.songPosition > 0) {
        subConduction = FlxTween.num(Conductor.songPosition, newPos, TIMER_LENGTH * Math.max(1, Math.min(game.songSpeed, 0.75)),
            {ease: FlxEase.circOut,
            onComplete: () -> {
                PlayState.instance.setSongTime(Conductor.songPosition = newPos);
            }},
            (num) -> {
                PlayState.instance.setSongTime(Conductor.songPosition = num);
            }
        );
        subConduction.then(
            subPauseSpeed = FlxTween.num(START_TIME * curPlayback, curPlayback, WARPY_LENGTH * Math.min(1, (Conductor.songPosition / newPos) ^ 2),
                {onComplete: () -> {
                    game.playbackRate = curPlayback;
                    game.songSpeed = curScrSpeed;
                }},
                (num) -> {
                    game.playbackRate = num;
                    game.songSpeed = curScrSpeed / curPlayback * num;
                }
            )
        );

        if (!stunSet) {
            stunSet = true;
            isStunned = game.boyfriend.stunned;
            game.boyfriend.stunned = true;
            for (strummy in 0...game.playerStrums.length) {
                strumColors[strummy] = game.playerStrums.members[strummy].color;
                game.playerStrums.members[strummy].color = 0x777777;
            }
        }
    }

    curPlayback = game.playbackRate;
    curScrSpeed = game.songSpeed;

    bfHold = game.boyfriend.holdTimer;
    if (game.gf != null)
        gfHold = game.gf.holdTimer;
    ddHold = game.dad.holdTimer;

    var bg:FlxSprite = new FlxSprite().makeGraphic(1, 1, FlxColor.BLACK);
    bg.scale.set(FlxG.width, FlxG.height);
    bg.updateHitbox();
    bg.alpha = 0.5;
    bg.scrollFactor.set();
    add(bg);
    bg.cameras = [FlxG.cameras.list[FlxG.cameras.list.length - 1]];

    game.modchartTweens.set('subPauseFade', FlxTween.tween(bg, {alpha: 0}, TIMER_LENGTH, {
        onComplete: () -> {
            bg.destroy();
        }
    }));
}

function onUpdatePost(elapsed) {
    if (stunSet) {
        if (Conductor.songPosition >= curPosition - elapsed * 1250) {
            stunSet = false;
            game.boyfriend.stunned = isStunned;
            for (strummy in 0...game.playerStrums.length) {
                if (game.playerStrums.members[strummy].color == 0x777777)
                    game.playerStrums.members[strummy].color = strumColors[strummy];
            }
        } else {
            game.boyfriend.holdTimer = bfHold;
            if (game.gf != null)
                game.gf.holdTimer = gfHold;
            game.dad.holdTimer = ddHold;
        }
    }
}