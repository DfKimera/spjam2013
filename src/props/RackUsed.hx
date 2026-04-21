package props;

import engine.Assets;
import engine.Item;
import engine.Prop;
import engine.structs.AssetRegistry;

class RackUsed extends Prop {

	public function new() {
		AssetRegistry.get()
			.registerSprite('rack_used.sprite', "assets/prop_rack_after.png");

		super();
		loadGraphic(AssetRegistry.graphic('rack_used.sprite'));
	}

	override public function onInteract():Void {
	}

	override public function onItemUse(item:Item):Void {
	}
}
