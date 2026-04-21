package engine;

import flixel.FlxG;
import flixel.graphics.FlxGraphic;
import flixel.sound.FlxSound;
import engine.Assets;
import engine.Assets.Assets.graphic;

class Assets {
    public static function graphic(path: String): FlxGraphic {
        return FlxG.bitmap.add(path);
    }
}
