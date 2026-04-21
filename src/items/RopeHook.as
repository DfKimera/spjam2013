package items {

	import engine.Item;

	public class RopeHook extends Item {

		[Embed(source="../../assets/item_rope_hook.png")]
		public var ICON_SPRITE:Class;

		[Embed(source="../../assets/item_rope_hook.png")]
		public var PLACED_SPRITE:Class;

		public function RopeHook() {
			super(ICON_SPRITE, PLACED_SPRITE);
		}

	}
}
