package props;

import engine.Assets;
import engine.Item;
import engine.Prop;

class Hole extends Prop
{
    
    public static final SPRITE = "assets/prop_hole.png";
    
    public function new()
    {
        super();
        loadGraphic(Assets.graphic(SPRITE));
    }
}

