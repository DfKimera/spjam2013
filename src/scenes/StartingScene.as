package scenes {

	import characters.TestCharacter;

	import engine.Character;
	import engine.DialogBox;
	import engine.Item;
	import engine.Prop;
	import engine.Scene;

	import items.TestItem;

	import props.TestProp;

	public class StartingScene extends Scene {

		[Embed(source="../../assets/scenebg_start.jpg")]
		public var BACKGROUND:Class;

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

			Prop.placeOnScene(this, new TestCharacter(), 100, 100);
			Prop.placeOnScene(this, new TestProp(), 400, 100);

			Item.placeOnScene(this, new TestItem(), 350, 350);

			super.create();

		}

		/**
		 * Called when the player interacts with a prop.
		 * @param prop Prop The interacted prop.
		 */
		override public function onPropInteract(prop:Prop):void {

			if(prop is TestCharacter) {
				DialogBox.show(this, prop as Character, "Hello there!", "default", "top");
				DialogBox.show(this, prop as Character, "Lorem ipsum dolor!", "default", "bottom");
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
