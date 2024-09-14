import sys.FileSystem;
import backend.Mods;

using StringTools;

function onCreatePost()
{
    if (FileSystem.exists("mods/" + Mods.currentModDirectory + "/songs/" + StringTools.replace(game.curSong.toLowerCase(), " ", "-") + "/Voices-" + game.boyfriend.curCharacter + ".ogg")) {
        Paths.voices(game.curSong, game.boyfriend.curCharacter);
        game.vocals.loadEmbedded(Paths.returnSound(null, StringTools.replace(game.curSong.toLowerCase(), " ", "-") + "/Voices-" + game.boyfriend.curCharacter, 'songs'));
    }
}