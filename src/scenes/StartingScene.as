package scenes {

	import characters.Sherlock;

	import engine.DialogBox;
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

		/**
		 * Called before the scene is created; should be used to set background and fade delays.
		 */
		public override function prepare():void {
			setBackground(BACKGROUND);
			setFadeInDelay(1);
		}

		/**
		 * Called when the scene is created.
		 * If overridden, don't forget to call super.create();.
		 */
		public override function create():void {

			sherlock = new Sherlock();

			DialogBox.show(this, sherlock, "Veja Watson! Pegadas!");
			DialogBox.show(this, sherlock, "Qual caminho devemos seguir?");

			Portal.placeOnScene(this, "to_p1", 0, 80, 120, 400, ForestP1);
			Portal.placeOnScene(this, "to_p2", 680, 80, 120, 400, ForestP2);

			Prop.placeOnScene(this, sherlock, 540, 225);
			Portal.placeOnScene(this, "footsteps", 350, 400, 270, 200);

			Item.placeOnScene(this, new ScissorsPiece1(), 100, 535);

			super.create();

		}

		/**
		 * Called when the player interacts with a prop.
		 * @param prop Prop The interacted prop.
		 */
		override public function onPropInteract(prop:Prop):void {
			if(Portal.checkIfIs(prop, "footsteps")) {
				DialogBox.show(this, sherlock, "Alguem não fez questão de esconder os rastros");
			}
		}

		/**
		 * Called when the player uses an item on a prop.
		 * @param prop Prop The prop triggered.
		 * @param item Item The item used.
		 */
		override public function onItemUse(prop:Prop,item:Item):void {

		}

		/**
		 * Called when the player picks an item.
		 * @param item Item The picked item.
		 */
		override public function onItemPick(item:Item):void {

			if(item is ScissorsPiece1) {
				// TODO: trocar fonte por uma com suporte unicode
				DialogBox.show(this, sherlock, "Não fique pegando lixo, Epson!");
				Inventory.show();
			}

		}

		/**
		 * Called when two items are combined together
		 * @param item1 Item The first item (target).
		 * @param item2 Item The second item (origin).
		 */
		override public function onItemCombine(item1:Item,item2:Item):void {

		}

		/**
		 * Called when a player clicks on the background (not on any prop/item).
		 * @param x int The X position.
		 * @param y int The Y position.
		 */
		override public function onBackgroundClick(x:int,y:int):void {

		}
	}
}
