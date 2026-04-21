package props;

import engine.Assets;
import engine.Prop;

class BoulderWithPlank extends Prop
{
    
    public static final SPRITE = "assets/prop_boulder_with_plank.png";
    
    public function new()
    {
        super();
        loadGraphic(Assets.graphic(SPRITE));
    }
}

