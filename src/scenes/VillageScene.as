package scenes {

	import characters.Sherlock;

	import engine.Dialog;

	import engine.Item;
	import engine.Portal;
	import engine.Prop;
	import engine.Scene;

	import items.Key1;

	import props.Gate;

	public class VillageScene extends Scene {

		[Embed(source="../../assets/scene_village.jpg")]
		public var BACKGROUND:Class;

		public var sherlock:Sherlock = new Sherlock();
		public var treePortal:Portal;
		public var gate:Gate;

		public static var visited:Boolean = false;
		public static var gateOpen:Boolean = false;

		public override function prepare():void {
			setBackground(BACKGROUND);
			setFadeInDelay(1);
			Game.playMusic("game");
		}

		public override function create():void {

			super.create();

			sherlock = new Sherlock();

			if(!visited) {
				Dialog.show(this,sherlock, "Veja, Epson! Uma aldeia! Parece abandonada...").sound("surprise");
				visited = true;
			}

			if(ForestC1.cleared) {
				Portal.placeOnScene(this, "Clareira", 0, 350, 150, 250, ForestC1);
			} else {
				Portal.placeOnScene(this, "Floresta", 0, 350, 150, 250, ForestP1);
			}

			Portal.placeOnScene(this, "Clareira", 650, 350, 150, 250, ForestC2);
			treePortal = Portal.placeOnScene(this, "Árvore", 260, 0, 140, 300, ForestTree);

			gate = Prop.placeOnScene(this, new Gate(), 270, 0) as Gate;

			if(gateOpen) {
				openGate();
			}

		}

		public function openGate():void {
			treePortal.ID = int.MAX_VALUE - 100;
			gate.play("open");
			gateOpen = true;
		}

		override public function onPropInteract(prop:Prop):void {
			if(prop is Gate && !gateOpen) {
				Dialog.show(this, sherlock, "Droga, o portão está fechado... Com quem será que está a chave?").sound("wonder");
			}
		}

		override public function onItemUse(prop:Prop,item:Item):void {
			if(prop is Gate && item is Key1 && !gateOpen) {
				item.consume();
				openGate();
			}
		}
	}
}
