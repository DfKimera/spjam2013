package characters;

import engine.Assets;
import engine.Character;
import flixel.FlxG;

class Hunter3 extends Character
{
    
    public static final SPRITE = "assets/character_hunter3.png";
    
    public static final PORTRAIT_DEFAULT = "assets/portrait_hunter3.png";
    
    public static final SOUND_JAILED = "assets/voice/hunter3_jailed.mp3";
    public static final SOUND_DIALOG = "assets/voice/hunter3_dialog.mp3";
    
    public function new()
    {
        super();
        loadGraphic(Assets.graphic(SPRITE), true, 151, 179);
        animation.add("jailed", [0]);
        animation.add("released", [1]);
        animation.play("jailed");
    }
    
    override public function setCharacterInfo() : Void
    {
        this.characterName = "Caçador";
        addPortrait("default", PORTRAIT_DEFAULT, false);
    }
}

