package props;

import engine.Assets;
import engine.Prop;
import engine.structs.AssetRegistry;

class Boulder extends Prop {

	public function new() {
		AssetRegistry.get()
			.registerSprite('boulder.sprite', "assets/prop_boulder.png");

		super();
		loadGraphic(AssetRegistry.graphic('boulder.sprite'));
	}
}
