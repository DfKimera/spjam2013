package engine {

	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	import org.flixel.FlxTimer;
	import org.flixel.plugin.photonstorm.FlxDelay;

	public class Dialog extends FlxGroup {

		[Embed(source="../../assets/character_dialog_box.png")]
		private var BACKGROUND:Class;

		[Embed(source="../../assets/comiczine.otf", fontFamily="comiczine", embedAsCFF="false")]
		private var TITLE_FONT:Class;

		[Embed(source="../../assets/cartoonisthand.ttf", fontFamily="cartoonisthand", embedAsCFF="false")]
		private var TEXT_FONT:Class;

		public var isActive:Boolean = true;
		public var isCompleted:Boolean = false;
		public var scene:Scene;

		public var character:Character;
		public var message:String;
		public var expression:String;
		public var position:String;

		private var fxTimer:FlxTimer = new FlxTimer();
		private var fxDisplay:String;
		private var fxBuffer:Array;

		public var offsetY:int = 0;

		public var background:FlxSprite;
		public var portrait:FlxSprite;
		public var portraitOffset:Array = [10,16];

		public var title:FlxText;
		public var titleOffset:Array = [125, 14, 610];

		public var text:FlxText;
		public var textOffset:Array = [125, 52, 610];

		public function Dialog(scene:Scene, character:Character, message:String, expression:String = "default", position:String = "top") {

			trace("Dialog: ", scene, character, message, expression);

			this.scene = scene;
			this.character = character;
			this.message = message;
			this.position = position;

			this.fxDisplay = "";
			this.fxBuffer = message.split('').reverse();

			this.expression = expression;
			this.offsetY = (this.position == "bottom") ? (FlxG.height - 130) : 0;

			background = new FlxSprite(0, offsetY);
			background.loadGraphic(BACKGROUND, false, false, 800, 130);
			add(background);

			portrait = character.getPortrait(expression);
			//resetPortraitPosition();
			add(portrait);

			title = new FlxText(titleOffset[0], titleOffset[1] + offsetY, titleOffset[2], character.characterName);
			title.setFormat("comiczine", 32, 0x9ee03f, "left", 0xFF000000);
			add(title);

			text = new FlxText(textOffset[0], textOffset[1] + offsetY, textOffset[2], "");
			text.setFormat("cartoonisthand", 20, 0xFFFFFF, "left", 0xFF000000);
			add(text);


		}

		private function resetPortraitPosition():void {
			portrait.x = portraitOffset[0];
			portrait.y = portraitOffset[1] + offsetY;
		}

		public override function update():void {
			if(FlxG.keys.justPressed("ENTER") && isActive) {

				if(!isCompleted) {
					this.completeMessage();
					return;
				}

				isActive = false;
				var dialog:Dialog = this;

				Utils.fadeOutGroup(dialog, Config.DIALOG_FADE_DELAY, function():void {
					scene.ui.remove(dialog);
					openDialog = null;

					Dialog.advanceQueue();

					dialog.kill();
					dialog.destroy();
				})

			}


		}

		private function completeMessage():void {
			this.fxDisplay = this.message;
			this.text.text = this.fxDisplay;
			this.isCompleted = true;
			this.fxTimer.stop();
		}

		private function displayMoreCharacters(timer:FlxTimer = null):void {
			if(this.fxBuffer.length > 0) {
				this.fxDisplay += this.fxBuffer.pop();
				this.text.text = this.fxDisplay;
			} else {
				this.completeMessage();
			}

		}

		public override function kill():void {
			this.remove(portrait);
			portrait = null;
			super.kill();
		}

		private function show():void {
			resetPortraitPosition();
			scene.ui.add(this);
			fxTimer.start(Config.DIALOG_CHARACTER_DELAY, 0, this.displayMoreCharacters);
		}

		// -------------------------------------------------------------------------------------------------------------

		public static var openDialog:Dialog = null;
		public static var dialogQueue:Vector.<Dialog> = new Vector.<Dialog>();

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
			var dialog:Dialog = new Dialog(scene,  character, message, expression, position);

			if(openDialog != null) {
				trace("Added dialog to queue: ", dialog);
				dialogQueue.push(dialog);
			} else {
				Dialog.showDialog(dialog);
			}

			return dialog;
		}

		private static function showDialog(dialog:Dialog):void {
			openDialog = dialog;

			dialog.setAll("alpha", 0);
			dialog.show();

			Utils.fadeInGroup(dialog, Config.DIALOG_FADE_DELAY);
		}

		private static function advanceQueue():void {

			if(dialogQueue.length > 0) {
				var dialog:Dialog = dialogQueue.shift();
				trace("Showing dialog from queue: ", dialog, "("+dialogQueue.length+" left in queue)");

				Dialog.showDialog(dialog);
			}

		}

		/**
		 * Checks if there are any pending dialogs waiting to be displayed
		 * @return Boolean
		 */
		public static function isPending():Boolean {
			return (Dialog.dialogQueue.length > 0) || (openDialog is Dialog);
		}

		/**
		 * Clears the dialog box queue
		 */
		public static function clearAll():void {

			if(openDialog is Dialog) {
				openDialog.fxTimer.stop();
				openDialog.fxTimer.destroy();
				openDialog.kill();
				openDialog.destroy();
			}

			openDialog = null;
			Dialog.dialogQueue = new Vector.<Dialog>();

			trace("Dialog: cleared all dialog boxes from queue");
		}


	}
}
