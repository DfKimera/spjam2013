package scenes;

import engine.ComicScene;

class Epilogue extends ComicScene
{
    
    public static final COMIC_PAGE_1 = "assets/outro_1.png";
    
    public static final COMIC_PAGE_2 = "assets/outro_2.png";
    
    public static final COMIC_PAGE_3 = "assets/outro_3.png";
    
    override public function prepare() : Void
    {
        pages = [COMIC_PAGE_1, COMIC_PAGE_2, COMIC_PAGE_3];
        Game.playMusic("story");
    }
    
    override public function onFinish() : Void
    {
        Game.openCredits();
    }

    public function new()
    {
        super();
    }
}

