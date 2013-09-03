package {
	import engine.Cursor;
	import engine.Scene;

	import org.flixel.FlxG;
	import org.flixel.FlxGame;
	import org.flixel.FlxState;
	import org.flixel.plugin.photonstorm.FlxMouseControl;

	import scenes.CreditsScene;
	import scenes.StartingScene;

	public class Game extends FlxGame {

		public static var instance:Game;

		public function Game() {
			Game.instance = this;
			super(800, 600, Menu, 1, 60, 30, false);

			Cursor.useArrow();

			if (FlxG.getPlugin(FlxMouseControl) == null) {
				FlxG.addPlugin(new FlxMouseControl);
			}

		}

		protected override function update():void {
			Cursor.reset();
			super.update();
			Cursor.update();
		}

		/**
		 * Switches to the main menu
		 */
		public static function goToMainMenu():void {
			Game.transitionToScene(new Menu());
		}

		/**
		 * Switches to the game's starting scene
		 */
		public static function start():void {
			Game.transitionToScene(new StartingScene());
		}

		/**
		 * Switches to the settings menu
		 */
		public static function openSettings():void {
			Game.transitionToScene(new Settings());
		}

		/**
		 * Switches to the credits scene
		 */
		public static function openCredits():void {
			Game.transitionToScene(new CreditsScene());
		}

		/**
		 * Transitions the game to another scene.
		 * @param scene Scene The scene instance.
		 * @param delay Number The transition delay, in seconds.
		 */
		public static function transitionToScene(scene:FlxState, delay:Number = Config.SCENE_FADE_DELAY):void {
			trace("------------------ END SCENE ---------------------");
			FlxG.fade(0xff000000, delay, function ():void {
				FlxG.switchState(scene);

			});
		}

		public static function setArrowCursor():void {
			FlxG.mouse.load()
		}

	}
}
