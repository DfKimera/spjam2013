package props {

	import engine.Item;
	import engine.Prop;

	public class Hole extends Prop {

		[Embed("../../assets/prop_hole.png")]
		public var SPRITE:Class;

		public function Hole() {
			super();
			loadGraphic(SPRITE);
		}

	}
}
