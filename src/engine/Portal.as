package engine {

	public class Portal extends Prop {

		public function Portal(name:String, width:int, height:int) {
			super();
			this.name = name;
			this.width = width;
			this.height = height;
		}

		override public function draw():void { /* Prevent drawing */ }

		override public function toString():String {
			return "Portal(" + name + " @" + x + "," + y + " sz=" + width + "x" + height + ")";
		}

		public static function checkIfIs(prop:Prop, name:String):Boolean {
			if(prop is Portal) {
				if((prop as Portal).name == name) {
					return true;
				}
			}

			return false;
		}

	}
}
