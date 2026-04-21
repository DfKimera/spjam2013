import engine.*;
import flixel.FlxG;
import flixel.FlxSprite;

class Sketch extends FlxSprite
{
    
    public static final SKETCH_SHORT = "assets/sketch_short.png";
    
    public static final SKETCH_GINGER = "assets/sketch_ginger.png";
    
    public static final SKETCH_FEET = "assets/sketch_feet.png";
    
    public var scene : Scene;
    
    public function new(scene : Scene, type : String)
    {
        super();
        this.x = 0;
        this.y = FlxG.height - 342;
        this.scene = scene;
        scene.ui.add(this);
        this._loadType(type);
    }

    private function _loadType(type : String) : Void
    {
        var sketch : Sketch = this;
        
        switch (type)
        {
            case "short":
                loadGraphic(Assets.graphic(SKETCH_SHORT));
            case "ginger":
                loadGraphic(Assets.graphic(SKETCH_GINGER));
            case "feet":
                loadGraphic(Assets.graphic(SKETCH_FEET));
        }
        
        Utils.fadeIn(this, Config.PROP_FADE_DELAY, function() : Void
                {
                    haxe.Timer.delay(function() : Void
                            {
                                Utils.fadeOut(sketch, Config.PROP_FADE_DELAY, function() : Void
                                        {
                                            if (scene.ui != null)
                                            {
                                                scene.ui.remove(sketch);
                                                sketch.kill();
                                                sketch.destroy();
                                            }
                                        });
                            }, 4000);
                });
    }
    
    public static function show(scene : Scene, type : String, afterDialog : Dialog = null) : Void
    {
        if (afterDialog == null)
        {
            new Sketch(scene, type);
            return;
        }
        
        afterDialog.onCloseCallback = function() : Void
                {
                    new Sketch(scene, type);
                };
    }
}

