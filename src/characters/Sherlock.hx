package characters;

import engine.Character;
import engine.structs.AssetRegistry;

class Sherlock extends Character {

	public function new() {
		AssetRegistry.get()
			.registerSprite('sherlock.sprite', "assets/character_sherlock.png")
			.registerSprite('sherlock.portrait.default', "assets/portrait_sherlock.png")
			.registerSound('sherlock.sound.dialog', "assets/voice/sherlock_dialog.mp3")
			.registerSound('sherlock.sound.surprise', "assets/voice/sherlock_surprise.mp3")
			.registerSound('sherlock.sound.taunt', "assets/voice/sherlock_taunt.mp3")
			.registerSound('sherlock.sound.wonder', "assets/voice/sherlock_wonder.mp3");

		super();

		loadGraphic(AssetRegistry.graphic('sherlock.sprite'));
	}

	override public function setCharacterInfo():Void {
		this.characterName = "Xerox Holmes";
		this.setPortraits({idle: [AssetRegistry.spritePath('sherlock.portrait.default'), (false : Dynamic)]});
	}
}
