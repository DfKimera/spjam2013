package scenes;

import characters.Sherlock;
import engine.Dialog;
import engine.Inventory;
import engine.Item;
import engine.Portal;
import engine.Prop;
import engine.SFX;
import engine.Scene;
import items.Knife;
import items.RustyKnife;
import items.Scissors;
import items.ScissorsPiece2;
import props.Bush;
import props.Rock;
import Lang;

class ForestP1 extends Scene
{

    public static final BACKGROUND = "assets/scene_p1.jpg";

    public var sherlock : Sherlock = new Sherlock();

    public static var visited : Bool = false;
    public static var clearedBush : Bool = false;

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
            Dialog.show(this, sherlock, Lang.get("scene.forestp1.footprints_lead"), "default", "bottom").sound("sherlock.sound.dialog");
        }

        Portal.placeOnScene(this, Lang.get("portal.clearing"), 65, 10, 200, 300, ForestC1);

        Prop.placeOnScene(this, new Rock(), 155, 325);

        if (!clearedBush)
        {
            Prop.placeOnScene(this, new Bush(), 60, 0);
        }

        if (!Inventory.hasItemOfType("items::Scissors"))
        {
            Item.placeOnScene(this, new ScissorsPiece2(), 530, 400);
        }

        if (ForestTree.cleared)
        {
            Portal.placeOnScene(this, Lang.get("portal.forest"), 700, 0, 100, 600, EndingScene);
        }
        else
        {
            Portal.placeOnScene(this, Lang.get("portal.forest"), 700, 0, 100, 600, StartingScene);
        }

        visited = true;
    }

    override public function onPropInteract(prop : Prop) : Void
    {
        if (Std.is(prop, Bush))
        {
            Dialog.show(this, sherlock, Lang.get("scene.forestp1.need_clear_path"), "default", "bottom").sound("sherlock.sound.wonder");
            return;
        }

        if (Std.is(prop, Rock))
        {
            Dialog.show(this, sherlock, Lang.get("scene.forestp1.sharp_rock"), "default", "bottom").sound("sherlock.sound.wonder");
        }
    }

    override public function onItemUse(prop : Prop, item : Item) : Void
    {
        if (Std.is(prop, Bush) && Std.is(item, Scissors))
        {
            Dialog.show(this, sherlock, Lang.get("scene.forestp1.elementary")).sound("sherlock.sound.surprise");
            clearedBush = true;
            prop.remove();
            return;
        }

        if (Std.is(prop, Rock) && Std.is(item, RustyKnife))
        {
            Dialog.show(this, sherlock, Lang.get("scene.forestp1.knife_sharpened"), "default", "bottom").sound("sherlock.sound.surprise");
            item.consume();
            Inventory.addToInventory(new Knife());
            return;
        }

        if (Std.is(prop, Rock) && Std.is(item, Knife))
        {
            Dialog.show(this, sherlock, Lang.get("scene.forestp1.knife_sharp"), "default", "bottom").sound("sherlock.sound.taunt");
            return;
        }

        Dialog.show(this, sherlock, Lang.get("scene.forestp1.what_doing")).sound("sherlock.sound.taunt");
    }

    override public function onItemPick(item : Item) : Void
    {
        if (Std.is(item, ScissorsPiece2))
        {
            Dialog.show(this, sherlock, Lang.get("scene.forestp1.half_scissors")).sound("sherlock.sound.wonder");
        }
    }

    public function new()
    {
        super();
    }
}
