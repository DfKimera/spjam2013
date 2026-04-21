package scenes;

import characters.Sherlock;
import engine.Dialog;
import engine.Item;
import engine.Portal;
import engine.Prop;
import engine.Scene;
import items.Key1;
import props.Gate;

class VillageScene extends Scene
{
    
    public static final BACKGROUND = "assets/scene_village.jpg";
    
    public var sherlock : Sherlock = new Sherlock();
    public var treePortal : Portal;
    public var gate : Gate;
    
    public static var visited : Bool = false;
    public static var gateOpen : Bool = false;
    
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
        
        if (!visited)
        {
            Dialog.show(this, sherlock, "Veja, Epson! Uma aldeia! Parece abandonada...").sound("surprise");
            visited = true;
        }
        
        if (ForestC1.cleared)
        {
            Portal.placeOnScene(this, "Clareira", 0, 350, 150, 250, ForestC1);
        }
        else
        {
            Portal.placeOnScene(this, "Floresta", 0, 350, 150, 250, ForestP1);
        }
        
        Portal.placeOnScene(this, "Clareira", 650, 350, 150, 250, ForestC2);
        treePortal = Portal.placeOnScene(this, "Árvore", 260, 0, 140, 300, ForestTree);
        
        gate = try cast(Prop.placeOnScene(this, new Gate(), 270, 0), Gate) catch(e:Dynamic) null;
        
        if (gateOpen)
        {
            openGate();
        }
    }
    
    public function openGate() : Void
    {
        treePortal.ID = 0x7FFFFFFF - 100;
        gate.animation.play("open");
        gateOpen = true;
    }
    
    override public function onPropInteract(prop : Prop) : Void
    {
        if (Std.is(prop, Gate) && !gateOpen)
        {
            Dialog.show(this, sherlock, "Droga, o portão está fechado... Com quem será que está a chave?").sound("wonder");
        }
    }
    
    override public function onItemUse(prop : Prop, item : Item) : Void
    {
        if (Std.is(prop, Gate) && Std.is(item, Key1) && !gateOpen)
        {
            item.consume();
            openGate();
        }
    }

    public function new()
    {
        super();
    }
}

