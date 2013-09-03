package items {

	import engine.Item;

	public class Liana extends Item {

		[Embed(source="../../assets/item_liana.png")]
		public var ICON_SPRITE:Class;

		[Embed(source="../../assets/item_liana.png")]
		public var PLACED_SPRITE:Class;

		public function Liana() {
			super(ICON_SPRITE, PLACED_SPRITE);
		}

	}
}
