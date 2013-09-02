package props {

	import engine.Item;
	import engine.Prop;

	public class Portal190 extends Prop {

		[Embed("../../assets/portal_190x190.png")]
		public var SPRITE:Class;

		public function Portal190() {
			super();
			loadGraphic(SPRITE);
		}
	}
}
