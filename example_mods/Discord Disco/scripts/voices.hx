import sys.FileSystem;
import backend.Mods;

using StringTools;

function onSongStart()
{
    
    if (FileSystem.exists("mods/" + Mods.currentModDirectory + "/songs/" + StringTools.replace(game.curSong.toLowerCase(), " ", "-") + "/Voices-" + game.boyfriend.curCharacter + ".ogg")) {
        debugPrint('test');
        Paths.voices(game.curSong, game.boyfriend.curCharacter);
        game.vocals.loadEmbedded(Paths.returnSound(null, StringTools.replace(game.curSong.toLowerCase(), " ", "-") + "/Voices-" + game.boyfriend.curCharacter, 'songs'));
    }
}