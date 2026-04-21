package props;

import engine.Assets;
import engine.Item;
import engine.Prop;

class LianaPlaced extends Prop
{
    
    public static final SPRITE = "assets/prop_liana.png";
    
    public function new()
    {
        super();
        loadGraphic(Assets.graphic(SPRITE));
    }
}

