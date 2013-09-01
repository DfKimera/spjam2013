package items {

	import engine.Item;

	public class TestItem extends Item {

		[Embed(source="../../assets/item_testitem.png")]
		public var ICON_SPRITE:Class;

		[Embed(source="../../assets/item_testitem_placed.png")]
		public var PLACED_SPRITE:Class;

		public function TestItem() {
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
