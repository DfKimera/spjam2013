package engine;

import flixel.FlxG;

class Cursor {

	public static final SPRITE_SKIP = "assets/cursor_skip.png";
	public static final SPRITE_ARROW = "assets/cursor_arrow_bk.png";
	public static final SPRITE_HAND = "assets/cursor_hand_bk.png";
	public static final SPRITE_EYE = "assets/cursor_eye_bk.png";
	public static final SPRITE_DOOR = "assets/cursor_door_bk.png";

	public static var isVisible:Bool = true;

	public static var shouldUseSkip:Bool = false;
	public static var shouldUseHand:Bool = false;
	public static var shouldUseDoor:Bool = false;
	public static var shouldUseEye:Bool = false;

	public static function useArrow():Void {
		shouldUseSkip = false;
		shouldUseHand = false;
		shouldUseDoor = false;
		shouldUseEye = false;
	}

	public static function useSkip():Void { shouldUseSkip = true; }

	public static function useHand():Void { shouldUseHand = true; }

	public static function useDoor():Void { shouldUseDoor = true; }

	public static function useEye():Void { shouldUseEye = true; }

	public static function hide():Void { Cursor.isVisible = false; }

	public static function show():Void { Cursor.isVisible = true; }

	public static function reset():Void { Cursor.useArrow(); }

	public static function update():Void {
		if (!Cursor.isVisible) {
			FlxG.mouse.visible = false;
			return;
		}

		if (shouldUseSkip) {
			FlxG.mouse.load(SPRITE_SKIP);
		} else if (shouldUseHand && !Inventory.isMouseOver()) {
			FlxG.mouse.load(SPRITE_HAND);
		} else if (shouldUseDoor && !Inventory.isMouseOver()) {
			FlxG.mouse.load(SPRITE_DOOR);
		} else if (shouldUseEye && !Inventory.isMouseOver()) {
			FlxG.mouse.load(SPRITE_EYE);
		} else {
			FlxG.mouse.load(SPRITE_ARROW);
		}
	}

	public function new() {}
}
