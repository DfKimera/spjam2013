package items;

import items.RopeHook;
import engine.Inventory;
import engine.Item;

class Hook extends Item
{
    
    public static final ICON_SPRITE = "assets/item_hook.png";
    
    public static final PLACED_SPRITE = "assets/item_hook.png";
    
    public function new()
    {
        super(ICON_SPRITE, PLACED_SPRITE);
    }
    
    override public function onCombine(item : Item) : Void
    {
        if (Std.is(item, Liana))
        {
            item.consume();
            this.consume();
            Inventory.addToInventory(new RopeHook());
        }
    }
}

