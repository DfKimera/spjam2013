package items {

	import engine.Inventory;
	import engine.Item;

	public class Liana extends Item {

		[Embed(source="../../assets/item_liana.png")]
		public var ICON_SPRITE:Class;

		[Embed(source="../../assets/item_liana.png")]
		public var PLACED_SPRITE:Class;

		public function Liana() {
			super(ICON_SPRITE, PLACED_SPRITE);
		}

		public override function onCombine(item:Item):void {
			if(item is Hook) {
				item.consume();
				this.consume();
				Inventory.addToInventory(new RopeHook());
			}
		}

	}
}
