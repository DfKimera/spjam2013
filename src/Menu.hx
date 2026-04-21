import MenuOption;
import engine.SFX;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.FlxState;
import haxe.Constraints.Function;

import engine.Assets;
import Lang;
class Menu extends FlxState
{

    private var buttonOffset : Array<Dynamic> = [260, 300];
    private var buttonHeight : Int = 60;
    private var baseY : Int = 0;

    public static final BACKGROUND_SPRITE = "assets/menu_background.jpg";

    public var background : FlxSprite;
    public var optionIndex : Array<Dynamic> = [];
    public var options : Map<String, MenuOption> = new Map();
    public var _options : FlxGroup = new FlxGroup();

    public var selectedOption : Int = -1;

    override public function create() : Void
    {
        Game.playMusic("menu");

        background = new FlxSprite(0, 0);
        background.loadGraphic(Assets.graphic(BACKGROUND_SPRITE));
        add(background);

        baseY = buttonOffset[1];
        createOptions();
        add(_options);
    }

    public function createOptions() : Void
    {
        addOption("play", function() : Void
                {
                    Game.showPrologue();
                });

        addOption("credits", function() : Void
                {
                    Game.openCredits();
                });
    }

    public function triggerOption(name : String) : Void
    {
        if (!options.exists(name))
        {
            return;
        }
        trace("Menu (trigger): ", name, options[name]);
        options[name].trigger();
    }

    public function addOption(name : String, callback : Function) : Void
    {
        var option : MenuOption = new MenuOption(name, callback);
        option.x = buttonOffset[0];
        option.y = baseY;

        options[name] = option;
        optionIndex.push(name);
        _options.add(option);

        baseY += buttonHeight;
    }

    public function unselectOptions() : Void
    {
        for (i in options.keys())
        {
            options[i].setOff();
        }
    }

    public function selectOption(name : String) : Void
    {
        if (options.exists(name)) options[name].setOn();
    }

    override public function update(elapsed:Float) : Void
    {
        unselectOptions();

        if (FlxG.keys.justPressed.DOWN)
        {
            selectedOption += 1;

            if (selectedOption >= optionIndex.length)
            {
                selectedOption = 0;
            }

            trace("Menu (down): ", selectedOption, optionIndex[selectedOption], options[optionIndex[selectedOption]]);
        }
        else
        {
            if (FlxG.keys.justPressed.UP)
            {
                selectedOption -= 1;

                if (selectedOption < 0)
                {
                    selectedOption = optionIndex.length - 1;
                }

                trace("Menu (up): ", selectedOption, optionIndex[selectedOption], options[optionIndex[selectedOption]]);
            }
            else
            {
                if (FlxG.keys.justPressed.ENTER)
                {
                    triggerOption(optionIndex[selectedOption]);
                }
            }
        }

        if (selectedOption != -1)
        {
            selectOption(optionIndex[selectedOption]);
        }

        super.update(elapsed);
    }

    public function new()
    {
        super();
    }
}
