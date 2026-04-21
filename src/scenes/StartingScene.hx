package scenes;

import characters.Sherlock;
import engine.Dialog;
import engine.Inventory;
import engine.Item;
import engine.Prop;
import engine.Scene;
import items.ScissorsPiece1;
import engine.Portal;
import Lang;

class StartingScene extends Scene
{

    public static final BACKGROUND = "assets/scene_start.jpg";

    public var sherlock : Sherlock;

    public static var visited : Bool = false;

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
            Dialog.show(this, sherlock, Lang.get("scene.starting.exclamation")).sound("sherlock.sound.surprise");
            Dialog.show(this, sherlock, Lang.get("scene.starting.which_way")).sound("sherlock.sound.wonder");
        }

        Portal.placeOnScene(this, Lang.get("portal.forest"), 0, 80, 120, 400, ForestP1);
        Portal.placeOnScene(this, Lang.get("portal.forest"), 680, 80, 120, 400, ForestP2);

        Prop.placeOnScene(this, sherlock, 540, 225);
        Portal.placeOnScene(this, Lang.get("portal.footprints"), 250, 400, 270, 200);

        if (!Inventory.hasItemOfType("items::Scissors"))
        {
            Item.placeOnScene(this, new ScissorsPiece1(), 100, 535);
        }

        visited = true;
    }

    override public function onPropInteract(prop : Prop) : Void
    {
        if (Portal.checkIfIs(prop, "Pegadas"))
        {
            Dialog.show(this, sherlock, Lang.get("scene.starting.tracks")).sound("sherlock.sound.dialog");
            return;
        }

        if (Std.is(prop, Sherlock))
        {
            Dialog.show(this, sherlock, Lang.get("scene.starting.help_search")).sound("sherlock.sound.taunt");
        }
    }

    override public function onItemUse(prop : Prop, item : Item) : Void
    {
        Dialog.show(this, sherlock, Lang.get("scene.starting.what_doing")).sound("sherlock.sound.taunt");
    }

    override public function onItemPick(item : Item) : Void
    {
        if (Std.is(item, ScissorsPiece1))
        {
            Dialog.show(this, sherlock, Lang.get("scene.starting.no_trash")).sound("sherlock.sound.taunt");
            Inventory.show();
        }
    }

    public function new()
    {
        super();
    }
}
