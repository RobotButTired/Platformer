package;

import openfl.display.Sprite;

class Bullet extends Sprite
{
    var speed:Float;
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
                x= player.x + 25.0;
                y = player.y;
                speed = 20.0;
            } 
        else
            {
                x = player.x - 25.0;
                y = player.y;
                speed = -20.0;
            }
    }
}