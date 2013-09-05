package items {

	import engine.Item;

	public class Key1 extends Item {

		[Embed(source="../../assets/item_key.png")]
		public var ICON_SPRITE:Class;

		[Embed(source="../../assets/item_keyglint.png")]
		public var PLACED_SPRITE:Class;

		public function Key1() {
			super(ICON_SPRITE, PLACED_SPRITE);
		}

	}
}
