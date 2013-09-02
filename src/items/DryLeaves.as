package items {

	import engine.Item;

	public class DryLeaves extends Item {

		[Embed(source="../../assets/item_dryleaves.png")]
		public var ICON_SPRITE:Class;

		[Embed(source="../../assets/item_dryleaves.png")]
		public var PLACED_SPRITE:Class;

		public function DryLeaves() {
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
