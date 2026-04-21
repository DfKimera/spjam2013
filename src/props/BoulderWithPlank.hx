package props;

import engine.Assets;
import engine.Prop;
import engine.structs.AssetRegistry;

class BoulderWithPlank extends Prop {

	public function new() {
		AssetRegistry.get()
			.registerSprite('boulder_with_plank.sprite', "assets/prop_boulder_with_plank.png");

		super();
		loadGraphic(AssetRegistry.graphic('boulder_with_plank.sprite'));
	}
}
