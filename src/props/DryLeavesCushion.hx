package props;

import engine.Assets;
import engine.Prop;
import engine.structs.AssetRegistry;

class DryLeavesCushion extends Prop {

	public function new() {
		AssetRegistry.get()
			.registerSprite('dryleaves_cushion.sprite', "assets/item_dryleaves_placed.png");

		super();
		loadGraphic(AssetRegistry.graphic('dryleaves_cushion.sprite'));
	}
}
