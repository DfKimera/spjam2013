package props;

import engine.Assets;
import engine.Prop;
import engine.structs.AssetRegistry;

class Hole extends Prop {

	public function new() {
		AssetRegistry.get()
			.registerSprite('hole.sprite', "assets/prop_hole.png");

		super();
		loadGraphic(AssetRegistry.graphic('hole.sprite'));
	}
}
