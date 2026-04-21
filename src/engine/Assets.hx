package engine;

import flixel.graphics.FlxGraphic;

class Assets {
    public static function graphic(path: String): FlxGraphic {
        return FlxGraphic.fromAssetKey(path);
    }
}
