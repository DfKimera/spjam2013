package scenes {

	import engine.ComicScene;

	public class Prologue extends ComicScene {

		[Embed(source="../../assets/intro_1.jpg")]
		public var COMIC_PAGE_1:Class;

		[Embed(source="../../assets/intro_2.jpg")]
		public var COMIC_PAGE_2:Class;

		[Embed(source="../../assets/intro_3.jpg")]
		public var COMIC_PAGE_3:Class;

		public override function prepare():void {
			pages = [COMIC_PAGE_1, COMIC_PAGE_2, COMIC_PAGE_3];
			Game.playMusic("story");
		}

		public override function onFinish():void {
			Game.start();
		}

	}
}
