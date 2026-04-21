package props {

	import engine.Prop;

	public class Rock extends Prop {

		[Embed("../../assets/prop_rock.png")]
		public var SPRITE:Class;

		public function Rock() {
			super();
			loadGraphic(SPRITE);
		}

	}
}
