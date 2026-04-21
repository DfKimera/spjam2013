package characters;

import engine.Assets;
import engine.Character;

class Hunter1 extends Character
{
    
    public static final SPRITE = "assets/character_hunter1.png";
    
    public static final PORTRAIT_DEFAULT = "assets/portrait_hunter1.png";
    public static final PORTRAIT_HANGING = "assets/portrait_hunter1_hanging.png";
    
    public static final SOUND_CRY = "assets/voice/hunter1_cry.mp3";
    public static final SOUND_DIALOG = "assets/voice/hunter1_dialog.mp3";
    public static final SOUND_THANKS = "assets/voice/hunter1_thanks.mp3";
    
    public function new()
    {
        super();
        loadGraphic(Assets.graphic(SPRITE), true, 161, 516);
        animation.add("hanging", [0]);
        animation.add("sitting", [1]);
        animation.play("hanging");
    }
    
    override public function setCharacterInfo() : Void
    {
        this.characterName = "Caçador";
        addPortrait("default", PORTRAIT_DEFAULT, false);
        addPortrait("hanging", PORTRAIT_HANGING, false);
    }
}

