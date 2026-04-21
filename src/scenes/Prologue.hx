package scenes;

import engine.ComicScene;

class Prologue extends ComicScene
{
    
    public static final COMIC_PAGE_1 = "assets/intro_1.jpg";
    
    public static final COMIC_PAGE_2 = "assets/intro_2.jpg";
    
    public static final COMIC_PAGE_3 = "assets/intro_3.jpg";
    
    override public function prepare() : Void
    {
        pages = [COMIC_PAGE_1, COMIC_PAGE_2, COMIC_PAGE_3];
        Game.playMusic("story");
    }
    
    override public function onFinish() : Void
    {
        Game.start();
    }

    public function new()
    {
        super();
    }
}

