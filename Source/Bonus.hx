package;

import openfl.display.Sprite;
import openfl.geom.Rectangle;

enum BonusType{slow;destroy;}
class Bonus extends Unit
{

    static var counter:Int = 0;            //счетчик времени действия бонуса
    public static var bonusIsUsed:Bool = false;
    public static var haveBonus:Bool = false;
    static var bonusType(get, null):BonusType;

    
    public function new() 
    {
        super();
        if(Math.random() < 0.5)
            bonusType = destroy;
        else
            bonusType = slow;
        counter = 0;
        hitBox = new Rectangle(-25/2,-25/2,25,25);
        drawHitBox();
    }

    public function drawHitBox() 
    {
        if(bonusType == slow)
            graphics.lineStyle(3,0x00FFFF); 
        else 
            graphics.lineStyle(3,0x000000); 

        graphics.drawRect(-hitBox.width/2,-hitBox.height/2,hitBox.width,hitBox.height);   
        graphics.endFill();
    }
    public function fall(level:Array<Array<Int>>) 
    {
        var tileWidth = Main.sizeWidth/20;
        var tileHeight = Main.sizeHeight/15;
        y += speedY;
        speedY += gravity;
        for(i in 0...level.length)
        {
            for(j in 0...level[i].length)
            {
                if(checkCollisionWithTile(level[i][j], j*tileWidth, i*tileHeight))
                {
                    if(Math.abs(speedY) <= 2.0)
                        {
                            y = i*tileHeight- hitBox.height/2;
                            speedY = 0.0;
                        }
                        else 
                            speedY = -Math.abs(speedY*0.6);
                }
            }
        }
        /*if(y + hitBox.height/2 > 440)
        {
           if(Math.abs(speedY) <= 2.0)
            {
                y = 440 - hitBox.height/2;
                speedY = 0.0;
            }
            else 
                speedY = -Math.abs(speedY*0.6);
        }    */
    }
    public function checkCollisionWithPlayer(player:Player):Bool 
    {
        if(x + hitBox.width/2 > player.x - player.hitBox.width/2 && x - hitBox.width/2 < player.x + player.width/2 &&
            y + hitBox.height/2 > player.y - player.height/2 && y - hitBox.height/2 < player.y + player.height/2)
        {
            bonusIsUsed = true;
            return true;
        }
        else
            return false;
    }

    public static function doBonusSlow(player:Player, enemies:Array<Enemy>,deadEnemies:Array<Enemy>, bullets:Array<Bullet>, grenade:Grenade) 
    {
        if(counter == 0)
        {
            player.speedX *=0.5;
            player.speedY *=0.5;
            player.gravity *=0.25;
            Game.jumpPower *= 0.50;
            var b =0;
            while(b < bullets.length)
            {
                bullets[b].set_speed(bullets[b].get_speed()*0.25);
                ++b;   
               // trace(bullets[b].speed);
            }
            var e =0;
            while(e < enemies.length)
            {
                enemies[e].speedX *= 0.25;
                enemies[e].speedY *= 0.25;
                enemies[e].gravity*=0.25;
                ++e;
            }
           e =0;
            while(e < deadEnemies.length)
            {
                deadEnemies[e].speedX *= 0.25;
                deadEnemies[e].speedY *= 0.25;
                deadEnemies[e].gravity*=0.25;
                ++e;
            }
            if(grenade != null)
            {
                grenade.set_speedX(grenade.get_speedX()*0.25);
                grenade.set_speedY(grenade.get_speedY()*0.25);
                grenade.set_gravity(grenade.get_gravity()/16.0);
            }
        }
        else 
        {
             if(counter >= Main.get_FPS()* 10.0)
            {
                player.speedX *=2.0;
                player.speedY *=2.0;
                player.gravity /=0.25;
                Game.jumpPower /= 0.50;
                var b =0;
                while(b < bullets.length)
                {
                    bullets[b].set_speed(bullets[b].get_speed()/0.25);
                    ++b;
                }
                var e =0;
                while(e < enemies.length)
                {
                    enemies[e].speedX /= 0.25;
                    enemies[e].speedY /= 0.25;
                    enemies[e].gravity/=0.25;
                    ++e;
                }
                e =0;
                while(e < deadEnemies.length)
                {
                    deadEnemies[e].speedX /= 0.25;
                    deadEnemies[e].speedY /= 0.25;
                    deadEnemies[e].gravity/=0.5;
                    ++e;
                }
                if(grenade != null)
                {
                    grenade.set_speedX(grenade.get_speedX()/0.25);
                    grenade.set_speedY(grenade.get_speedY()/0.25);
                    grenade.set_gravity(grenade.get_gravity()*16.0);
                }
               bonusIsUsed = false;
               haveBonus = false;
               counter =-1;
    
            }
        }
        counter++;
      // trace(counter);
    }
    public static function get_bonusType() 
    {
        return bonusType;    
    }
    public static function get_counter() 
    {
        return counter;    
    }


   /* public static function resetBonus(player:Player, enemies:Array<Enemy>, bullets:Array<Bullet>) 
    {
       
            counter++;
        if(counter > Main.get_FPS()* 3.0)
        {
            bonusIsUsed = false;
            counter =0;
        }
    }*/
}