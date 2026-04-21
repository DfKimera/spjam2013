package props;

import engine.Assets;
import engine.Prop;
import engine.structs.AssetRegistry;

class Bush extends Prop {

	public function new() {
		AssetRegistry.get()
			.registerSprite('bush.sprite', "assets/prop_bush.png");

		super();
		loadGraphic(AssetRegistry.graphic('bush.sprite'));
	}
}
