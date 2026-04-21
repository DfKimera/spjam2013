package engine;

import engine.Prop;
import engine.Scene;
import photonstorm.FlxExtendedSprite;

class Portal extends Prop
{
    
    private var nextScene : Class<Dynamic>;
    
    public function new(name : String, width : Int, height : Int, nextScene : Class<Dynamic> = null)
    {
        super();
        this.name = name;
        this.width = width;
        this.height = height;
        this.nextScene = nextScene;
    }
    
    override public function draw() : Void
    {
        /* Prevent drawing */
    }
    
    override public function toString() : String
    {
        return "Portal(" + name + " @" + x + "," + y + " sz=" + width + "x" + height + ")";
    }
    
    override public function updateCursor() : Void
    {
        if (Std.is(nextScene, Class))
        {
            Cursor.useDoor();
        }
        else
        {
            Cursor.useEye();
        }
    }
    
    override private function _onInteract(spr : FlxExtendedSprite, x : Int, y : Int) : Void
    {
        super._onInteract(spr, x, y);
        
        SFX.play("sfx.click");
        
        if (Std.is(this.nextScene, Class))
        {
            Inventory.releaseItemOnCursor();
            Game.transitionToScene(Type.createInstance(this.nextScene, []));
        }
    }
    
    // -------------------------------------------------------------------------------------------------------------
    
    public static function checkIfIs(prop : Prop, name : String) : Bool
    {
        if (Std.is(prop, Portal))
        {
            if ((try cast(prop, Portal) catch(e:Dynamic) null).name == name)
            {
                return true;
            }
        }
        
        return false;
    }
    
    public static function placeOnScene(scene : Scene, name : String, x : Int, y : Int, width : Int, height : Int, nextScene : Class<Dynamic> = null) : Portal
    {
        var portal : Portal = new Portal(name, width, height, nextScene);
        Prop.placeOnScene(scene, portal, x, y);
        return portal;
    }
}

