package {
	import org.flixel.plugin.photonstorm.FlxExtendedSprite;

	public class MenuOption extends FlxExtendedSprite {

		[Embed(source="../assets/menu_buttons.png")]
		private var SPRITE:Class;

		private var onTriggerHandler:Function;
		private var isOver:Boolean = false;

		public function MenuOption(item:String, onClickHandler:Function) {

			this.loadGraphic(SPRITE, true, false, 280, 60);

			this.onTriggerHandler = onClickHandler;
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

		public function setOn():void {
			this.isOver = true;
		}

		public function setOff():void {
			this.isOver = false;
		}

		public function trigger():void {
			trace("Menu option trigger: ", this);
			if(this.onTriggerHandler is Function) {
				this.onTriggerHandler.call();
			}
		}

		public override function update():void {

			super.update();

			if(isOver) {
				play("on");
			} else {
				play("off");
			}
		}
	}
}
