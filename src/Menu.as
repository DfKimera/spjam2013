package {
	import flash.ui.Keyboard;

	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxU;

	public class Menu extends FlxState {

		public const COLOR_UNSELECTED:uint = 0x777777;
		public const COLOR_SELECTED:uint = 0xFFFFFF;

		public var options:Array = ['Start Game', 'Credits', 'Settings'];

		private var offsetY:int = 200;
		private var baseY:int = 0;

		public var logo:FlxText;
		public var optionLabels:Array = [];

		public var selectedOption:int = 0;

		public function Menu() {

			logo = new FlxText(20, 20, 200, "SPJAM 2013");
			logo.size = 36;
			add(logo);

			createOptions();

		}

		public function createOptions():void {

			for(var i:String in options) {
				addOption(i,  options[i]);
			}

		}

		public function triggerOption(id:int):void {

			switch(options[id]) {

				case "Start Game":
					Game.start();
					break;

				case "Credits":
					Game.openCredits();
					break;

				case "Settings":
					Game.openSettings();
					break;

			}

		}

		public function addOption(id:String,  name:String):void {
			optionLabels[id] = new FlxText(20, offsetY + baseY, 200, name);
			optionLabels[id].size = 16;
			optionLabels[id].color = COLOR_UNSELECTED;
			baseY += 35;

			add(optionLabels[id]);
		}

		public override function update():void {

			optionLabels[selectedOption].color = COLOR_UNSELECTED;

			if(FlxG.keys.justPressed("DOWN")) {

				selectedOption += 1;

				if(selectedOption >= options.length) {
					selectedOption = 0;
				}

			} else if(FlxG.keys.justPressed("UP")) {

				selectedOption -= 1;

				if(selectedOption < 0) {
					selectedOption = options.length - 1;
				}

			} else if(FlxG.keys.justPressed("ENTER")) {
				triggerOption(selectedOption);
			}

			optionLabels[selectedOption].color = COLOR_SELECTED;

		}

	}
}
