package;

import openfl.geom.Rectangle;
import openfl.display.Sprite;

enum Direction {left; right;}

class Unit extends Sprite
{
    var speedX:Float;
    var speedY:Float = 0.0;
    var gravity:Float = 0.8;
    var direction:Direction = right;

    var movingLeft:Bool = false;
    var movingRight:Bool = false;

    var hitBox(get, null):Rectangle;
    public function new() 
    {
        super();

    }

    public function get_speedY():Float
    {
        return speedY;    
    }
    public function set_speedY(value:Float)
    {
        speedY = value;    
    }

    public function get_hitBox() 
    {
        return this.hitBox;
    }
}