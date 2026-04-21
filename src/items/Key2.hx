package items;

import engine.Item;

class Key2 extends Item
{
    
    public static final ICON_SPRITE = "assets/item_key_gold.png";
    
    public static final PLACED_SPRITE = "assets/item_keyglint.png";
    
    public function new()
    {
        super(ICON_SPRITE, PLACED_SPRITE);
    }
}

