package items {

	import engine.Inventory;
	import engine.Item;

	public class Hook extends Item {

		[Embed(source="../../assets/item_hook.png")]
		public var ICON_SPRITE:Class;

		[Embed(source="../../assets/item_hook.png")]
		public var PLACED_SPRITE:Class;

		public function Hook() {
			super(ICON_SPRITE, PLACED_SPRITE);
		}

		public override function onCombine(item:Item):void {
			if(item is Liana) {
				item.consume();
				this.consume();
				Inventory.addToInventory(new RopeHook());
			}
		}

	}
}
