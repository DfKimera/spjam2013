package props {

	import engine.Prop;

	public class BoulderWithPlank extends Prop {

		[Embed("../../assets/prop_boulder_with_plank.png")]
		public var SPRITE:Class;

		public function BoulderWithPlank() {
			super();
			loadGraphic(SPRITE);
		}

	}
}
