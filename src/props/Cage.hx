package props;

import engine.Assets;
import engine.Item;
import engine.Prop;
import engine.structs.AssetRegistry;

class Cage extends Prop {

	public function new() {
		AssetRegistry.get()
			.registerSprite('cage.sprite', "assets/prop_cage.png");

		super();
		loadGraphic(AssetRegistry.graphic('cage.sprite'));
	}

	override public function onInteract():Void {
	}

	override public function onItemUse(item:Item):Void {
	}
}
