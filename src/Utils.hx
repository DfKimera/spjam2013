import flixel.tweens.FlxTween;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import haxe.Constraints.Function;

class Utils
{

    public static function fadeIn(object:FlxSprite, delay:Float, callback:Function = null):FlxTween
    {
        return FlxTween.tween(object, {alpha: 1}, delay, {
            onComplete: function(_:FlxTween) {
                if (callback != null) Reflect.callMethod(null, callback, []);
            }
        });
    }

    public static function fadeInGroup(group:FlxGroup, delay:Float, callback:Function = null):FlxTween
    {
        var target:Dynamic = {alpha: 0};

        return FlxTween.tween(target, {alpha: 1}, delay, {
            onUpdate: function(_:FlxTween) {
                if (group.members != null) {
                    for (m in group.members) if (m != null) (cast m : flixel.FlxSprite).alpha = target.alpha;
                }
            },
            onComplete: function(_:FlxTween) {
                if (callback != null) Reflect.callMethod(null, callback, []);
            }
        });
    }

    public static function fadeOut(object:FlxSprite, delay:Float, callback:Function = null):FlxTween
    {
        return FlxTween.tween(object, {alpha: 0}, delay, {
            onComplete: function(_:FlxTween) {
                if (callback != null) Reflect.callMethod(null, callback, []);
            }
        });
    }

    public static function fadeOutGroup(group:FlxGroup, delay:Float, callback:Function = null):FlxTween
    {
        var target:Dynamic = {alpha: 1};

        return FlxTween.tween(target, {alpha: 0}, delay, {
            onUpdate: function(_:FlxTween) {
                if (group.members != null) {
                    for (m in group.members) if (m != null) (cast m : flixel.FlxSprite).alpha = target.alpha;
                }
            },
            onComplete: function(_:FlxTween) {
                if (callback != null && group.members != null) {
                    Reflect.callMethod(null, callback, []);
                }
            }
        });
    }

    public static function reverseArray(input:Array<Dynamic>):Array<Dynamic>
    {
        var out:Array<Dynamic> = [];
        var i = input.length - 1;
        while (i >= 0) {
            out.push(input[i]);
            i--;
        }
        return out;
    }

    public function new()
    {
    }
}
