package engine;

import engine.Assets;
import engine.Item;
import engine.Scene;
import flixel.FlxG;
import flixel.group.FlxGroup;
import photonstorm.FlxExtendedSprite;

class Inventory extends FlxGroup
{
    
    public static final BACKGROUND = "assets/inventory_grid_vertical.png";
    
    public static final BUTTON = "assets/inventory_icon.png";
    
    public static final BUTTON_OPEN = "assets/inventory_icon_open.png";
    
    public var button : FlxExtendedSprite;
    
    private var scene : Scene;
    public var __DOLLAR__items : FlxGroup = new FlxGroup();
    public var background : FlxExtendedSprite;
    
    public var _isOpen : Bool = false;
    
    public var position : Array<Dynamic> = [FlxG.width - 230, FlxG.height - 565];
    
    public var itemPositionOffset : Array<Dynamic> = [636, 87];  //[285,437];  
    public var itemMargin : Int = 9;
    public var currentItem : Int = 0;
    public var maxItemsPerRow : Int = 1;
    
    private static var itemIndex : Int = 0;
    
    public function new(scene : Scene)
    {
        super();
        Inventory.invGrid = this;
        
        button = new FlxExtendedSprite(FlxG.width - 100, FlxG.height - 100);
        button.loadGraphic(Assets.graphic(BUTTON));
        button.mouseReleasedCallback = this.onButtonClick;
        scene.ui.add(button);
        
        button.ID = 0x7FFFFFFE;
        
        this.scene = scene;
        
        trace("Inventory registered on scene: ", scene);
        
        background = new FlxExtendedSprite(position[0], position[1]);
        background.loadGraphic(Assets.graphic(BACKGROUND));
        
        add(background);
        add(__DOLLAR__items);
        
        this._generateGrid();
    }
    
    private function _generateGrid() : Void
    {
        for (itemType in Inventory.items.keys())
        {
            if (Inventory.items[itemType] == null)
            {
                continue;
            }
            placeItemOnGrid(Inventory.items[itemType]);
        }
    }
    
    private function _redrawGrid() : Void
    {
        __DOLLAR__items.clear();
        currentItem = 0;
        this._generateGrid();
    }
    
    private function placeItemOnGrid(item : Item) : Void
    {
        var icon : FlxExtendedSprite = item.getIcon();
        icon.name = Type.getClassName(Type.getClass(item));
        icon.mouseReleasedCallback = this.onGridIconPick;
        
        var col : Int = (currentItem % maxItemsPerRow);
        var row : Int = Math.floor(currentItem / maxItemsPerRow);
        
        icon.x = itemPositionOffset[0] + (col * (80 + itemMargin));
        icon.y = itemPositionOffset[1] + (row * (80 + itemMargin));
        
        __DOLLAR__items.add(icon);
        icon.ID = 10000 + (++itemIndex);
        
        currentItem++;
    }
    
    private function onGridIconPick(icon : FlxExtendedSprite, x : Int, y : Int) : Void
    {
        var itemType : String = icon.name;
        var item : Item = Inventory.getItemOfType(itemType);
        
        if (Inventory.isHoldingItem())
        {
            item._onCombine(Inventory.getHeldItem());
            return;
        }
        
        trace("Picked item from grid: ", item);
        
        Inventory.holdItemOnCursor(item);
    }
    
    override public function kill() : Void
    {
        __DOLLAR__items.clear();
    }
    
    private function _show() : Void
    {
        trace("Opening inventory: ", this, this.scene);
        this.scene.invLayer.add(this);
        this._isOpen = true;
        this.button.loadGraphic(Assets.graphic(BUTTON_OPEN));
    }
    
    private function _hide() : Void
    {
        trace("Hiding inventory: ", this, this.scene);
        this.scene.invLayer.remove(this);
        this._isOpen = false;
        this.button.loadGraphic(Assets.graphic(BUTTON));
    }
    
    private function onButtonClick(btn : FlxExtendedSprite, x : Int, y : Int) : Void
    {
        if (this._isOpen)
        {
            this._hide();
        }
        else
        {
            this._show();
        }
    }
    
    // -------------------------------------------------------------------------------------------------------------
    
    private static var invGrid : Inventory;
    private static var items : Map<String, Item> = new Map();
    
    /**
		 * Adds an item to the player's inventory.
		 * @param item Item The item to be added.
		 */
    public static function addToInventory(item : Item) : Void
    {
        Inventory.items[Type.getClassName(Type.getClass(item))] = item;
        invGrid.placeItemOnGrid(item);
    }
    
    /**
		 * Removes an item from the player's inventory.
		 * @param item Item The item to be removed.
		 */
    public static function removeFromInventory(item : Item) : Void
    {
        Inventory.items[Type.getClassName(Type.getClass(item))] = null;
        invGrid._redrawGrid();
    }
    
    /**
		 * Checks if a player has an item in his inventory.
		 * @param item Item The item to check.
		 * @return Boolean
		 */
    public static function hasItem(item : Item) : Bool
    {
        var i : Item = Inventory.items[Type.getClassName(Type.getClass(item))];
        return (i != null);
    }
    
    /**
		 * Checks if a player has an item of a certain qualified class name.
		 * @param type String The item's qualified class name.
		 * @return Boolean
		 */
    public static function hasItemOfType(type : String) : Bool
    {
        return Inventory.items.exists(type);
    }
    
    /**
		 * Gets an item from the inventory by it's qualified class name.
		 * @param type String The item's qualified class name.
		 * @return
		 */
    public static function getItemOfType(type : String) : Item
    {
        return Inventory.items[type];
    }
    
    /**
		 * Shows the inventory grid.
		 */
    public static function show() : Void
    {
        if (Std.is(Inventory.invGrid, Inventory))
        {
            Inventory.invGrid._redrawGrid();
            Inventory.invGrid._show();
        }
    }
    
    /**
		 * Hides the inventory grid.
		 */
    public static function hide() : Void
    {
        if (Std.is(Inventory.invGrid, Inventory))
        {
            Inventory.invGrid._hide();
        }
    }
    
    /**
		 * Checks if the inventory grid is open.
		 * @return Boolean
		 */
    public static function isOpen() : Bool
    {
        return (Std.is(Inventory.invGrid, Inventory) && Inventory.invGrid._isOpen);
    }
    
    /**
		 * Forces an inventory grid redraw.
		 */
    public static function redrawGrid() : Void
    {
        if (Std.is(Inventory.invGrid, Inventory))
        {
            Inventory.invGrid._redrawGrid();
        }
    }
    
    /**
		 * Checks if the mouse is over the inventory grid
		 * @return Boolean
		 */
    public static function isMouseOver() : Bool
    {
        return (Inventory.isOpen() && Inventory.invGrid.background.mouseOver);
    }
    
    /**
		 * Check if the player is holding an item from the inventory.
		 * @return Boolean
		 */
    public static function isHoldingItem() : Bool
    {
        if (Std.is(FlxG.state, Scene))
        {
            return ((try cast(FlxG.state, Scene) catch(e:Dynamic) null).selectedItemIcon != null);
        }
        
        return false;
    }
    
    /**
		 * Returns the item currently being held by the player, or null if none.
		 * @return Boolean
		 */
    public static function getHeldItem() : Item
    {
        if (!Inventory.isHoldingItem())
        {
            return null;
        }
        if (!(Std.is(FlxG.state, Scene)))
        {
            return null;
        }
        return Inventory.getItemOfType((try cast(FlxG.state, Scene) catch(e:Dynamic) null).selectedItemIcon.name);
    }
    
    /**
		 * Returns the currently being held item's icon, or null if no item is being held.
		 * @return Boolean
		 */
    public static function getHeldItemIcon() : FlxExtendedSprite
    {
        if (!(Std.is(FlxG.state, Scene)))
        {
            return null;
        }
        return (try cast(FlxG.state, Scene) catch(e:Dynamic) null).selectedItemIcon;
    }
    
    /**
		 * Holds an item in the player's cursor.
		 * @param item Item The item to be held.
		 */
    public static function holdItemOnCursor(item : Item) : Void
    {
        (try cast(FlxG.state, Scene) catch(e:Dynamic) null).holdItemOnCursor(item);
    }
    
    /**
		 * Releases whichever item is being held on the player's cursor.
		 */
    public static function releaseItemOnCursor() : Void
    {
        (try cast(FlxG.state, Scene) catch(e:Dynamic) null).releaseItemOnCursor();
    }
}


