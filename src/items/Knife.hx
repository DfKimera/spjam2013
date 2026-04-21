package items;

import engine.Item;

class Knife extends Item
{
    
    public static final ICON_SPRITE = "assets/item_knife.png";
    
    public static final PLACED_SPRITE = "assets/item_knife.png";
    
    public function new()
    {
        super(ICON_SPRITE, PLACED_SPRITE);
    }
}

