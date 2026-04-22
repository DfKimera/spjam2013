package scenes;

import characters.Hunter2;
import characters.Sherlock;
import engine.Dialog;
import engine.Inventory;
import engine.Item;
import engine.Portal;
import engine.Prop;
import engine.Scene;
import items.Key1;
import items.Liana;
import items.Plank;
import props.Hole;
import Lang;

class ForestC2 extends Scene {

	public static final BACKGROUND = "assets/scene_c2.jpg";

	public var sherlock:Sherlock = new Sherlock();
	public var hunter:Hunter2 = new Hunter2();

	public var hunterRescued:Bool = false;

	public static var visited:Bool = false;
	public static var cleared:Bool = false;

	override public function prepare():Void {
		setBackground(BACKGROUND);
		setFadeInDelay(1);
		Game.playMusic("game");
	}

	override public function create():Void {
		super.create();

		sherlock = new Sherlock();
		hunter = new Hunter2();

		Portal.placeOnScene(this, Lang.get("portal.village"), 260, 0, 290, 400, VillageScene);
		Portal.placeOnScene(this, Lang.get("portal.forest"), 0, 540, 800, 60, ForestP2);

		Prop.placeOnScene(this, new Hole(), 440, 440);

		if (!Inventory.hasItemOfType("items::Plank") && !cleared) {
			Item.placeOnScene(this, new Plank(), 440, 440);
		}

		if (cleared) {
			Prop.placeOnScene(this, hunter, 520, 410);
		}

		visited = true;
	}

	override public function onPropInteract(prop:Prop):Void {
		if (Std.is(prop, Hole)) {
			if (!cleared) {
				Dialog.show(this, hunter, Lang.get("scene.forestc2.get_us_out")).sound("hunter2.sound.hole");
				Dialog.show(this, sherlock, Lang.get("scene.forestc2.how_help")).sound("sherlock.sound.wonder");
			}
			else {
				Dialog.show(this, sherlock, Lang.get("scene.forestc2.deep_hole")).sound("sherlock.sound.dialog");
			}
			return;
		}

		if (Std.is(prop, Hunter2)) {
			Dialog.show(this, hunter, Lang.get("scene.forestc2.phew")).sound("hunter2.sound.dialog");
			Dialog.show(this, sherlock, Lang.get("scene.forestc2.who_put")).sound("sherlock.sound.dialog");
			Dialog.show(this, hunter, Lang.get("scene.forestc2.from_behind")).sound("hunter2.sound.dialog");
			var dialog:Dialog = Dialog.show(this, hunter, Lang.get("scene.forestc2.dwarf")).sound("hunter2.sound.dialog");
			Sketch.show(this, "short", dialog);
		}
	}

	override public function onItemUse(prop:Prop, item:Item):Void {
		if (Std.is(prop, Hole)) {
			if (Std.is(item, Liana) && !cleared) {
				Prop.placeOnScene(this, hunter, 520, 410);
				hunter.ID = 0x7FFFFFFF - 100;
				Dialog.show(this, hunter, Lang.get("scene.forestc2.phew_short")).sound("hunter2.sound.dialog");
				Dialog.show(this, sherlock, Lang.get("scene.forestc2.well_done")).sound("sherlock.sound.surprise");

				if (ForestC1.cleared) {
					Inventory.addToInventory(new Key1());
					Dialog.show(this, hunter, Lang.get("scene.forestc2.take_key")).sound("hunter2.sound.dialog");
				}

				cleared = true;
			}
			else {
				Dialog.show(this, sherlock, Lang.get("scene.forestc2.no_help")).sound("sherlock.sound.taunt");
			}
		}
	}

	override public function onItemPick(item:Item):Void {
		if (Std.is(item, Plank)) {
			Dialog.show(this, sherlock, Lang.get("scene.forestc2.garbage_collector")).sound("sherlock.sound.taunt");
		}
	}

	public function new() {
		super();
	}
}
