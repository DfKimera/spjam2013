package items {

	import engine.Item;

	public class Key1 extends Item {

		[Embed(source="../../assets/item_key1.png")]
		public var ICON_SPRITE:Class;

		[Embed(source="../../assets/item_key1_placed.png")]
		public var PLACED_SPRITE:Class;

		public function Key1() {
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
