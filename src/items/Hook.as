package items {

	import engine.Item;

	public class Hook extends Item {

		[Embed(source="../../assets/item_hook.png")]
		public var ICON_SPRITE:Class;

		[Embed(source="../../assets/item_hook_placed.png")]
		public var PLACED_SPRITE:Class;

		public function Hook() {
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
