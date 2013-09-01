package engine {
	import org.flixel.FlxG;

	public class Cursor {

		[Embed(source="../../assets/cursor_arrow.png")]
		public static var SPRITE_ARROW:Class;

		[Embed(source="../../assets/cursor_hand.png")]
		public static var SPRITE_HAND:Class;

		[Embed(source="../../assets/cursor_eye.png")]
		public static var SPRITE_EYE:Class;

		public static var isVisible:Boolean = true;

		public static var shouldUseHand:Boolean = false;
		public static var shouldUseEye:Boolean = false;

		public static function useArrow():void {
			shouldUseEye = false;
			shouldUseHand = false;
		}

		public static function useHand():void {
			shouldUseHand = true;
		}

		public static function useEye():void {
			shouldUseEye = true;
		}

		public static function hide():void {
			Cursor.isVisible = false;
		}

		public static function show():void {
			Cursor.isVisible = true;
		}

		public static function reset():void {
			Cursor.useArrow();
		}

		public static function update():void {

			if(Cursor.isVisible) {
				if(shouldUseHand && !Inventory.isOpen()) {
					FlxG.mouse.show(SPRITE_HAND);
				} else if(shouldUseEye && !Inventory.isOpen()) {
					FlxG.mouse.show(SPRITE_EYE);
				} else {
					FlxG.mouse.show(SPRITE_ARROW);
				}
			} else {
				FlxG.mouse.hide();
			}

		}

	}
}
