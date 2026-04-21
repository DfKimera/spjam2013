import engine.SFX;

import flixel.group.FlxGroup;
import flixel.text.FlxText;
import photonstorm.FlxExtendedSprite;
import haxe.Constraints.Function;

class MenuOption extends FlxGroup {

	var SPRITE:String = "assets/choice_btn.png";

	var onTriggerHandler:Function;
	var isOver:Bool = false;

	var current:String = "off";

	var btn:FlxExtendedSprite;
	var title:FlxText;

	public function new(text:String, onTriggerHandler:Function, x:Float, y:Float) {
		super();

		btn = new FlxExtendedSprite(x, y);
		btn.loadGraphic(SPRITE, true, 280, 40);

		this.onTriggerHandler = onTriggerHandler;

		btn.mouseReleasedCallback = this.onClick;
		btn.name = text;

		btn.animation.add("off", [0]);
		btn.animation.add("on", [1]);

		btn.animation.play("off");

		add(btn);

		var yOffset = (btn.name.length > 40) ? 0 : 6;

		title = new FlxText(x, y + yOffset, 280, text);
		title.setFormat("raleway", 16, 0xFFFFFF, "center", 0xFF000000);

		add(title);


	}

	function onClick(spr:FlxExtendedSprite, x:Int, y:Int) {
		this.trigger();
	}

	public function setOn() {
		this.isOver = true;
	}

	public function setOff() {
		this.isOver = false;
	}

	public function trigger() {
		trace("Menu option trigger: ", this);
		SFX.play("bell");
		if (Reflect.isFunction(this.onTriggerHandler)) {
			this.onTriggerHandler();
		}
	}

	public override function update(elapsed:Float) {

		super.update(elapsed);

		if (isOver || btn.mouseOver) {
			if (current == "off") {
				SFX.play("scroll");
			}
			current = "on";
			btn.animation.play("on");
		} else {
			current = "off";
			btn.animation.play("off");
		}
	}
}

