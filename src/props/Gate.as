package props {

	import engine.Item;
	import engine.Prop;

	public class Gate extends Prop {

		[Embed("../../assets/prop_gate.png")]
		public var SPRITE:Class;

		public function Gate() {
			super();
			loadGraphic(SPRITE);
		}

		/**
		 * Called when the player interacts with this prop.
		 */
		public override function onInteract():void {

		}

		/**
		 * Called when an item is used on this prop.
		 * @param item Iten The used item.
		 */
		public override function onItemUse(item:Item):void {

		}

	}
}
