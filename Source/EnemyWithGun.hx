package;

import openfl.geom.Rectangle;

class EnemyWithGun extends Enemy
{
    var rateOfFire:Float = 0.5;                 //скорострельность
    var shootingTime:Float = 1.0;               //время, за которое враг останавливается и делает выстрел
    var shooting:Bool = false;                  //состояние: стреляет ли враг?
    var shot:Bool = false;
    var counter:Int =0;
    public function new() 
    {
        super();
        color = 0xFF00FF;
        hitBox = new Rectangle(-30/2,-40/2,30,40);
        drawHitBox();
        speedX = 90;
        if(Bonus.bonusIsUsed)
        {
            speedY *= 0.25;
            speedX = 1.5*0.25;
            gravity *= 0.25;
        }
    }
    
    public override function move (player:Player, level:Array<Array<Int>>) 
        {
            if(!shooting)
            {
                if(player.x < x)
                {
                    x -= speedX * Main.timePerFrame;
                    direction = left;
                }
                else if(player.x > x)
                {
                    x += speedX * Main.timePerFrame;
                    direction = right;
                }
                ++counter;
                if(counter >= Main.get_FPS()/rateOfFire)
                {
                    shooting = true;
                    counter =0;
                }
            }
            else
            {
                if(counter == Math.floor(Main.get_FPS()*shootingTime/6*5))
                {
                    shot = true;
                }
                ++counter;
                if(counter >= Main.get_FPS()*shootingTime)
                {
                    shooting = false;
                    counter =0;
                }
            }
            speedY += gravity;
            y += speedY * Main.timePerFrame;
            doCollisionsWithTiles(level);
        }

        public override function doShot(game:Game) 
        {
            if(shot)
            {
                var bullet:Bullet;
                if(game.spentEnemyBullets.length > 0)
                {
                    game.enemyBullets.push(game.spentEnemyBullets.pop());
                    game.enemyBullets[game.enemyBullets.length-1].setBullet(this);
                    game.addChild(game.enemyBullets[game.enemyBullets.length-1]);
                }
                else
                {
                    bullet = new Bullet(this ,1) ;
                    game.enemyBullets.push(bullet);
                    game.addChild(bullet);
                }
                shot = false;
            }
           
        }
        
    /* public override function drawHitBox() 
    {
        graphics.lineStyle(3,0xFF00FF); 
        graphics.drawRect(-hitBox.width/2,-hitBox.height/2,hitBox.width,hitBox.height);   
        graphics.endFill();
    }*/
    
}