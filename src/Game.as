package {
	import engine.Cursor;
	import engine.Dialog;
	import engine.Scene;

	import flash.system.Security;

	import org.flixel.FlxG;
	import org.flixel.FlxGame;
	import org.flixel.FlxState;
	import org.flixel.plugin.photonstorm.FlxMouseControl;

	import scenes.CreditsScene;
	import scenes.Epilogue;
	import scenes.Prologue;
	import scenes.StartingScene;

	public class Game extends FlxGame {

		public static var instance:Game;

		[Embed(source="../assets/game_background.mp3")]
		public static var BGM_GAME:Class;
		[Embed(source="../assets/story_theme.mp3")]
		public static var BGM_STORY:Class;
		[Embed(source="../assets/menu_theme.mp3")]
		public static var BGM_MENU:Class;
		[Embed(source="../assets/credits_theme.mp3")]
		public static var BGM_CREDITS:Class;

		public static var currentBGM:String = null;

		public function Game() {

			Security.allowDomain("*");

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
		 * Shows the game prologue
		 */
		public static function showPrologue():void {
			Game.transitionToScene(new Prologue());
		}

		/**
		 * Shows the game epilogue
		 */
		public static function showEpilogue():void {
			Game.transitionToScene(new Epilogue());
		}

		/**
		 * Plays a background music
		 * @param name String
		 */
		public static function playMusic(name:String):void {
			if(currentBGM == name) { return; }
			currentBGM = name;
			FlxG.playMusic(Game["BGM_" + name.toUpperCase()], 0.5);
		}

		/**
		 * Transitions the game to another scene.
		 * @param scene Scene The scene instance.
		 * @param delay Number The transition delay, in seconds.
		 */
		public static function transitionToScene(scene:FlxState, delay:Number = Config.SCENE_FADE_DELAY):void {
			trace("------------------ END SCENE ---------------------");
			Dialog.clearAll();
			FlxG.fade(0xff000000, delay, function ():void {
				FlxG.switchState(scene);
			});
		}

		public static function setArrowCursor():void {
			FlxG.mouse.load()
		}

	}
}
