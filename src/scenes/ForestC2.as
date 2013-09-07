package scenes {

	import characters.Hunter2;
	import characters.Sherlock;

	import engine.Dialog;
	import engine.Inventory;

	import engine.Item;
	import engine.Portal;
	import engine.Prop;
	import engine.Scene;

	import items.Key1;

	import items.Liana;
	import items.Plank;

	import props.Hole;

	public class ForestC2 extends Scene {

		[Embed(source="../../assets/scene_c2.jpg")]
		public var BACKGROUND:Class;

		public var sherlock:Sherlock = new Sherlock();
		public var hunter:Hunter2 = new Hunter2();

		public var hunterRescued:Boolean = false;

		public static var visited:Boolean = false;
		public static var cleared:Boolean = false;

		public override function prepare():void {
			setBackground(BACKGROUND);
			setFadeInDelay(1);
			Game.playMusic("game");
		}

		public override function create():void {

			super.create();

			sherlock = new Sherlock();
			hunter = new Hunter2();

			Portal.placeOnScene(this, "Vilarejo", 260, 0, 290, 400, VillageScene);
			Portal.placeOnScene(this, "Floresta", 0, 540, 800, 60, ForestP2);

			Prop.placeOnScene(this, new Hole(), 440, 440);

			if(!Inventory.hasItemOfType("items::Plank") && !cleared) {
				Item.placeOnScene(this, new Plank(), 440, 440);
			}

			if(cleared) {
				Prop.placeOnScene(this, hunter, 520, 410);
			}

			visited = true;

		}

		override public function onPropInteract(prop:Prop):void {
			if(prop is Hole) {
				if(!cleared) {
					Dialog.show(this, hunter, "Me tirem daqui!!").sound("hole");
					Dialog.show(this, sherlock, "Como podemos ajudá-lo, Epson?").sound("wonder");
				} else {
					Dialog.show(this, sherlock, "É um buraco bem fundo!").sound("dialog");
				}
				return;
			}

			if(prop is Hunter2) {
				Dialog.show(this, hunter, "Phew! Obrigado!!").sound("dialog");
				Dialog.show(this, sherlock, "Pois bem! Me diga, quem foi que te colocou aí?").sound("dialog");
				Dialog.show(this, hunter, "Ele me pegou de costas, não consegui ver...").sound("dialog");
				var dialog:Dialog = Dialog.show(this, hunter, "Mas percebi que era um anão... ou uma criança...").sound("dialog");
				Sketch.show(this, "short", dialog);
			}
		}

		override public function onItemUse(prop:Prop,item:Item):void {
			if(prop is Hole) {
				if(item is Liana && !cleared) {
					Prop.placeOnScene(this, hunter, 520, 410);
					hunter.ID = int.MAX_VALUE - 100;
					Dialog.show(this, hunter, "PHEW!").sound("dialog");
					Dialog.show(this, sherlock, "Muito bem, Epson!").sound("surprise");

					if(ForestC1.cleared) {
						Inventory.addToInventory(new Key1());
						Dialog.show(this, hunter, "Aqui, tome a chave do portão da cidade. Ele deve ter se escondido na mata fechada.").sound("dialog");
					}

					cleared = true;
				} else {
					Dialog.show(this, sherlock, "Não vejo como isso poderia ajudá-lo, Epson.").sound("taunt");
				}
			}
		}

		override public function onItemPick(item:Item):void {
			if(item is Plank) {
				Dialog.show(this, sherlock, "Você daria um bom lixeiro, Epson...").sound("taunt");
			}
		}
	}
}
