package props;

import engine.Assets;
import engine.Prop;
import engine.structs.AssetRegistry;

class Glint extends Prop {

	public function new() {
		AssetRegistry.get()
			.registerSprite('glint.sprite', "assets/item_keyglint.png");

		super();
		loadGraphic(AssetRegistry.graphic('glint.sprite'));
	}
}
