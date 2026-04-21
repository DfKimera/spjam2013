package;

import Lang;
import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.FlxSprite;
import engine.Assets;
import engine.ui.UIMenu;

class LanguageSelect extends UIMenu {

	public static final BACKGROUND_SPRITE = "assets/menu_background.jpg";

	public var background:FlxSprite;

	override public function create():Void {
		background = new FlxSprite(0, 0);
		background.loadGraphic(Assets.graphic(BACKGROUND_SPRITE));
		add(background);

		super.create();

		addOption("Português (BR)", 0, 0, function() {
			selectLanguage("pt_BR");
		});

		addOption("English", 0, 100, function() {
			selectLanguage("en");
		});
	}

	override public function getButtonOffset():FlxPoint {
		return new FlxPoint(260, 300);
	}

	private function selectLanguage(langCode:String):Void {
		Lang.load(langCode);
		FlxG.switchState(new Menu());
	}
}
