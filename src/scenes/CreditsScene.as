package scenes {

	import engine.UIScene;

	public class CreditsScene extends UIScene {

		[Embed(source="../../assets/credits_screen.png")]
		public var BACKGROUND_SPRITE:Class;

		public override function prepare():void {
			setBackground(BACKGROUND_SPRITE);
		}

	}
}
