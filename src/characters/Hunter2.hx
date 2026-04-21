package characters;

import engine.Assets;
import engine.Character;
import flixel.FlxG;

class Hunter2 extends Character
{
    
    public static final SPRITE = "assets/character_hunter2.png";
    
    public static final PORTRAIT_DEFAULT = "assets/portrait_hunter2.png";
    
    
    public static final SOUND_HOLE = "assets/voice/hunter2_hole.mp3";
    public static final SOUND_DIALOG = "assets/voice/hunter2_dialog.mp3";
    
    public function new()
    {
        super();
        loadGraphic(Assets.graphic(SPRITE));
    }
    
    override public function setCharacterInfo() : Void
    {
        this.characterName = "Caçador";
        addPortrait("default", PORTRAIT_DEFAULT, false);
    }
}

