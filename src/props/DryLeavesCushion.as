package props {

	import engine.Item;
	import engine.Prop;

	public class DryLeavesCushion extends Prop {

		[Embed(source="../../assets/item_dryleaves_placed.png")]
		public var SPRITE:Class;

		public function DryLeavesCushion() {
			super();
			loadGraphic(SPRITE);
		}

	}
}
