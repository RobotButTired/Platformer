package;

import openfl.geom.Point;
import openfl.geom.Rectangle;

class Bird extends Enemy
{
    var TV: Point;
    var rate = 120;
    var speedMax = 240;
    public function new() 
    {
        super();
        TV = new Point();
        color = 0xFFFF00;
        //speedX = 3.0;
       // speedY = 0.5;
        gravity = 0.0;
       // speedX = 0.5;
        hitBox = new Rectangle(-20/2,-20/2,20,20);
        drawHitBox();    
    }

    /*public function drawHitBox() 
        {
            graphics.lineStyle(3,color); 
            graphics.drawRect(-hitBox.width/2,-hitBox.height/2,hitBox.width,hitBox.height);   
            graphics.endFill();
        }*/
    public override function move(player:Player, level:Array<Array<Int>>) 
    {
        TV.x  = player.x - x;
        TV.y  = player.y - y;
        var distance = Math.abs(Point.distance(new Point(player.x, player.y), new Point(x,y)));
        var TV_norm = new Point();
        TV_norm.x = TV.x / distance;
        TV_norm.y = TV.y / distance;

        speedX = rate* TV_norm.x * Main.timePerFrame;
        speedY = rate* TV_norm.y * Main.timePerFrame;

        if(Bonus.bonusIsUsed)
        {
            speedX*= 0.25;
            speedY *= 0.25;
        }

        if(Math.sqrt(speedX*speedX + speedY*speedY) > speedMax)
        {
            speedX *= 0.75;
            speedY *= 0.75;
        }
        x+= speedX;
        y+= speedY;         
    }
}