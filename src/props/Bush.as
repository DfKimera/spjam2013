package props {

	import engine.Prop;

	public class Bush extends Prop {

		[Embed("../../assets/prop_bush.png")]
		public var SPRITE:Class;

		public function Bush() {
			super();
			loadGraphic(SPRITE);
		}

	}
}
