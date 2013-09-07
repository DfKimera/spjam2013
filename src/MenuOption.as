package {
	import engine.SFX;

	import org.flixel.plugin.photonstorm.FlxExtendedSprite;

	public class MenuOption extends FlxExtendedSprite {

		[Embed(source="../assets/menu_buttons.png")]
		private var SPRITE:Class;

		private var onTriggerHandler:Function;
		private var isOver:Boolean = false;
		private var playedSFX:Boolean = false;

		public function MenuOption(item:String, onTriggerHandler:Function) {

			this.loadGraphic(SPRITE, true, false, 280, 60);

			this.onTriggerHandler = onTriggerHandler;
			this.mouseReleasedCallback = this.onClick;
			this.name = item;

			switch(item) {
				case "Jogar":
					addAnimation("off", [0]);
					addAnimation("on", [1]);
					break;

				case "Créditos":
					addAnimation("off", [2]);
					addAnimation("on", [3]);
					break;
			}

			play("off");


		}

		private function onClick(spr:FlxExtendedSprite, x:int, y:int):void {
			this.trigger();
		}

		public function setOn():void {
			this.isOver = true;
		}

		public function setOff():void {
			this.isOver = false;
		}

		public function trigger():void {
			trace("Menu option trigger: ", this);
			SFX.play("bell");
			if(this.onTriggerHandler is Function) {
				this.onTriggerHandler.call();
			}
		}

		public override function update():void {

			super.update();

			if(isOver || this.mouseOver) {
				play("on");
			} else {
				play("off");
			}
		}
	}
}
