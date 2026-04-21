package scenes;

import engine.Cursor;
import engine.UIScene;
import flixel.FlxG;

class CreditsScene extends UIScene
{

    public static final BACKGROUND_SPRITE = "assets/credits_screen.jpg";

    override public function prepare() : Void
    {
        setBackground(BACKGROUND_SPRITE);
        Game.playMusic("credits");
    }

    override public function update(elapsed:Float) : Void
    {
        super.update(elapsed);

        Cursor.useSkip();

        if (FlxG.keys.firstJustPressed() != flixel.input.keyboard.FlxKey.NONE || FlxG.mouse.justPressed)
        {
            Game.goToMainMenu();
        }
    }

    public function new()
    {
        super();
    }
}
