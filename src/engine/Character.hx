package engine;

import engine.Assets;
import engine.Prop;
import flixel.FlxSprite;

class Character extends Prop {

	public var characterName:String = "Unknown";

	private var portraits:Map<String, String> = new Map();
	private var portraitSprites:Map<String, FlxSprite> = new Map();
	private var assetNamespace = "";

	public function new() {
		super();
		setCharacterInfo();
	}

	public function setCharacterInfo():Void {}

	public function setPortraits(portraitList:Dynamic):Void {
		for (i in Reflect.fields(portraitList)) {
			var arr:Array<Dynamic> = cast Reflect.field(portraitList, i);
			addPortrait(i, arr[0], cast(arr[1], Bool));
		}
	}

	public function addPortrait(expression:String, graphic:String, isAnimated:Bool = false):Void {
		portraits[expression] = graphic;
		portraitSprites[expression] = new FlxSprite(0, 0);
		portraitSprites[expression].loadGraphic(Assets.graphic(graphic), isAnimated, 100, 100);
	}

	public function getPortrait(expression:String):FlxSprite {
		return portraitSprites[expression];
	}
}
