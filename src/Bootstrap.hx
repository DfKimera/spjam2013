import Game;
import flash.display.Sprite;

class Bootstrap extends Sprite
{
    
    public static var game : Game;
    public static var instance : Bootstrap;
    
    public function new()
    {
        super();
        
        Bootstrap.instance = this;
        Bootstrap.game = new Game();
        addChild(Bootstrap.game);
    }
}

