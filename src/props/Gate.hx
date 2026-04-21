package props;

import engine.Assets;
import engine.Item;
import engine.Prop;

class Gate extends Prop
{
    
    public static final SPRITE = "assets/prop_gate.png";
    
    public function new()
    {
        super();
        loadGraphic(Assets.graphic(SPRITE), true, 149, 339);
        animation.add("open", [0]);
        animation.add("closed", [1]);
        animation.play("closed");
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

