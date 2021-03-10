package;

import openfl.geom.Rectangle;


class Enemy extends Unit
{
    public var color = 0x00FF00;
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
        graphics.lineStyle(3,color); 
        graphics.drawRect(-hitBox.width/2,-hitBox.height/2,hitBox.width,hitBox.height);   
        graphics.endFill();
    }

    public function move (player:Player, level:Array<Array<Int>>) 
    {
        if(player.x < x)
            x -= speedX;
        else if(player.x > x)
            x += speedX;
        speedY += gravity;
        y += speedY;
        doCollisionsWithTiles(level);
    }
    public function doShot(game:Game)
    {
        
    }

}