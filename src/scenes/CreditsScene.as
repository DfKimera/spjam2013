package scenes {

	import engine.UIScene;

import org.flixel.FlxG;

public class CreditsScene extends UIScene {

		[Embed(source="../../assets/credits_screen.png")]
		public var BACKGROUND_SPRITE:Class;

		public override function prepare():void {
			setBackground(BACKGROUND_SPRITE);
		}

		public override function onBackgroundClick(x:int, y:int):void {
			Game.goToMainMenu();
		}

		public override function update():void {
			super.update();

			if(FlxG.keys.any()) {
				Game.goToMainMenu();
			}
		}

	}
}
