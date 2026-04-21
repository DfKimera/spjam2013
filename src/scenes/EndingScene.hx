package scenes;

import characters.Curupira;
import characters.Sherlock;
import engine.Dialog;
import engine.Item;
import engine.Prop;
import engine.Scene;

class EndingScene extends Scene
{
    
    public static final BACKGROUND = "assets/scene_ending.jpg";
    
    public var sherlock : Sherlock;
    public var curupira : Curupira;
    
    override public function prepare() : Void
    {
        setBackground(BACKGROUND);
        setFadeInDelay(1);
        Game.playMusic("story");
    }
    
    override public function create() : Void
    {
        super.create();
        
        sherlock = new Sherlock();
        curupira = new Curupira();
        
        Prop.placeOnScene(this, curupira, 540, 225);
        
        Dialog.show(this, sherlock, "Veja, Epson! Um capiroto!").sound("surprise");
        Dialog.show(this, curupira, "Meu nome é Curupira!").sound("me");
        Dialog.show(this, sherlock, "Você tem os pés pra trás!").sound("dialog");
        var lastDialog : Dialog = Dialog.show(this, curupira, "Você que tem o corpo ao contrário!").sound("you");
        lastDialog.onCloseCallback = function() : Void
                {
                    Game.showEpilogue();
                };
    }

    public function new()
    {
        super();
    }
}

