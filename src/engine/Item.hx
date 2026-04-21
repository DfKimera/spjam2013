package engine;

import engine.Assets;
import engine.Scene;
import flixel.FlxBasic;
import flixel.FlxG;
import photonstorm.FlxExtendedSprite;

class Item extends FlxBasic
{

    private var graphicIcon : String;
    private var graphicPlaced : String;

    private var icon : FlxExtendedSprite;
    public var placed : FlxExtendedSprite;

    public function new(graphicIcon : String, graphicPlaced : String)
    {
        super();
        this.graphicIcon = graphicIcon;
        this.graphicPlaced = graphicPlaced;

        icon = generateIcon();

        placed = new FlxExtendedSprite(0, 0);
        placed.loadGraphic(Assets.graphic(graphicPlaced));
        placed.mouseReleasedCallback = this._onPick;
        placed.onUpdate = function() : Void
                {
                    if (placed.mouseOver)
                    {
                        Cursor.useHand();
                    }
                };
    }

    public function generateIcon() : FlxExtendedSprite
    {
        var icon : FlxExtendedSprite = new FlxExtendedSprite(0, 0);
        icon.loadGraphic(Assets.graphic(graphicIcon), false, 80, 80);
        icon.name = Type.getClassName(Type.getClass(this));
        return icon;
    }

    public function getIcon() : FlxExtendedSprite
    {
        if (icon == null)
        {
            icon = generateIcon();
        }
        return icon;
    }

    public function onPick() : Void{}
    public function onCombine(item : Item) : Void{}
    public function onConsume() : Void{}

    public function consume() : Void
    {
        trace("Item consumed: ", this);

        Inventory.releaseItemOnCursor();

        this.onConsume();
        Inventory.removeFromInventory(this);

        icon.kill();
        icon.destroy();

        placed.kill();
        placed.destroy();

        this.kill();
        this.destroy();
    }

    public function _onPick(spr : FlxExtendedSprite, x : Int, y : Int) : Void
    {
        SFX.play("sfx.pick");

        if (Inventory.isHoldingItem())
        {
            return;
        }

        trace("Item added to inventory: ", this);

        Inventory.addToInventory(this);

        this.onPick();

        if (Std.is(FlxG.state, Scene))
        {
            trace("Item removed from scene: ", FlxG.state);
            (try cast(FlxG.state, Scene) catch(e:Dynamic) null).items.remove(placed);
            (try cast(FlxG.state, Scene) catch(e:Dynamic) null).onItemPick(this);
        }
    }

    public function _onCombine(item : Item) : Void
    {
        trace("Combining items: ", this, item);
        Inventory.releaseItemOnCursor();
        SFX.play("sfx.bell");
        this.onCombine(item);
        (try cast(FlxG.state, Scene) catch(e:Dynamic) null).onItemCombine(this, item);
        Inventory.redrawGrid();
    }

    public function _onUse() : Void
    {
        Inventory.hide();
    }

    // -------------------------------------------------------------------------------------------------------------

    public static function placeOnScene(scene : Scene, item : Item, x : Int, y : Int) : Item
    {
        if (Inventory.hasItem(item))
        {
            trace("Skipping scene placement of item: ", item, "(player already picked)");
            return item;
        }

        item.placed.x = x;
        item.placed.y = y;
        scene.items.add(item.placed);

        trace("Item placed: ", scene, item, x, y, item.ID);

        return item;
    }
}
