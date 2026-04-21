package characters;

import engine.Assets;
import engine.Character;
import engine.Item;
import flixel.FlxG;
import engine.structs.AssetRegistry;

class Curupira extends Character {

	public function new() {
		AssetRegistry.get()
            .registerSprite('curupira.sprite', "assets/character_curupira.png")
            .registerSprite('curupira.portrait.default', "assets/portrait_curupira.png")
            .registerSound('curupira.sound.me', "assets/voice/curupira_me.mp3")
            .registerSound('curupira.sound.you', "assets/voice/curupira_you.mp3");

		super();

		loadGraphic(AssetRegistry.graphic('curupira.sprite'));
	}

	override public function setCharacterInfo():Void {
		this.characterName = "Curupira";
		addPortrait("default", AssetRegistry.spritePath('curupira.portrait.default'), false);
	}
}

