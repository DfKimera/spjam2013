package engine;

import engine.Assets;
import engine.Scene;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.sound.FlxSound;
import flixel.FlxSprite;
import flixel.util.FlxTimer;
import photonstorm.FlxExtendedSprite;
import flixel.text.FlxText;
import haxe.Constraints.Function;

class Dialog extends FlxGroup {

	private static final BACKGROUND_TOP = "assets/character_dialog_box.png";
	private static final BACKGROUND_BOTTOM = "assets/character_dialog_box_bottom.png";
	private static final TITLE_FONT = "assets/comiczine.otf";
	private static final TEXT_FONT = "assets/komika.ttf";

	public var isActive:Bool = false;
	public var isCompleted:Bool = false;
	public var scene:Scene;

	public var character:Character;
	public var message:String;
	public var expression:String;
	public var position:String;

	private var fxTimer:FlxTimer = new FlxTimer();
	private var fxDisplay:String;
	private var fxBuffer:Array<Dynamic>;

	public var offsetY:Int = 0;

	public var background:FlxExtendedSprite;
	public var portrait:FlxSprite;
	public var portraitOffset:Array<Dynamic> = [10, 16];

	public var title:FlxText;
	public var titleOffset:Array<Dynamic> = [125, 14, 610];

	public var text:FlxText;
	public var textOffset:Array<Dynamic> = [125, 52, 610];

	private static var currentSFX:FlxSound = null;
	private var soundToPlay:String = null;

	public var onCloseCallback:Function = null;

	public function new(scene:Scene, character:Character, message:String, expression:String = "default", position:String = "top") {
		super();

		trace("Dialog: ", Type.getClass(scene), Type.getClass(character), message, expression);

		this.scene = scene;
		this.character = character;
		this.message = message;
		this.position = position;

		this.fxDisplay = "";
		this.fxBuffer = Utils.reverseArray(message.split(""));

		this.expression = expression;
		this.offsetY = ((this.position == "bottom")) ? (FlxG.height - 130) : 0;

		background = new FlxExtendedSprite(0, 0);
		background.loadGraphic(Assets.graphic((this.position == "bottom") ? BACKGROUND_BOTTOM : BACKGROUND_TOP), false, 800, 600);
		background.mouseReleasedCallback = this.skipDialog;
		add(background);
		background.ID = 0x7FFFFFFE;

		portrait = character.getPortrait(expression);
		//resetPortraitPosition();
		add(portrait);

		title = new FlxText(titleOffset[0], titleOffset[1] + offsetY, titleOffset[2], character.characterName);
		title.setFormat(TITLE_FONT, 32, 0x9ee03f, "left", 0xFF000000);
		add(title);

		text = new FlxText(textOffset[0], textOffset[1] + offsetY, textOffset[2], "");
		text.setFormat(TEXT_FONT, 18, 0xFFFFFF, "left", 0xFF000000);
		add(text);
	}

	private function resetPortraitPosition():Void {
		if (portrait == null) {
			return;
		}

		portrait.x = portraitOffset[0];
		portrait.y = portraitOffset[1] + offsetY;
	}

	public function sound(name:String):Dialog {
		soundToPlay = name;
		return this;
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);

		if (background.mouseOver) {
			Cursor.useSkip();
		}

		if ((FlxG.keys.justPressed.ENTER || FlxG.keys.justPressed.SPACE) && isActive) {
			this.skipDialog();
		}
	}

	public function skipDialog(spr:FlxExtendedSprite = null, x:Int = 0, y:Int = 0):Void {
		if (!isCompleted) {
			this.completeMessage();
			return;
		}

		isActive = false;
		var dialog:Dialog = this;

		Utils.fadeOutGroup(dialog, Config.DIALOG_FADE_DELAY, function():Void {
			scene.ui.remove(dialog);
			openDialog = null;

			if (dialog.onCloseCallback != null) {
				Reflect.callMethod(null, dialog.onCloseCallback, []);
			}

			Dialog.advanceQueue();

			dialog.kill();
			dialog.destroy();
		});
	}

	private function completeMessage():Void {
		this.fxDisplay = this.message;
		this.text.text = this.fxDisplay;
		this.isCompleted = true;
		this.fxTimer.cancel();
	}

	private function displayMoreCharacters(timer:FlxTimer = null):Void {
		if (this.fxBuffer.length > 0) {
			this.fxDisplay += this.fxBuffer.pop();
			this.text.text = this.fxDisplay;
		}
		else {
			this.completeMessage();
		}
	}

	override public function kill():Void {
		this.remove(portrait);
		portrait = null;
		super.kill();
	}

	private function _show():Void {
		resetPortraitPosition();
		scene.dialog.add(this);
		isActive = true;
		fxTimer.start(Config.DIALOG_CHARACTER_DELAY, this.displayMoreCharacters, 0);
	}

	// -------------------------------------------------------------------------------------------------------------

	public static var openDialog:Dialog = null;
	public static var dialogQueue:Array<Dialog> = new Array<Dialog>();

	/**
     * Shows a dialog box.
     * @param scene Scene The scene to display on.
     * @param character Character The talking character.
     * @param message String The dialog message.
     * @param expression String The character's portrait expression (as defined on the character).
     * @param position String The box position ("top" or "bottom")
     * @return Dialog
     */
	public static function show(scene:Scene, character:Character, message:String, expression:String = "default", position:String = "top"):Dialog {
		var dialog:Dialog = new Dialog(scene, character, message, expression, position);

		if (openDialog != null) {
			trace("Added dialog to queue: ", dialog);
			dialogQueue.push(dialog);
		}
		else {
			Dialog.showDialog(dialog);
		}

		return dialog;
	}

	public static function showDialog(dialog:Dialog):Void {
		openDialog = dialog;

		for (m in dialog.members) {
			if (m != null) {
				(cast m : FlxSprite).alpha = 0;
			}
		}

		dialog._show();

		haxe.Timer.delay(function():Void {
			if (dialog.soundToPlay != null) {
				if (Std.is(Dialog.currentSFX, FlxSound)) {
					Dialog.currentSFX.stop();
				}
				Dialog.currentSFX = SFX.play(dialog.soundToPlay);
			}
		}, 1);

		Utils.fadeInGroup(dialog, Config.DIALOG_FADE_DELAY);
	}

	private static function advanceQueue():Void {
		if (dialogQueue.length > 0) {
			var dialog:Dialog = dialogQueue.shift();
			trace("Showing dialog from queue: ", dialog, "(" + dialogQueue.length + " left in queue)");

			Dialog.showDialog(dialog);
		}
	}

	/**
     * Checks if there are any pending dialogs waiting to be displayed
     * @return Boolean
     */
	public static function isPending():Bool {
		return (Dialog.dialogQueue.length > 0) || (Std.is(openDialog, Dialog));
	}

	/**
     * Clears the dialog box queue
     */
	public static function clearAll():Void {
		if (Std.is(openDialog, Dialog)) {
			openDialog.fxTimer.cancel();
			openDialog.fxTimer.destroy();
			openDialog.kill();
			openDialog.destroy();
		}

		openDialog = null;
		Dialog.dialogQueue = new Array<Dialog>();

		trace("Dialog: cleared all dialog boxes from queue");
	}
}

