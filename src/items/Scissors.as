package items {

	import engine.Item;

	public class Scissors extends Item {

		[Embed(source="../../assets/item_scissors.png")]
		public var ICON_SPRITE:Class;

		//não será usada !
		[Embed(source="../../assets/item_scissors_placed.png")]
		public var PLACED_SPRITE:Class;

		public function Scissors() {
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
