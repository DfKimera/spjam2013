package scenes {

	import characters.Sherlock;

	import engine.Dialog;
	import engine.Inventory;

	import engine.Item;
	import engine.Portal;
	import engine.Prop;
	import engine.SFX;
	import engine.Scene;

	import items.Knife;
	import items.RustyKnife;

	import items.Scissors;
	import items.ScissorsPiece2;

	import props.Bush;
	import props.Rock;

	public class ForestP1 extends Scene {

		[Embed(source="../../assets/scene_p1.jpg")]
		public var BACKGROUND:Class;

		public var sherlock:Sherlock = new Sherlock();

		public static var visited:Boolean = false;

		public override function prepare():void {
			setBackground(BACKGROUND);
			setFadeInDelay(1);
			Game.playMusic("game");
		}

		public override function create():void {

			super.create();

			sherlock = new Sherlock();

			if(!visited) {
				Dialog.show(this, sherlock, "As pegadas parecem levar até essa clareira", "default", "bottom").sound("dialog");
			}

			Portal.placeOnScene(this, "Clareira", 65, 10, 200, 300, ForestC1);

			Prop.placeOnScene(this, new Rock(), 155, 325);

			if(!ForestC1.visited) {
				Prop.placeOnScene(this, new Bush(), 60, 0);
			}

			if(!Inventory.hasItemOfType("items::Scissors")) {
				Item.placeOnScene(this, new ScissorsPiece2(), 530, 400);
			}

			if(ForestTree.cleared) {
				Portal.placeOnScene(this, "Floresta", 700, 0, 100, 600, EndingScene);
			} else {
				Portal.placeOnScene(this, "Floresta", 700, 0, 100, 600, StartingScene);
			}

			visited = true;

		}

		override public function onPropInteract(prop:Prop):void {
			if(prop is Bush) {
				Dialog.show(this, sherlock, "Precisamos de algo para liberar o caminho... Hmm...", "default", "bottom").sound("wonder");
				return;
			}

			if(prop is Rock) {
				Dialog.show(this, sherlock, "Mas que pedra pontuda... e afiada... hmm...", "default", "bottom").sound("wonder");
			}
		}

		override public function onItemUse(prop:Prop,item:Item):void {
			if(prop is Bush && item is Scissors) {
				Dialog.show(this, sherlock, "Elementar, meu caro Epson!").sound("surprise");
				prop.remove();
				return;
			}

			if(prop is Rock && item is RustyKnife) {
				Dialog.show(this, sherlock, "Brilhante idéia, Epson! A faca ficou afiadíssima!", "default", "bottom").sound("surprise");
				item.consume();
				Inventory.addToInventory(new Knife());
				return;
			}

			if(prop is Rock && item is Knife) {
				Dialog.show(this, sherlock, "A faca já está bem afiada!", "default", "bottom").sound("taunt");
				return;
			}

			Dialog.show(this, sherlock, "O que você está fazendo, Epson?").sound("taunt");
		}

		override public function onItemPick(item:Item):void {
			if(item is ScissorsPiece2) {
				Dialog.show(this, sherlock, "O que fazer com MEIA tesoura!?").sound("wonder");
			}
		}

	}
}
