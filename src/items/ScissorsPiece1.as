package items {

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

		}

		override public function onConsume():void {

		}
	}
}
