package props {

	import engine.Item;
	import engine.Prop;

	public class Footprints extends Prop {

		[Embed("../../assets/prop_footprints.png")]
		public var SPRITE:Class;

		public function Footprints() {
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
