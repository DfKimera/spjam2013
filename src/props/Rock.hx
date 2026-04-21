package props;

import engine.Assets;
import engine.Prop;
import engine.structs.AssetRegistry;

class Rock extends Prop {

	public function new() {
		AssetRegistry.get()
			.registerSprite('rock.sprite', "assets/prop_rock.png");

		super();
		loadGraphic(AssetRegistry.graphic('rock.sprite'));
	}
}
