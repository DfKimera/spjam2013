package items {

	import engine.Item;

	public class ScissorsPiece2 extends Item {

		[Embed(source="../../assets/item_ScissorsPiece2.png")]
		public var ICON_SPRITE:Class;

		[Embed(source="../../assets/item_ScissorsPiece2_placed.png")]
		public var PLACED_SPRITE:Class;

		public function ScissorsPiece2() {
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
