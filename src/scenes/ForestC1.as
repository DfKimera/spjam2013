package scenes {

	import characters.Sherlock;

	import engine.Item;
	import engine.Prop;
	import engine.Scene;

	public class ForestC1 extends Scene {

		[Embed(source="../../assets/scene_c1.png")]
		public var BACKGROUND:Class;

		public var sherlock:Sherlock = new Sherlock();

		public override function prepare():void {
			setBackground(BACKGROUND);
			setFadeInDelay(1);
		}

		public override function create():void {

			sherlock = new Sherlock();

			super.create();

		}

		override public function onPropInteract(prop:Prop):void {

		}

		override public function onItemUse(prop:Prop,item:Item):void {

		}

		override public function onItemPick(item:Item):void {

		}

		override public function onItemCombine(item1:Item,item2:Item):void {

		}

		override public function onBackgroundClick(x:int,y:int):void {

		}
	}
}
