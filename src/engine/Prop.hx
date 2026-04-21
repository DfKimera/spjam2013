package engine;

import engine.Scene;
import flixel.FlxG;
import photonstorm.FlxExtendedSprite;

class Prop extends FlxExtendedSprite
{
    
    public function new()
    {
        super();
        this.mouseReleasedCallback = this._onInteract;
    }
    
    private function _onInteract(spr : FlxExtendedSprite, x : Int, y : Int) : Void
    {
        trace("Prop interaction: ", this, spr, x, y);
        
        if (Std.is(FlxG.state, Scene))
        {
            var scene : Scene = (try cast(FlxG.state, Scene) catch(e:Dynamic) null);
            
            if (Inventory.isHoldingItem())
            {
                this._onItemUse(Inventory.getHeldItem());
                Inventory.releaseItemOnCursor();
                return;
            }
        }
        
        SFX.play("click");
        
        this.onInteract();
        
        if (Std.is(FlxG.state, Scene))
        {
            (try cast(FlxG.state, Scene) catch(e:Dynamic) null).onPropInteract(this);
        }
    }
    
    private function _onItemUse(item : Item) : Void
    {
        trace("Used item on prop", this, item);
        
        SFX.play("use");
        
        item._onUse();
        this.onItemUse(item);
        
        if (Std.is(FlxG.state, Scene))
        {
            (try cast(FlxG.state, Scene) catch(e:Dynamic) null).onItemUse(this, item);
        }
    }
    
    override public function update(elapsed:Float) : Void
    {
        super.update(elapsed);
        
        if (this.mouseOver)
        {
            this.updateCursor();
        }
    }
    
    public function updateCursor() : Void
    {
        if (Inventory.isHoldingItem())
        {
            Cursor.useHand();
        }
        else
        {
            Cursor.useEye();
        }
    }
    
    /**
		 * Removes the prop from the scene
		 */
    public function remove() : Void
    {
        var prop : Prop = this;
        
        Utils.fadeOut(this, Config.PROP_FADE_DELAY, function() : Void
                {
                    if (Std.is(FlxG.state, Scene))
                    {
                        (try cast(FlxG.state, Scene) catch(e:Dynamic) null).props.remove(prop);
                    }
                    prop.kill();
                    prop.destroy();
                });
    }
    
    /**
		 * @abstract
		 * Called when the player interacts with this prop.
		 */
    public function onInteract() : Void{
    }
    
    /**
		 * @abstract
		 * Called when an item is used on this prop.
		 * @param item Iten The used item.
		 */
    public function onItemUse(item : Item) : Void{
    }
    
    // -------------------------------------------------------------------------------------------------------------
    
    /**
		 * Places a prop on the scene
		 * @param scene Scene The scene to place on.
		 * @param prop Prop The prop instance to place.
		 * @param x int The prop position on the scene.
		 * @param y int
		 */
    public static function placeOnScene(scene : Scene, prop : Prop, x : Int, y : Int) : Prop
    {
        prop.x = x;
        prop.y = y;
        scene.props.add(prop);
        
        trace("Prop placed: ", prop, x, y, prop.ID);
        return prop;
    }
}

