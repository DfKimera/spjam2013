import engine.Assets;
import engine.SFX;
import photonstorm.FlxExtendedSprite;
import haxe.Constraints.Function;

class MenuOption extends FlxExtendedSprite
{
    
    private static final SPRITE = "assets/menu_buttons.png";
    
    private var onTriggerHandler : Function;
    private var isOver : Bool = false;
    private var playedSFX : Bool = false;
    
    public function new(item : String, onTriggerHandler : Function)
    {
        super(0, 0);

        this.loadGraphic(Assets.graphic(SPRITE), true, 280, 60);
        
        this.onTriggerHandler = onTriggerHandler;
        this.mouseReleasedCallback = this.onClick;
        this.name = item;
        
        switch (item)
        {
            case "Jogar":
                this.animation.add("off", [0]);
                this.animation.add("on", [1]);

            case "Créditos":
                this.animation.add("off", [2]);
                this.animation.add("on", [3]);
        }

        this.animation.play("off");
    }
    
    private function onClick(spr : FlxExtendedSprite, x : Int, y : Int) : Void
    {
        this.trigger();
    }
    
    public function setOn() : Void
    {
        this.isOver = true;
    }
    
    public function setOff() : Void
    {
        this.isOver = false;
    }
    
    public function trigger() : Void
    {
        trace("Menu option trigger: ", this);
        SFX.play("bell");
        if (this.onTriggerHandler != null)
        {
            Reflect.callMethod(null, this.onTriggerHandler, []);
        }
    }
    
    override public function update(elapsed:Float) : Void
    {
        super.update(elapsed);
        
        if (isOver || this.mouseOver)
        {
            this.animation.play("on");
        }
        else
        {
            this.animation.play("off");
        }
    }
}

