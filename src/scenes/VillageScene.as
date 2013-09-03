package scenes {

	import characters.Sherlock;

	import engine.Dialog;

	import engine.Item;
	import engine.Portal;
	import engine.Prop;
	import engine.Scene;

	public class VillageScene extends Scene {

		[Embed(source="../../assets/scene_village.png")]
		public var BACKGROUND:Class;

		public var sherlock:Sherlock = new Sherlock();

		public static var visited:Boolean = false;

		public override function prepare():void {
			setBackground(BACKGROUND);
			setFadeInDelay(1);
		}

		public override function create():void {

			super.create();

			sherlock = new Sherlock();

			if(!visited) {
				Dialog.show(this,sherlock, "Veja, Epson! Uma aldeia! Parece abandonada...");
				visited = true;
			}

			if(ForestC1.cleared) {
				Portal.placeOnScene(this, "Clareira", 0, 350, 150, 250, ForestC1);
			} else {
				Portal.placeOnScene(this, "Floresta", 0, 350, 150, 250, ForestP1);
			}

			Portal.placeOnScene(this, "Clareira", 650, 350, 150, 250, ForestC2);

			// TODO: add gate, openable with key, leads to C3

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
