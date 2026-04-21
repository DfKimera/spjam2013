package items;

import engine.Inventory;
import engine.Item;

class ScissorsPiece2 extends Item
{
    
    public static final ICON_SPRITE = "assets/item_scissor_piece2.png";
    
    public static final PLACED_SPRITE = "assets/item_scissor_piece1_placed.png";
    
    public function new()
    {
        super(ICON_SPRITE, PLACED_SPRITE);
    }
    
    override public function onPick() : Void{
    }
    
    override public function onCombine(item : Item) : Void
    {
        if (Std.is(item, ScissorsPiece1))
        {
            var scissors : Scissors = new Scissors();
            
            item.consume();
            this.consume();
            
            Inventory.addToInventory(scissors);
        }
    }
    
    override public function onConsume() : Void{
    }
}

