package props;

import engine.Assets;
import engine.Item;
import engine.Prop;
import engine.structs.AssetRegistry;

class Footprints extends Prop {

	public function new() {
		AssetRegistry.get()
			.registerSprite('footprints.sprite', "assets/prop_footprints.png");

		super();
		loadGraphic(AssetRegistry.graphic('footprints.sprite'));
	}

	override public function onInteract():Void {
	}

	override public function onItemUse(item:Item):Void {
	}
}
