package {
	import engine.*;
	import flash.utils.setTimeout;

	import org.flixel.FlxG;
	import org.flixel.FlxSprite;

	public class Sketch extends FlxSprite {

		[Embed(source="../assets/sketch_short.png")]
		public var SKETCH_SHORT:Class;

		[Embed(source="../assets/sketch_ginger.png")]
		public var SKETCH_GINGER:Class;

		[Embed(source="../assets/sketch_feet.png")]
		public var SKETCH_FEET:Class;

		public var scene:Scene;

		public function Sketch(scene:Scene, type:String):void {
			this.x = 0;
			this.y = FlxG.height - 342;
			this.scene = scene;
			scene.ui.add(this);
			this.show(type);
		}

		private function show(type:String):void {

			var sketch:Sketch = this;

			switch(type) {
				case "short":
					loadGraphic(SKETCH_SHORT);
					break;
				case "ginger":
					loadGraphic(SKETCH_GINGER);
					break;
				case "feet":
					loadGraphic(SKETCH_FEET);
					break;
			}

			Utils.fadeIn(this, Config.PROP_FADE_DELAY, function():void {
				setTimeout(function():void {
					Utils.fadeOut(sketch, Config.PROP_FADE_DELAY, function():void {
						if(scene.ui.members) {
							scene.ui.remove(sketch);
							sketch.kill();
							sketch.destroy();
						}
					});
				}, 4000);
			})
		}

		public static function show(scene:Scene, type:String, afterDialog:Dialog = null):void {
			if(!afterDialog) {
				new Sketch(scene, type);
				return;
			}

			afterDialog.onCloseCallback = function():void {
				new Sketch(scene, type);
			};
		}



	}
}
