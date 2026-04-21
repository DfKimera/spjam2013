package items;

import engine.Item;

class RustyKnife extends Item
{
    
    public static final ICON_SPRITE = "assets/item_rusty_knife.png";
    
    public static final PLACED_SPRITE = "assets/item_rusty_knife_placed.png";
    
    public function new()
    {
        super(ICON_SPRITE, PLACED_SPRITE);
    }
}

