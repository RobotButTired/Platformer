package;

import openfl.geom.Rectangle;


class Enemy extends Unit
{
    public function new() 
    {
        super();

        hitBox = new Rectangle(-30/2,-40/2,30,40);
        drawHitBox();
        speedX = 1.5;
        if(Bonus.bonusIsUsed)
            {
                speedY *= 0.25;
                speedX = 1.5*0.25;
                gravity *= 0.25;
            }
        
    }

    public function drawHitBox() 
    {
        graphics.lineStyle(3,0x00FF00); 
        graphics.drawRect(-hitBox.width/2,-hitBox.height/2,hitBox.width,hitBox.height);   
        graphics.endFill();
    }

    public function move (player:Player) 
    {
        if(y + hitBox.height >= 440)
            {
                y = 440-hitBox.height/2;
                speedY = 0.0;
            }
        if(player.x < x)
            x -= speedX;
        else if(player.x > x)
            x += speedX;
        speedY += gravity;
        y += speedY;

        
    }

}