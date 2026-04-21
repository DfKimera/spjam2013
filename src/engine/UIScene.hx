package engine;

import flixel.FlxG;

class UIScene extends Scene
{
    
    override public function update(elapsed:Float) : Void
    {
        if (!isReady)
        {
            return;
        }
        if (FlxG.keys.justPressed.ESCAPE)
        {
            Game.goToMainMenu();
        }
    }
    
    override private function hasInventoryEnabled() : Bool
    {
        return false;
    }

    public function new()
    {
        super();
    }
}

