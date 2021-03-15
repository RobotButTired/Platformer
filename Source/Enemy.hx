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
        speedX =90;
        speedY =0.0;
        if(Bonus.bonusIsUsed)
            {
                speedY *= 0.25;
                speedX *= 0.25;
                gravity *= 0.25;
            }
        
    }

    public function drawHitBox() 
    {
        graphics.clear();
        graphics.lineStyle(3,color); 
        graphics.drawRect(-hitBox.width/2,-hitBox.height/2,hitBox.width,hitBox.height);   
        graphics.endFill();
    }

    public function move (player:Player, level:Array<Array<Int>>) 
    {
        if(player.x < x)
            x -= speedX * Main.timePerFrame;
        else if(player.x > x)
            x += speedX * Main.timePerFrame;
        speedY += gravity;
        y += speedY * Main.timePerFrame;
        doCollisionsWithTiles(level);
    }
    public function doShot(game:Game)
    {
        
    }

}