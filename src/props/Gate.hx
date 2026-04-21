package props;

import engine.Assets;
import engine.Item;
import engine.Prop;
import engine.structs.AssetRegistry;

class Gate extends Prop {

	public function new() {
		AssetRegistry.get()
			.registerSprite('gate.sprite', "assets/prop_gate.png");

		super();
		loadGraphic(AssetRegistry.graphic('gate.sprite'), true, 149, 339);
		animation.add("open", [0]);
		animation.add("closed", [1]);
		animation.play("closed");
	}

	override public function onInteract():Void {
	}

	override public function onItemUse(item:Item):Void {
	}
}
