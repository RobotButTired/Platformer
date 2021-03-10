package;

import openfl.display.Sprite;

class Bullet extends Sprite
{
    public  var speed:Float;
    public function new(unit:Unit, ?color:Int)
    {
        super();

        if(color != null)
            graphics.beginFill(0xFF00FF);
        else
            graphics.beginFill(0x0000FF);
        graphics.drawRect(-7/2,-2/4,7,4);
        graphics.endFill();
        setBullet(unit);
       
    }
    public function move() 
    {
        x += speed;   
    }
    public function setBullet(unit:Unit) 
    {
        if(unit.get_direction() == right)
            {
                x= unit.x + 10.0;
                y = unit.y;
                speed = 20.0;
                if(Bonus.bonusIsUsed)
                    speed = 5.0;
            } 
        else
            {
                x = unit.x - 10.0;
                y = unit.y;
                speed = -20.0;
                if(Bonus.bonusIsUsed)
                    speed = -5.0;
            }
    }

    public function checkCollisionWithUnit(unit:Unit):Bool
    {
        if(x + width/2 > unit.x-unit.get_hitBox().width/2 && x - width/2 < unit.x + unit.get_hitBox().width/2 &&
            y + height/2 > unit.y - unit.get_hitBox().height/2 && y - height/2 < unit.y + unit.get_hitBox().height/2)
            {
                return true;
            }
            else 
                return false;
    }
    /*public function checkCollisionWithPlayer(player:Player):Bool
    {
    if(x + width/2 > player.x-player.width/2 && x - width/2 < player.x + player.width/2 &&
        y + height/2 > player.y - player.height/2 && y - height/2 < player.y + player.height/2)
        {
            return true;
        }
        else 
            return false;
     }*/
    public function get_speed() 
    {
        return speed;    
    }
    public function set_speed(value:Float)
    {
        speed = value;    
    }
}