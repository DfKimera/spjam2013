package items;

import items.RopeHook;
import engine.Inventory;
import engine.Item;

class Liana extends Item
{
    
    public static final ICON_SPRITE = "assets/item_liana.png";
    
    public static final PLACED_SPRITE = "assets/item_liana.png";
    
    public function new()
    {
        super(ICON_SPRITE, PLACED_SPRITE);
    }
    
    override public function onCombine(item : Item) : Void
    {
        if (Std.is(item, Hook))
        {
            item.consume();
            this.consume();
            Inventory.addToInventory(new RopeHook());
        }
    }
}

