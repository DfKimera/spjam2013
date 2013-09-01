package engine {

	import avmplus.getQualifiedClassName;

	import flash.display.Stage;

	import flash.utils.getQualifiedClassName;

	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxExtendedSprite;

	public class Inventory extends FlxGroup {

		[Embed(source="../../assets/inventory_background.png")]
		public static var BACKGROUND:Class;

		private var scene:Scene;
		public var $items:FlxGroup = new FlxGroup();
		public var background:FlxSprite;

		public var isOpen:Boolean = false;

		public var itemPositionOffset:Array = [210,120];
		public var itemMargin:int = 10;
		public var currentItem:int = 0;
		public var maxItemsPerRow:int = 4;

		public function Inventory(scene:Scene) {
			Inventory.invGrid =  this;

			this.scene = scene;

			trace("Inventory registered on scene: ", scene);

			background = new FlxSprite(0,0);
			background.loadGraphic(BACKGROUND);

			add(background);
			add($items);

			this.generateGrid();
		}

		private function generateGrid():void {
			for(var itemType:String in Inventory.items) {
				if(!Inventory.items[itemType]) { continue; }
				placeItemOnGrid(Inventory.items[itemType]);
			}
		}

		private function redrawGrid():void {
			$items.clear();
			this.generateGrid();
		}

		private function placeItemOnGrid(item:Item):void {

			var icon:FlxExtendedSprite = item.icon;
			icon.name = getQualifiedClassName(item);
			icon.mouseReleasedCallback = this.onGridIconPick;

			var col:int = (currentItem % maxItemsPerRow);
			var row:int = Math.floor(currentItem / maxItemsPerRow);

			icon.x = itemPositionOffset[0] + (col * (80 + itemMargin));
			icon.y = itemPositionOffset[1] + (row * (80 + itemMargin));

			$items.add(icon);

			currentItem++;

		}

		private function onGridIconPick(icon:FlxExtendedSprite, x:int, y:int):void {
			var itemType:String = icon.name;
			var item:Item = Inventory.getItemOfType(itemType);

			if(Inventory.isHoldingItem()) {
				item._onCombine( Inventory.getHeldItem() );
			}

			trace("Picked item from grid: ", item);

			Inventory.holdItemOnCursor(item);

		}

		public override function kill():void {
			$items.clear();
		}

		private function show():void {
			trace("Opening inventory: ", this,  this.scene);
			this.scene.add(this);
			this.isOpen = true;
		}

		private function hide():void {
			trace("Hiding inventory: ", this,  this.scene);
			this.scene.remove(this);
			this.isOpen = false;
		}

		// -------------------------------------------------------------------------------------------------------------

		private static var invGrid:Inventory;
		private static var items:Array = [];

		/**
		 * Adds an item to the player's inventory.
		 * @param item Item The item to be added.
		 */
		public static function addToInventory(item:Item):void {
			Inventory.items[getQualifiedClassName(item)] = item;
			invGrid.placeItemOnGrid(item);
		}

		/**
		 * Removes an item from the player's inventory.
		 * @param item Item The item to be removed.
		 */
		public static function removeFromInventory(item:Item):void {
			Inventory.items[getQualifiedClassName(item)] = null;
			invGrid.$items.clear();
			invGrid.generateGrid();
		}

		/**
		 * Checks if a player has an item in his inventory.
		 * @param item Item The item to check.
		 * @return Boolean
		 */
		public static function hasItem(item:Item):Boolean {
			var i:Item = Inventory.items[getQualifiedClassName(item)];
			return (i != null);
		}

		/**
		 * Checks if a player has an item of a certain qualified class name.
		 * @param type String The item's qualified class name.
		 * @return Boolean
		 */
		public static function hasItemOfType(type:String):Boolean {
			return Inventory.items.hasOwnProperty(type);
		}

		/**
		 * Gets an item from the inventory by it's qualified class name.
		 * @param type String The item's qualified class name.
		 * @return
		 */
		public static function getItemOfType(type:String):Item {
			return Inventory.items[type];
		}

		/**
		 * Shows the inventory grid.
		 */
		public static function show():void {
			if(Inventory.invGrid is Inventory) {
				Inventory.invGrid.show();
			}
		}

		/**
		 * Hides the inventory grid.
		 */
		public static function hide():void {
			if(Inventory.invGrid is Inventory) {
				Inventory.invGrid.hide();
			}
		}

		/**
		 * Checks if the inventory grid is open.
		 * @return Boolean
		 */
		public static function isOpen():Boolean {
			return (Inventory.invGrid is Inventory && Inventory.invGrid.isOpen);
		}

		/**
		 * Forces an inventory grid redraw.
		 */
		public static function redrawGrid():void {
			if(Inventory.invGrid is Inventory) {
				Inventory.invGrid.redrawGrid();
			}
		}

		/**
		 * Check if the player is holding an item from the inventory.
		 * @return Boolean
		 */
		public static function isHoldingItem():Boolean {
			if(FlxG.state is Scene) {
				return ((FlxG.state as Scene).selectedItemIcon != null);
			}

			return false;
		}

		/**
		 * Returns the item currently being held by the player, or null if none.
		 * @return Boolean
		 */
		public static function getHeldItem():Item {
			if(!Inventory.isHoldingItem()) { return null; }
			if(!(FlxG.state is Scene)) { return null; }
			return Inventory.getItemOfType( (FlxG.state as Scene).selectedItemIcon.name );
		}

		/**
		 * Returns the currently being held item's icon, or null if no item is being held.
		 * @return Boolean
		 */
		public static function getHeldItemIcon():FlxExtendedSprite {
			if(!(FlxG.state is Scene)) { return null; }
			return (FlxG.state as Scene).selectedItemIcon;
		}

		/**
		 * Holds an item in the player's cursor.
		 * @param item Item The item to be held.
		 */
		public static function holdItemOnCursor(item:Item):void {
			(FlxG.state as Scene).holdItemOnCursor(item);
		}

		/**
		 * Releases whichever item is being held on the player's cursor.
		 */
		public static function releaseItemOnCursor():void {
			(FlxG.state as Scene).releaseItemOnCursor();
		}
	}

}
