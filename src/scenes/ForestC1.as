package scenes {

	import characters.Hunter1;
	import characters.Sherlock;

	import engine.Dialog;

	import engine.Item;
	import engine.Portal;
	import engine.Prop;
	import engine.Scene;

	import items.DryLeaves;

	import items.Knife;

	import items.RustyKnife;
	import items.Scissors;

	import props.DryLeavesCushion;

	public class ForestC1 extends Scene {

		[Embed(source="../../assets/scene_c1.png")]
		public var BACKGROUND:Class;

		public var sherlock:Sherlock = new Sherlock();
		public var hunter:Hunter1 = new Hunter1();

		public var cushion:DryLeavesCushion;

		public var hunterIsReleased:Boolean = false;
		public var cushionIsPlaced:Boolean = false;
		public var portalCreated:Boolean = false;

		public static var visited:Boolean = false;

		public override function prepare():void {
			setBackground(BACKGROUND);
			setFadeInDelay(1);
		}

		public override function create():void {

			super.create();

			sherlock = new Sherlock();
			cushion = new DryLeavesCushion();
			hunter = new Hunter1();

			cushion.visible = false;

			if(!visited) {
				Dialog.show(this, sherlock, "Mexa esse traseiro gordo, Epson! Salve o nobre rapaz!", "default", "bottom");
			}

			Prop.placeOnScene(this, cushion, 370, 470);
			Prop.placeOnScene(this, hunter, 370, 0);
			Item.placeOnScene(this, new DryLeaves(), 210, 470);
			Item.placeOnScene(this, new RustyKnife(), 520, 440);

			Portal.placeOnScene(this, "to_p1", 0, 540, 800, 60, ForestP1);

			visited = true;

		}

		override public function onPropInteract(prop:Prop):void {
			if(prop is Hunter1) {
				if(!hunterIsReleased) {
					Dialog.show(this, hunter, "Me tire daqui!!", "hanging", "bottom");
				} else {
					Dialog.show(this, hunter, "Obrigado, senhores!");
					Dialog.show(this, sherlock, "Disponha, nobre rapaz. Agora, me diga, quem foi que te pendurou ali?", "default", "bottom");
					Dialog.show(this, hunter, "Não vi direito, só reparei que era bem ruivo, cabelo todo bagunçado!");

					if(!portalCreated) {
						portalCreated = true;
						Portal.placeOnScene(this, "to_village", 250, 0, 330, 380, VillageScene);
					}
				}
			}
		}

		override public function onItemUse(prop:Prop,item:Item):void {
			if(prop is Hunter1 && item is RustyKnife) {
				Dialog.show(this, sherlock, "A faca está cega demais para cortar! Puxa, se tivessemos algo mais... cortante...", "default", "bottom");
				return;
			}

			if(prop is Hunter1 && item is Scissors) {
				Dialog.show(this, sherlock, "A corda é forte demais para cortar com uma tesoura...", "default", "bottom");
				return;
			}

			if(prop is Hunter1 && item is DryLeaves) {
				item.consume();
				cushion.visible = true;
				cushionIsPlaced = true;
				return;
			}

			if(prop is Hunter1 && item is Knife) {

				if(!cushionIsPlaced) {
					Dialog.show(this, sherlock, "Espere! Precisamos de algo para amortecer a queda!");
					return;
				}

				Dialog.show(this, hunter, "WAAAAH!");
				hunter.play("sitting");
				hunterIsReleased = true;

			}
		}

		override public function onItemPick(item:Item):void {
			if(item is RustyKnife) {
				Dialog.show(this, sherlock, "Hmm, o que fazer com uma faca sem fio?");
			}
		}

		override public function onItemCombine(item1:Item,item2:Item):void {

		}

		override public function onBackgroundClick(x:int,y:int):void {

		}
	}
}
