package props {

	import engine.Prop;

	public class Glint extends Prop {

		[Embed("../../assets/item_keyglint.png")]
		public var SPRITE:Class;

		public function Glint() {
			super();
			loadGraphic(SPRITE);
		}

	}
}
