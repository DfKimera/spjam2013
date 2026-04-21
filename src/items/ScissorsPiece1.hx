package items;

import engine.Inventory;
import engine.Item;

class ScissorsPiece1 extends Item
{
    
    public static final ICON_SPRITE = "assets/item_scissor_piece1.png";
    
    public static final PLACED_SPRITE = "assets/item_scissor_piece1_placed.png";
    
    public function new()
    {
        super(ICON_SPRITE, PLACED_SPRITE);
    }
    
    override public function onPick() : Void{
    }
    
    override public function onCombine(item : Item) : Void
    {
        if (Std.is(item, ScissorsPiece2))
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

