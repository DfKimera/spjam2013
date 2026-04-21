package scenes;

import characters.Hunter1;
import characters.Sherlock;
import engine.Dialog;
import engine.Inventory;
import engine.Item;
import engine.Portal;
import engine.Prop;
import engine.Scene;
import items.DryLeaves;
import items.Key1;
import items.Knife;
import items.RustyKnife;
import items.Scissors;
import props.DryLeavesCushion;
import Lang;

class ForestC1 extends Scene
{

    public static final BACKGROUND = "assets/scene_c1.jpg";

    public var sherlock : Sherlock = new Sherlock();
    public var hunter : Hunter1 = new Hunter1();

    public var cushion : DryLeavesCushion;

    public static var hunterIsReleased : Bool = false;
    public static var cushionIsPlaced : Bool = false;
    public var portalCreated : Bool = false;

    public static var visited : Bool = false;
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
        cushion = new DryLeavesCushion();
        hunter = new Hunter1();

        if (!visited)
        {
            Dialog.show(this, sherlock, Lang.get("scene.forestc1.save_youth"), "default", "bottom").sound("sherlock.sound.taunt");
        }

        Prop.placeOnScene(this, cushion, 370, 470);
        Prop.placeOnScene(this, hunter, 370, 0);

        if (!cleared)
        {
            if (!cushionIsPlaced)
            {
                cushion.visible = false;
            }

            if (!Inventory.hasItemOfType("items::DryLeaves"))
            {
                Item.placeOnScene(this, new DryLeaves(), 210, 470);
            }

            if (!Inventory.hasItemOfType("items::Knife") && !Inventory.hasItemOfType("item::RustyKnife"))
            {
                Item.placeOnScene(this, new RustyKnife(), 520, 440);
            }
        }
        else
        {
            hunterIsReleased = true;
            cushionIsPlaced = true;
            portalCreated = true;
            hunter.animation.play("sitting");
            Portal.placeOnScene(this, Lang.get("portal.village"), 250, 0, 330, 380, VillageScene);
        }

        Portal.placeOnScene(this, Lang.get("portal.forest"), 0, 540, 800, 60, ForestP1);

        visited = true;
    }

    override public function onPropInteract(prop : Prop) : Void
    {
        if (Std.is(prop, Hunter1))
        {
            if (!hunterIsReleased)
            {
                Dialog.show(this, hunter, Lang.get("scene.forestc1.get_me_out"), "hanging", "bottom").sound("hunter1.sound.cry");
            }
            else
            {
                Dialog.show(this, hunter, Lang.get("scene.forestc1.thank_you")).sound("hunter1.sound.thanks");
                Dialog.show(this, sherlock, Lang.get("scene.forestc1.who_hung"), "default", "bottom").sound("sherlock.sound.dialog");
                var dialog : Dialog = Dialog.show(this, hunter, Lang.get("scene.forestc1.ginger_hair")).sound("hunter1.sound.dialog");
                Sketch.show(this, "ginger", dialog);

                if (!portalCreated)
                {
                    portalCreated = true;

                    if (ForestC2.cleared)
                    {
                        Inventory.addToInventory(new Key1());
                        Dialog.show(this, hunter, Lang.get("scene.forestc1.take_key")).sound("hunter1.sound.dialog");
                    }

                    cleared = true;

                    Portal.placeOnScene(this, Lang.get("portal.village"), 250, 0, 330, 380, VillageScene);
                }
            }
        }
    }

    override public function onItemUse(prop : Prop, item : Item) : Void
    {
        if (Std.is(prop, Hunter1) && Std.is(item, RustyKnife))
        {
            Dialog.show(this, sherlock, Lang.get("scene.forestc1.blunt_knife"), "default", "bottom").sound("sherlock.sound.wonder");
            return;
        }

        if (Std.is(prop, Hunter1) && Std.is(item, Scissors))
        {
            Dialog.show(this, sherlock, Lang.get("scene.forestc1.rope_too_strong"), "default", "bottom").sound("sherlock.sound.dialog");
            return;
        }

        if (Std.is(prop, Hunter1) && Std.is(item, DryLeaves))
        {
            item.consume();
            cushion.visible = true;
            cushionIsPlaced = true;
            return;
        }

        if (Std.is(prop, Hunter1) && Std.is(item, Knife))
        {
            if (!cushionIsPlaced)
            {
                Dialog.show(this, sherlock, Lang.get("scene.forestc1.cushion_first")).sound("sherlock.sound.taunt");
                return;
            }

            Dialog.show(this, hunter, Lang.get("scene.forestc1.waaaah")).sound("hunter1.sound.cry");
            hunter.animation.play("sitting");
            hunterIsReleased = true;
        }
    }

    override public function onItemPick(item : Item) : Void
    {
        if (Std.is(item, RustyKnife))
        {
            Dialog.show(this, sherlock, Lang.get("scene.forestc1.rusty_knife")).sound("sherlock.sound.wonder");
        }
    }

    public function new()
    {
        super();
    }
}
