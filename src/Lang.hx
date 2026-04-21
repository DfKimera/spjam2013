package;

class Lang {

	private static var strings:Map<String, String> = new Map();

	public static function load(langCode:String): Void {
		trace("Loading language: ", langCode);

		var raw:String = openfl.Assets.getText("assets/lang/" + langCode + ".json");
		var data:Dynamic = haxe.Json.parse(raw);
		var numStrings:Int = 0;

		strings = new Map();

		for (key in Reflect.fields(data)) {
			strings.set(key, Reflect.field(data, key));
			numStrings++;
		}

		trace("Loaded ", numStrings, " strings");
	}

	public static function get(key:String): String {
		return strings.exists(key) ? strings.get(key) : '[' + key + ']';
	}
}
