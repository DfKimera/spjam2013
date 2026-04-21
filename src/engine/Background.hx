package engine;

import engine.Assets;
import engine.Scene;
import photonstorm.FlxExtendedSprite;

class Background extends FlxExtendedSprite
{

    public var scene : Scene;

    public function new(bitmap : String, scene : Scene)
    {
        super();
        loadGraphic(Assets.graphic(bitmap), false, 800, 600);
        this.mouseReleasedCallback = this.onClicked;
        this.scene = scene;
    }

    private function onClicked(spr : FlxExtendedSprite, x : Int, y : Int) : Void
    {
        this.scene._onBackgroundClick(x, y);
        this.scene.onBackgroundClick(x, y);
    }
}
