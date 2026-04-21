package props;

import engine.Assets;
import engine.Item;
import engine.Prop;
import engine.structs.AssetRegistry;

class Rack extends Prop {

	public function new() {
		AssetRegistry.get()
			.registerSprite('rack.sprite', "assets/prop_rack.png");

		super();
		loadGraphic(AssetRegistry.graphic('rack.sprite'));
	}

	override public function onInteract():Void {
	}

	override public function onItemUse(item:Item):Void {
	}
}
