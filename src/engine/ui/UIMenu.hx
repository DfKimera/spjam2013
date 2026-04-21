package engine.ui;

import flixel.FlxState;
import flixel.math.FlxPoint;
import flixel.group.FlxGroup;
import haxe.Constraints.Function;
import flixel.FlxG;

abstract class UIMenu extends FlxState {

	private var buttonOffset : FlxPoint;

	public var optionIndex : Array<Dynamic> = [];
	public var options : Map<String, MenuOption> = new Map();
	public var _options:FlxGroup = new FlxGroup();

	public var selectedOption:Int = -1;

	override public function create():Void {
		buttonOffset = getButtonOffset();
		super.create();
		add(_options);
	}

	public function getButtonOffset(): FlxPoint {
		return new FlxPoint(260, 300);
	}

	public function triggerOption(name:String) {
		if (!options.exists(name)) {
			return;
		}
		trace("Menu (trigger): ", name, options[name]);
		options[name].trigger();
	}

	public function addOption(name:String, x:Float, y:Float, callback:Function) {

		var option = new MenuOption(name, callback, buttonOffset.x + x, buttonOffset.y + y);

		options[name] = option;
		optionIndex.push(name);
		_options.add(option);

	}

	public function unselectOptions() : Void {
		for (i in options.keys()) {
			options[i].setOff();
		}
	}

	public function selectOption(name:String) : Void {
		if (options.exists(name)) {
			options[name].setOn();
		}
	}

	override public function update(elapsed:Float) : Void {
		unselectOptions();

		if (FlxG.keys.justPressed.DOWN) {
			selectedOption += 1;

			if (selectedOption >= optionIndex.length) {
				selectedOption = 0;
			}

			trace("Menu (down): ", selectedOption, optionIndex[selectedOption], options[optionIndex[selectedOption]]);

		} else if (FlxG.keys.justPressed.UP) {
			selectedOption -= 1;

			if (selectedOption < 0) {
				selectedOption = optionIndex.length - 1;
			}

			trace("Menu (up): ", selectedOption, optionIndex[selectedOption], options[optionIndex[selectedOption]]);
		} else if (FlxG.keys.justPressed.ENTER) {
			triggerOption(optionIndex[selectedOption]);
		}

		if (selectedOption != -1) {
			selectOption(optionIndex[selectedOption]);
		}

		super.update(elapsed);

	}

}
