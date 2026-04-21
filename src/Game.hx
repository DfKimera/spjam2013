import Menu;
import Settings;
import engine.Cursor;
import engine.Dialog;
import engine.Scene;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxState;
import photonstorm.FlxMouseControl;
import scenes.CreditsScene;
import scenes.Epilogue;
import scenes.Prologue;
import scenes.StartingScene;

class Game extends FlxGame
{

    public static var instance : Game;

    public static final BGM_GAME = "assets/game_background.mp3";

    public static final BGM_STORY = "assets/story_theme.mp3";

    public static final BGM_MENU = "assets/menu_theme.mp3";

    public static final BGM_CREDITS = "assets/credits_theme.mp3";

    public static var currentBGM : String = null;

    public function new()
    {
        Game.instance = this;
        super(800, 600, Menu, 60, 30, false);

        FlxG.plugins.add(new FlxMouseControl());
        Cursor.useArrow();
    }

    override private function update() : Void
    {
        Cursor.reset();
        super.update();
        Cursor.update();
    }

    /**
     * Switches to the main menu
     */
    public static function goToMainMenu() : Void
    {
        Game.transitionToScene(new Menu());
    }

    /**
     * Switches to the game's starting scene
     */
    public static function start() : Void
    {
        Game.transitionToScene(new StartingScene());
    }

    /**
     * Switches to the settings menu
     */
    public static function openSettings() : Void
    {
        Game.transitionToScene(new Settings());
    }

    /**
     * Switches to the credits scene
     */
    public static function openCredits() : Void
    {
        Game.transitionToScene(new CreditsScene());
    }

    /**
     * Shows the game prologue
     */
    public static function showPrologue() : Void
    {
        Game.transitionToScene(new Prologue());
    }

    /**
     * Shows the game epilogue
     */
    public static function showEpilogue() : Void
    {
        Game.transitionToScene(new Epilogue());
    }

    /**
     * Plays a background music
     */
    public static function playMusic(name : String) : Void
    {
        if (currentBGM == name)
        {
            return;
        }
        currentBGM = name;
        var path : String = Reflect.field(Game, "BGM_" + name.toUpperCase());
        FlxG.sound.playMusic(path, 0.5);
    }

    /**
     * Transitions the game to another scene.
     */
    public static function transitionToScene(scene : FlxState, delay : Float = Config.SCENE_FADE_DELAY) : Void
    {
        trace("------------------ END SCENE ---------------------");
        Dialog.clearAll();
        FlxG.camera.fade(0xff000000, delay, false, function() : Void
                {
                    FlxG.switchState(scene);
                });
    }
}
