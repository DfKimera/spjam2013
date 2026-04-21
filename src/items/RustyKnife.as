package items {

	import engine.Item;

	public class RustyKnife extends Item {

		[Embed(source="../../assets/item_rusty_knife.png")]
		public var ICON_SPRITE:Class;

		[Embed(source="../../assets/item_rusty_knife_placed.png")]
		public var PLACED_SPRITE:Class;

		public function RustyKnife() {
			super(ICON_SPRITE, PLACED_SPRITE);
		}

	}
}
