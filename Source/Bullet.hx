package;

import openfl.display.Sprite;

class Bullet extends Sprite
{
    public  var speed:Float;
    public function new(player:Player)
    {
        super();

        graphics.beginFill(0x0000FF);
        graphics.drawRect(-7/2,-2/4,7,4);
        graphics.endFill();
        setBullet(player);
       
    }
    public function move() 
    {
        x += speed;   
    }
    public function setBullet(player:Player) 
    {
        if(player.get_direction() == right)
            {
                x= player.x + 10.0;
                y = player.y;
                speed = 20.0;
                if(Bonus.bonusIsUsed)
                    speed = 5.0;
            } 
        else
            {
                x = player.x - 10.0;
                y = player.y;
                speed = -20.0;
                if(Bonus.bonusIsUsed)
                    speed = -5.0;
            }
    }

    public function checkCollisionWithEnemy(enemy:Enemy):Bool
    {
        if(x + width/2 > enemy.x-enemy.width/2 && x - width/2 < enemy.x + enemy.width/2 &&
            y + height/2 > enemy.y - enemy.height/2 && y - height/2 < enemy.y + enemy.height/2)
            {
                return true;
            }
            else 
                return false;
    }
    public function get_speed() 
    {
        return speed;    
    }
    public function set_speed(value:Float)
    {
        speed = value;    
    }
}