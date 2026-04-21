package characters;

import engine.Assets;
import engine.Character;
import engine.Item;
import flixel.FlxG;

class Sherlock extends Character
{
    
    public static final SPRITE = "assets/character_sherlock.png";
    
    public static final PORTRAIT_DEFAULT = "assets/portrait_sherlock.png";
    
    public static final SOUND_DIALOG = "assets/voice/sherlock_dialog.mp3";
    public static final SOUND_SURPRISE = "assets/voice/sherlock_surprise.mp3";
    public static final SOUND_TAUNT = "assets/voice/sherlock_taunt.mp3";
    public static final SOUND_WONDER = "assets/voice/sherlock_wonder.mp3";
    
    public function new()
    {
        super();
        loadGraphic(Assets.graphic(SPRITE));
    }
    
    override public function setCharacterInfo() : Void
    {
        this.characterName = "Xerox Holmes";
        this.setPortraits({idle : [PORTRAIT_DEFAULT, (false : Dynamic)]});
    }
}

