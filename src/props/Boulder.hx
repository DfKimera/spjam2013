package props;

import engine.Assets;
import engine.Prop;

class Boulder extends Prop
{
    
    public static final SPRITE = "assets/prop_boulder.png";
    
    public function new()
    {
        super();
        loadGraphic(Assets.graphic(SPRITE));
    }
}

