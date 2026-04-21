package engine;

import flixel.FlxG;
import flixel.graphics.FlxGraphic;

class Assets {
    public static function graphic(path: String): FlxGraphic {
        return FlxG.bitmap.add(path);
    }
}
