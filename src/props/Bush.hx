package props;

import engine.Assets;
import engine.Prop;

class Bush extends Prop
{
    
    public static final SPRITE = "assets/prop_bush.png";
    
    public function new()
    {
        super();
        loadGraphic(Assets.graphic(SPRITE));
    }
}

