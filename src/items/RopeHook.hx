package items;

import engine.Item;

class RopeHook extends Item
{
    
    public static final ICON_SPRITE = "assets/item_rope_hook.png";
    
    public static final PLACED_SPRITE = "assets/item_rope_hook.png";
    
    public function new()
    {
        super(ICON_SPRITE, PLACED_SPRITE);
    }
}

