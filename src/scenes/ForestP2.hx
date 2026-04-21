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
        
        Portal.placeOnScene(this, "Clareira", 630, 120, 170, 270, ForestC2);
        
        if (ForestTree.cleared)
        {
            Portal.placeOnScene(this, "Floresta", 0, 0, 150, 600, EndingScene);
        }
        else
        {
            Portal.placeOnScene(this, "Floresta", 0, 0, 150, 600, StartingScene);
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
                Dialog.show(this, sherlock, "Droga! Não consigo alcançar!", "default", "bottom").sound("dialog");
            }
            else
            {
                Dialog.show(this, sherlock, "O que você está fazendo, Epson? Pretende arrancar o cipó com as mãos!?", "default", "bottom").sound("taunt");
            }
            return;
        }
        
        if (Std.is(prop, Boulder))
        {
            Dialog.show(this, sherlock, "A pedra é irregular e escorregadia demais! Talvez se eu tivesse algum apoio...").sound("wonder");
            return;
        }
        
        if (Std.is(prop, BoulderWithPlank))
        {
            Dialog.show(this, sherlock, "Não é um apoio muito firme, mas ajuda...").sound("dialog");
        }
    }
    
    override public function onItemUse(prop : Prop, item : Item) : Void
    {
        if (Std.is(prop, LianaPlaced) && Std.is(item, Knife))
        {
            if (!plankPlaced)
            {
                Dialog.show(this, sherlock, "Droga! Não consigo alcançar!", "default", "bottom").sound("dialog");
                return;
            }
            
            prop.remove();
            Inventory.addToInventory(new Liana());
            Dialog.show(this, sherlock, "Cipós são bem fortes e dão excelentes cordas!").sound("surprise");
            
            return;
        }
        
        if (Std.is(prop, LianaPlaced) && Std.is(item, RustyKnife))
        {
            Dialog.show(this, sherlock, "Gah! A faca está cega! Se tivessemos algum lugar para afiá-la...").sound("dialog");
            return;
        }
        
        if (Std.is(prop, LianaPlaced) && Std.is(item, Scissors))
        {
            Dialog.show(this, sherlock, "Gah! Cipó é forte demais para cortar com tesoura!").sound("dialog");
            return;
        }
        
        if (Std.is(prop, Boulder) && Std.is(item, Plank))
        {
            prop.remove();
            item.consume();
            
            Prop.placeOnScene(this, new BoulderWithPlank(), 430, 280);
            
            plankPlaced = true;
            
            Dialog.show(this, sherlock, "Boa sacada, Epson! Agora suba lá e pegue esse cipó!").sound("surprise");
            return;
        }
        
        Dialog.show(this, sherlock, "O que você está fazendo, Epson?").sound("taunt");
    }

    public function new()
    {
        super();
    }
}

