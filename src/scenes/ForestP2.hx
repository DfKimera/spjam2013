package scenes;

import characters.Sherlock;
import engine.Dialog;
import engine.Inventory;
import engine.Item;
import engine.Portal;
import engine.Prop;
import engine.Scene;
import items.Knife;
import items.Liana;
import items.Plank;
import items.RustyKnife;
import items.Scissors;
import props.Boulder;
import props.BoulderWithPlank;
import props.LianaPlaced;
import Lang;

class ForestP2 extends Scene
{
    
    public static final BACKGROUND = "assets/scene_p2.jpg";
    
    public var sherlock : Sherlock = new Sherlock();
    
    public static var visited : Bool = false;
    public static var plankPlaced : Bool = false;
    
    override public function prepare() : Void
    {
        setBackground(BACKGROUND);
        setFadeInDelay(1);
        Game.playMusic("game");
    }
    
    override public function create() : Void
    {
        super.create();
        
        sherlock = new Sherlock();
        
        Prop.placeOnScene(this, new LianaPlaced(), 490, 0);
        
        Portal.placeOnScene(this, Lang.get("portal.clearing"), 630, 120, 170, 270, ForestC2);
        
        if (ForestTree.cleared)
        {
            Portal.placeOnScene(this, Lang.get("portal.forest"), 0, 0, 150, 600, EndingScene);
        }
        else
        {
            Portal.placeOnScene(this, Lang.get("portal.forest"), 0, 0, 150, 600, StartingScene);
        }
        
        if (!plankPlaced)
        {
            Prop.placeOnScene(this, new Boulder(), 430, 280);
        }
        else
        {
            Prop.placeOnScene(this, new BoulderWithPlank(), 430, 280);
        }
        
        visited = true;
    }
    
    override public function onPropInteract(prop : Prop) : Void
    {
        if (Std.is(prop, LianaPlaced))
        {
            if (!plankPlaced)
            {
                Dialog.show(this, sherlock, Lang.get("scene.forestp2.cant_reach"), "default", "bottom").sound("dialog");
            }
            else
            {
                Dialog.show(this, sherlock, Lang.get("scene.forestp2.bare_hands"), "default", "bottom").sound("taunt");
            }
            return;
        }
        
        if (Std.is(prop, Boulder))
        {
            Dialog.show(this, sherlock, Lang.get("scene.forestp2.slippery_rock")).sound("wonder");
            return;
        }
        
        if (Std.is(prop, BoulderWithPlank))
        {
            Dialog.show(this, sherlock, Lang.get("scene.forestp2.unstable_support")).sound("dialog");
        }
    }
    
    override public function onItemUse(prop : Prop, item : Item) : Void
    {
        if (Std.is(prop, LianaPlaced) && Std.is(item, Knife))
        {
            if (!plankPlaced)
            {
                Dialog.show(this, sherlock, Lang.get("scene.forestp2.cant_reach"), "default", "bottom").sound("dialog");
                return;
            }

            prop.remove();
            Inventory.addToInventory(new Liana());
            Dialog.show(this, sherlock, Lang.get("scene.forestp2.vine_rope")).sound("surprise");
            
            return;
        }
        
        if (Std.is(prop, LianaPlaced) && Std.is(item, RustyKnife))
        {
            Dialog.show(this, sherlock, Lang.get("scene.forestp2.dull_knife")).sound("dialog");
            return;
        }
        
        if (Std.is(prop, LianaPlaced) && Std.is(item, Scissors))
        {
            Dialog.show(this, sherlock, Lang.get("scene.forestp2.vine_scissors")).sound("dialog");
            return;
        }
        
        if (Std.is(prop, Boulder) && Std.is(item, Plank))
        {
            prop.remove();
            item.consume();
            
            Prop.placeOnScene(this, new BoulderWithPlank(), 430, 280);
            
            plankPlaced = true;
            
            Dialog.show(this, sherlock, Lang.get("scene.forestp2.good_idea_vine")).sound("surprise");
            return;
        }
        
        Dialog.show(this, sherlock, Lang.get("scene.forestp2.what_doing")).sound("taunt");
    }

    public function new()
    {
        super();
    }
}

