package engine {
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxExtendedSprite;

	public class Prop extends FlxExtendedSprite {

		public function Prop():void {
			this.mouseReleasedCallback = this._onInteract;
		}

		private function _onInteract(spr:FlxExtendedSprite, x:int, y:int):void {
			trace("Prop interaction: ", this, spr, x, y);

			if(FlxG.state is Scene) {
				var scene:Scene = (FlxG.state as Scene);

				if(Inventory.isHoldingItem()) {
					this._onItemUse( Inventory.getHeldItem() );
					Inventory.releaseItemOnCursor();
					return;
				}
			}

			this.onInteract();

			if(FlxG.state is Scene) {
				(FlxG.state as Scene).onPropInteract(this);
			}

		}

		private function _onItemUse(item:Item):void {

			trace("Used item on prop", this, item);

			this.onItemUse(item);

			if(FlxG.state is Scene) {
				(FlxG.state as Scene).onItemUse(this, item);
			}

		}

		public override function update():void {
			super.update();

			this.updateCursor();
		}

		public function updateCursor():void {
			if(this.mouseOver) {
				if(Inventory.isHoldingItem()) {
					Cursor.useHand();
				} else {
					Cursor.useEye();
				}
			}
		}

		/**
		 * @abstract
		 * Called when the player interacts with this prop.
		 */
		public function onInteract():void {

		}

		/**
		 * @abstract
		 * Called when an item is used on this prop.
		 * @param item Iten The used item.
		 */
		public function onItemUse(item:Item):void {

		}

		// -------------------------------------------------------------------------------------------------------------

		/**
		 * Places a prop on the scene
		 * @param scene Scene The scene to place on.
		 * @param prop Prop The prop instance to place.
		 * @param x int The prop position on the scene.
		 * @param y int
		 */
		public static function placeOnScene(scene:Scene, prop:Prop, x:int, y:int):void {
			prop.x = x;
			prop.y = y;
			scene.props.add(prop);
		}

	}
}
