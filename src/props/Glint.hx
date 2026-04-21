package props;

import engine.Assets;
import engine.Prop;

class Glint extends Prop
{
    
    public static final SPRITE = "assets/item_keyglint.png";
    
    public function new()
    {
        super();
        loadGraphic(Assets.graphic(SPRITE));
    }
}

