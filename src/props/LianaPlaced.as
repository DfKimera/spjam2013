package props {

	import engine.Item;
	import engine.Prop;

	public class LianaPlaced extends Prop {

		[Embed("../../assets/prop_liana.png")]
		public var SPRITE:Class;

		public function LianaPlaced() {
			super();
			loadGraphic(SPRITE);
		}

	}
}
