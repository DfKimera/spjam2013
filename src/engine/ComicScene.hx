package engine;

import engine.Assets;
import engine.UIScene;
import flixel.FlxG;
import flixel.FlxSprite;

class ComicScene extends UIScene
{
    
    public var pages : Array<String> = [];
    public var comic : FlxSprite;
    public var transitioning : Bool = false;
    
    override public function create() : Void
    {
        super.create();
        
        comic = new FlxSprite(0, 0);
        comic.loadGraphic(Assets.graphic(pages.shift()));
        add(comic);
    }
    
    public function nextPage() : Void
    {
        transitioning = true;
        Utils.fadeOut(comic, Config.SCENE_FADE_DELAY, function() : Void
                {
                    if (pages.length <= 0)
                    {
                        onFinish();
                        return;
                    }
                    
                    comic.loadGraphic(Assets.graphic(pages.shift()));
                    Utils.fadeIn(comic, Config.SCENE_FADE_DELAY, function() : Void
                            {
                                transitioning = false;
                            });
                });
    }
    
    public function onFinish() : Void{
    }
    
    override public function update(elapsed:Float) : Void
    {
        super.update(elapsed);

        Cursor.useSkip();

        if (FlxG.keys.firstJustPressed() != flixel.input.keyboard.FlxKey.NONE || FlxG.mouse.justPressed)
        {
            if (!transitioning)
            {
                nextPage();
            }
        }
    }

    public function new()
    {
        super();
    }
}

