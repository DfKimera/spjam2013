package items {

	import engine.Item;

	public class Plank extends Item {

		[Embed(source="../../assets/item_plank.png")]
		public var ICON_SPRITE:Class;

		[Embed(source="../../assets/item_plank_placed.png")]
		public var PLACED_SPRITE:Class;

		public function Plank() {
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
