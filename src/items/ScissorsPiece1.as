package items {

import engine.Inventory;
import engine.Item;

	public class ScissorsPiece1 extends Item {

		[Embed(source="../../assets/item_scissor_piece1.png")]
		public var ICON_SPRITE:Class;

		[Embed(source="../../assets/item_scissor_piece1_placed.png")]
		public var PLACED_SPRITE:Class;

		public function ScissorsPiece1() {
			super(ICON_SPRITE, PLACED_SPRITE);
		}

		override public function onPick():void {

		}

		override public function onCombine(item:Item):void {
			if(item is ScissorsPiece2) {
				var scissors:Scissors = new Scissors();

				item.consume();
				this.consume();

				Inventory.addToInventory(scissors);
			}
		}

		override public function onConsume():void {

		}
	}
}
