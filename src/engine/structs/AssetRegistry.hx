package engine.structs;

import openfl.utils.Dictionary;
import flixel.graphics.FlxGraphic;
import flixel.sound.FlxSound;

class AssetRegistry {

	private static var _instance:AssetRegistry;

	private var _sprites:Dictionary<String, AssetReference> = new Dictionary<String, AssetReference>();
	private var _sounds:Dictionary<String, AssetReference> = new Dictionary<String, AssetReference>();

	public static function get(): AssetRegistry {
		if (_instance == null) {
			_instance = new AssetRegistry();
		}

		return _instance;
	}

	public function new() {

	}

	public function registerSprite(name: String, path: String): AssetRegistry {
		trace("AssetRegistry: SPRITE ", name, path);
		_sprites[name] = new AssetReference(name, path, "sound");
		return this;
	}

	public function registerSound(name: String, path: String): AssetRegistry {
		trace("AssetRegistry: SOUND ", name, path);
		_sounds[name] = new AssetReference(name, path, "sound");
		return this;
	}

	public static function getSound(name: String): AssetReference
	{
		if(!_sounds.exists(name)) {
			trace("AssetRegistry: failed to load SOUND with name: ", name);
			return null;
		}

		return _sounds[name];
	}

	public static function getSprite(name: String): AssetReference {

		if (!_sprites.exists(name)) {
			trace("AssetRegistry: failed to load SPRITE with name: ", name);
			return null;
		}

		return _sprites[name];
	}

	public static function graphic(spriteName: String): FlxGraphic {
		return Assets.graphic(getSprite(spriteName).path);
	}

	public static function spritePath(spriteName: String): String {
		return getSprite(spriteName).path;
	}

}
