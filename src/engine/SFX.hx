package engine;

import flixel.FlxG;

class SFX
{
    
    public static final SFX_CLICK = "assets/sfx/key.mp3";
    public static final SFX_USE = "assets/sfx/move.mp3";
    public static final SFX_PICK = "assets/sfx/select1.mp3";
    public static final SFX_BELL = "assets/sfx/select2.mp3";
    
    public static function play(name : String) : Void
    {
        var sound : String = Reflect.field(SFX, "SFX_" + name.toUpperCase());
        trace("SFX: ", sound);
        FlxG.sound.play(sound, 0.5);
    }

    public function new()
    {
    }
}

