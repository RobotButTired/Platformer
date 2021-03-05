package;

import openfl.display.Sprite;

enum Direction {left; right;}

class Unit extends Sprite
{
    var speedX:Float;
    var speedY:Float = 0.0;
    var gravity:Float = 0.8;
    var direction:Direction = right;
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
}