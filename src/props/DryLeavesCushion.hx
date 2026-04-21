package props;

import engine.Assets;
import engine.Item;
import engine.Prop;

class DryLeavesCushion extends Prop
{
    
    public static final SPRITE = "assets/item_dryleaves_placed.png";
    
    public function new()
    {
        super();
        loadGraphic(Assets.graphic(SPRITE));
    }
}

