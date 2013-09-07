package scenes {

	import engine.ComicScene;

	public class Epilogue extends ComicScene {

		[Embed(source="../../assets/outro_1.png")]
		public var COMIC_PAGE_1:Class;

		[Embed(source="../../assets/outro_2.png")]
		public var COMIC_PAGE_2:Class;

		[Embed(source="../../assets/outro_3.png")]
		public var COMIC_PAGE_3:Class;

		public override function prepare():void {
			pages = [COMIC_PAGE_1, COMIC_PAGE_2, COMIC_PAGE_3];
			Game.playMusic("story");
		}

		public override function onFinish():void {
			Game.openCredits();
		}

	}
}
