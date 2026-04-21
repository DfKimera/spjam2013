package engine.structs;

class AssetReference {

	public var name: String;
	public var path: String;
	public var type: String;

	public function new(name: String, path: String, type: String) {
		this.name = name;
		this.path = path;
		this.type = type;
	}
}
