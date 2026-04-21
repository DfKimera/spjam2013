package props;

import engine.Assets;
import engine.Item;
import engine.Prop;

class Footprints extends Prop
{
    
    public static final SPRITE = "assets/prop_footprints.png";
    
    public function new()
    {
        super();
        loadGraphic(Assets.graphic(SPRITE));
    }
    
    /**
		 * Called when the player interacts with this prop.
		 */
    override public function onInteract() : Void{
    }
    
    /**
		 * Called when an item is used on this prop.
		 * @param item Iten The used item.
		 */
    override public function onItemUse(item : Item) : Void{
    }
}

