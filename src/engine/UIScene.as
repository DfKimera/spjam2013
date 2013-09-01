package engine {

	import org.flixel.FlxG;

	public class UIScene extends Scene {

		public override function update():void {
			if(FlxG.keys.justPressed("ESCAPE")) {
				Game.goToMainMenu();
			}
		}

		protected override function hasInventoryEnabled():Boolean {
			return false;
		}

	}
}
