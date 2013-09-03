package scenes {

	import characters.Sherlock;

	import engine.Dialog;
	import engine.Inventory;
	import engine.Item;
	import engine.Prop;
	import engine.Scene;

	import items.ScissorsPiece1;

	import engine.Portal;

	public class StartingScene extends Scene {

		[Embed(source="../../assets/scene_start.png")]
		public var BACKGROUND:Class;

		public var sherlock:Sherlock;

		public static var visited:Boolean = false;

		public override function prepare():void {
			setBackground(BACKGROUND);
			setFadeInDelay(1);
		}

		public override function create():void {

			super.create();

			sherlock = new Sherlock();

			if(!visited) {
				Dialog.show(this, sherlock, "Veja Watson! Pegadas!");
				Dialog.show(this, sherlock, "Qual caminho devemos seguir?");
			}

			Portal.placeOnScene(this, "Floresta", 0, 80, 120, 400, ForestP1);
			Portal.placeOnScene(this, "Floresta", 680, 80, 120, 400, ForestP2);

			Prop.placeOnScene(this, sherlock, 540, 225);
			Portal.placeOnScene(this, "Pegadas", 250, 400, 270, 200);

			if(!Inventory.hasItemOfType("items::Scissors")) {
				Item.placeOnScene(this, new ScissorsPiece1(), 100, 535);
			}

			visited = true;

		}

		override public function onPropInteract(prop:Prop):void {
			if(Portal.checkIfIs(prop, "Pegadas")) {
				Dialog.show(this, sherlock, "Alguem não fez questão de esconder os rastros");
			}
		}

		override public function onItemUse(prop:Prop, item:Item):void {

		}

		override public function onItemPick(item:Item):void {

			if(item is ScissorsPiece1) {
				Dialog.show(this, sherlock, "Não fique pegando lixo, Epson!");
				Inventory.show();
			}

		}

		override public function onItemCombine(item1:Item,item2:Item):void {

		}

		override public function onBackgroundClick(x:int,y:int):void {

		}
	}
}
