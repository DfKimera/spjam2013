package characters;

import engine.Assets;
import engine.Character;
import engine.Item;
import flixel.FlxG;

class Curupira extends Character
{
    
    public static final SPRITE = "assets/character_curupira.png";
    
    public static final PORTRAIT_DEFAULT = "assets/portrait_curupira.png";
    
    public static final SOUND_ME = "assets/voice/curupira_me.mp3";
    public static final SOUND_YOU = "assets/voice/curupira_you.mp3";
    
    public function new()
    {
        super();
        loadGraphic(Assets.graphic(SPRITE));
    }
    
    override public function setCharacterInfo() : Void
    {
        this.characterName = "Curupira";
        addPortrait("default", PORTRAIT_DEFAULT, false);
    }
}

