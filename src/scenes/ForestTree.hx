package scenes;

import characters.Hunter3;
import characters.Sherlock;
import engine.Dialog;
import engine.Inventory;
import engine.Item;
import engine.Portal;
import engine.Prop;
import engine.Scene;
import items.Hook;
import items.Key2;
import items.RopeHook;
import props.Glint;
import props.Rack;
import props.RackUsed;

class ForestTree extends Scene
{
    
    public static final BACKGROUND = "assets/scene_tree.jpg";
    
    public var sherlock : Sherlock = new Sherlock();
    public var hunter : Hunter3 = new Hunter3();
    
    public static var visited : Bool = false;
    public static var rackUsed : Bool = false;
    public static var keyObtained : Bool = false;
    public static var cleared : Bool = false;
    
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
        
        if (!rackUsed)
        {
            Prop.placeOnScene(this, new Rack(), 630, 240);
        }
        else
        {
            Prop.placeOnScene(this, new RackUsed(), 630, 240);
        }
        
        if (!keyObtained)
        {
            Prop.placeOnScene(this, new Glint(), 350, 40);
        }
        
        Prop.placeOnScene(this, hunter, 50, 240);
        
        if (cleared)
        {
            hunter.animation.play("released");
        }

        Portal.placeOnScene(this, "Vilarejo", 0, 540, 800, 60, VillageScene);
        
        visited = true;
    }
    
    override public function onPropInteract(prop : Prop) : Void
    {
        if (Std.is(prop, Rack) && !rackUsed)
        {
            Inventory.addToInventory(new Hook());
            Prop.placeOnScene(this, new RackUsed(), 630, 240);
            prop.remove();
            rackUsed = true;
            Dialog.show(this, sherlock, "Epson, pare de pegar coisas que não são suas! Por acaso é um ladrão?").sound("taunt");
            return;
        }
        
        if (Std.is(prop, Glint))
        {
            Dialog.show(this, sherlock, "Olhos de lince, Epson! Mas, como vamos pegá-la?").sound("surprise");
            return;
        }
        
        if (Std.is(prop, Hunter3) && !cleared)
        {
            Dialog.show(this, hunter, "Me tirem daqui!!").sound("jailed");
            return;
        }
        
        if (Std.is(prop, Hunter3) && cleared)
        {
            var dialog : Dialog = Dialog.show(this, hunter, "Aquele maldito, com os pés virados pra trás! Ele que me trancou aqui!").sound("dialog");
            Sketch.show(this, "feet", dialog);
            Dialog.show(this, sherlock, "Pés virados!? Epson, estavamos andando ao contrário desde o começo!").sound("surprise");
        }
    }
    
    override public function onItemUse(prop : Prop, item : Item) : Void
    {
        if (Std.is(item, RopeHook) && Std.is(prop, Glint) && !keyObtained)
        {
            prop.remove();
            item.consume();
            Inventory.addToInventory(new Key2());
            keyObtained = true;
            Dialog.show(this, sherlock, "Excelente mira, Epson!").sound("surprise");
            return;
        }
        
        if (Std.is(item, Hook) && Std.is(prop, Glint))
        {
            Dialog.show(this, sherlock, "O gancho não alcança... precisamos dar um jeito de conseguir alcançar e puxar de volta...").sound("wonder");
            return;
        }
        
        if (Std.is(item, Key2) && Std.is(prop, Hunter3))
        {
            cleared = true;
            hunter.animation.play("released");
            item.consume();
            Dialog.show(this, hunter, "Ahh! Obrigado!").sound("dialog");
            return;
        }
        
        Dialog.show(this, sherlock, "Não vejo como isso poderia ajudá-lo, Epson...").sound("taunt");
    }

    public function new()
    {
        super();
    }
}

