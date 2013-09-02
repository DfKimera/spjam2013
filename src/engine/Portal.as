package engine {

	import engine.Prop;

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

	}
}
