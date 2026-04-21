package items;

import engine.Item;

class Plank extends Item
{
    
    public static final ICON_SPRITE = "assets/item_plank.png";
    
    public static final PLACED_SPRITE = "assets/item_plank_placed.png";
    
    public function new()
    {
        super(ICON_SPRITE, PLACED_SPRITE);
    }
    
    override public function onPick() : Void{
    }
    
    override public function onCombine(item : Item) : Void{
    }
    
    override public function onConsume() : Void{
    }
}

