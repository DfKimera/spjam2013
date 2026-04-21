package props;

import engine.Assets;
import engine.Prop;

class Rock extends Prop
{
    
    public static final SPRITE = "assets/prop_rock.png";
    
    public function new()
    {
        super();
        loadGraphic(Assets.graphic(SPRITE));
    }
}

