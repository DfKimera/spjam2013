class Lang
{
    private static var strings:Map<String, String> = new Map();

    public static function load(langCode:String):Void
    {
        var raw:String = openfl.Assets.getText("assets/lang/" + langCode + ".json");
        var data:Dynamic = haxe.Json.parse(raw);
        strings = new Map();
        for (key in Reflect.fields(data))
            strings.set(key, Reflect.field(data, key));
    }

    public static function get(key:String):String
    {
        return strings.exists(key) ? strings.get(key) : '[' + key + ']';
    }
}
