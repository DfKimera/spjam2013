package engine;

import flixel.FlxG;
import engine.structs.AssetReference;
import engine.structs.AssetRegistry;
import flixel.sound.FlxSound;

class SFX {

	public static function play(name:String): FlxSound {
		var sound:AssetReference = AssetRegistry.getSound(name);

		if (sound == null) {
			trace("SFX: unknown sound name: ", name);
			return null;
		}

		trace("SFX: ", sound.name);

		return FlxG.sound.play(sound.path, 0.5);
	}

	public static function init() {
		AssetRegistry.get()
			.registerSound('sfx.click', "assets/sfx/key.mp3")
			.registerSound('sfx.use', "assets/sfx/move.mp3")
			.registerSound('sfx.pick', "assets/sfx/select1.mp3")
			.registerSound('sfx.bell', "assets/sfx/select2.mp3")
			.registerSound('sfx.scroll', "assets/sfx/scrolling.mp3");
	}
}

