package items {

	import engine.Item;

	public class Key2 extends Item {

		[Embed(source="../../assets/item_key_gold.png")]
		public var ICON_SPRITE:Class;

		[Embed(source="../../assets/item_keyglint.png")]
		public var PLACED_SPRITE:Class;

		public function Key2() {
			super(ICON_SPRITE, PLACED_SPRITE);
		}

	}
}
