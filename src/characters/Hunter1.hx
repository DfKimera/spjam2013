package characters;

import engine.Assets;
import engine.Character;
import engine.structs.AssetRegistry;

class Hunter1 extends Character {

	public function new() {
		AssetRegistry.get()
			.registerSprite('hunter1.sprite', "assets/character_hunter1.png")
			.registerSprite('hunter1.portrait.default', "assets/portrait_hunter1.png")
			.registerSprite('hunter1.portrait.hanging', "assets/portrait_hunter1_hanging.png")
			.registerSound('hunter1.sound.cry', "assets/voice/hunter1_cry.mp3")
			.registerSound('hunter1.sound.dialog', "assets/voice/hunter1_dialog.mp3")
			.registerSound('hunter1.sound.thanks', "assets/voice/hunter1_thanks.mp3");

		super();

		loadGraphic(AssetRegistry.graphic('hunter1.sprite'), true, 161, 516);
		animation.add("hanging", [0]);
		animation.add("sitting", [1]);
		animation.play("hanging");
	}

	override public function setCharacterInfo():Void {
		this.characterName = "Caçador";
		addPortrait("default", AssetRegistry.spritePath('hunter1.portrait.default'), false);
		addPortrait("hanging", AssetRegistry.spritePath('hunter1.portrait.hanging'), false);
	}
}
