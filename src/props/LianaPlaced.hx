package props;

import engine.Assets;
import engine.Prop;
import engine.structs.AssetRegistry;

class LianaPlaced extends Prop {

	public function new() {
		AssetRegistry.get()
			.registerSprite('liana_placed.sprite', "assets/prop_liana.png");

		super();
		loadGraphic(AssetRegistry.graphic('liana_placed.sprite'));
	}
}
