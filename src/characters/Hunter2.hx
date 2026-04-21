package characters;

import engine.Assets;
import engine.Character;
import engine.structs.AssetRegistry;

class Hunter2 extends Character {

	public function new() {
		AssetRegistry.get()
			.registerSprite('hunter2.sprite', "assets/character_hunter2.png")
			.registerSprite('hunter2.portrait.default', "assets/portrait_hunter2.png")
			.registerSound('hunter2.sound.hole', "assets/voice/hunter2_hole.mp3")
			.registerSound('hunter2.sound.dialog', "assets/voice/hunter2_dialog.mp3");

		super();

		loadGraphic(AssetRegistry.graphic('hunter2.sprite'));
	}

	override public function setCharacterInfo():Void {
		this.characterName = "Caçador";
		addPortrait("default", AssetRegistry.spritePath('hunter2.portrait.default'), false);
	}
}
