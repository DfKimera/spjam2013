package characters;

import engine.Assets;
import engine.Character;
import engine.structs.AssetRegistry;

class Hunter3 extends Character {

	public function new() {
		AssetRegistry.get()
			.registerSprite('hunter3.sprite', "assets/character_hunter3.png")
			.registerSprite('hunter3.portrait.default', "assets/portrait_hunter3.png")
			.registerSound('hunter3.sound.jailed', "assets/voice/hunter3_jailed.mp3")
			.registerSound('hunter3.sound.dialog', "assets/voice/hunter3_dialog.mp3");

		super();

		loadGraphic(AssetRegistry.graphic('hunter3.sprite'), true, 151, 179);
		animation.add("jailed", [0]);
		animation.add("released", [1]);
		animation.play("jailed");
	}

	override public function setCharacterInfo():Void {
		this.characterName = "Caçador";
		addPortrait("default", AssetRegistry.spritePath('hunter3.portrait.default'), false);
	}
}
