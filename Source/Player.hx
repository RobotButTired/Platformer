package;

import openfl.display.GraphicsEndFill;
import openfl.events.MouseEvent;
import openfl.display.Sprite;
import openfl.geom.Rectangle;
import openfl.Lib;
import openfl.events.KeyboardEvent;
import haxe.Timer;
import openfl.Assets;
import openfl.display.Bitmap;

enum State {idle; walk; jump;}
class Player extends Unit
{
    var idleWidthGun:Array<Bitmap>;
    var walkWithGun:Array<Bitmap>;
    var jumpWithGun:Array<Bitmap>;

    var jump:Bool = false;
  

    var state:State = idle;

    var timeFlag:Float;                 //временной флаг для анимации

    var frameTime:Float = 0.15;
    var ind:Int;

    var rateOfFire:Float = 0.75;        //скорострельность в секунду
    var rateOfThrow:Float = 0.25;       //бросков гранаты в секунду
    var shooting:Bool = false;          //тригер для стрельбы
   // var shootingTime:Float;             //временной флаг для стрельбы
   var gunCounter:Int = 0;
   var grenadeCounter:Int = 0;            //счетчик для гранаты

    public var inventory:Inventory;
    var healthPoints:Int;            //очки здоровья
    var maxHealthPoints:Int = 3;          //максимальное количество очков здоровья
    var invulnerability:Bool =false;               //неуязвимость
    var invulnerabilityTime:Float = 2.0;          //время неуязвимости
    var invulnerabilityCounter:Int =0;
    
    

    public function new() 
    {
        super();
        idleWidthGun = [];
        idleWidthGun.push(new Bitmap(openfl.Assets.getBitmapData("assets/Cowboy/Cowboy4_idle_with_gun_0.png")));
        idleWidthGun.push(new Bitmap(openfl.Assets.getBitmapData("assets/Cowboy/Cowboy4_idle with gun_1.png")));
        idleWidthGun.push(new Bitmap(openfl.Assets.getBitmapData("assets/Cowboy/Cowboy4_idle with gun_2.png")));
        idleWidthGun.push(new Bitmap(openfl.Assets.getBitmapData("assets/Cowboy/Cowboy4_idle with gun_3.png")));

        walkWithGun = [];
        walkWithGun.push(new Bitmap(openfl.Assets.getBitmapData("assets/Cowboy/Cowboy4_walk with gun_0.png")));
        walkWithGun.push(new Bitmap(openfl.Assets.getBitmapData("assets/Cowboy/Cowboy4_walk with gun_1.png")));
        walkWithGun.push(new Bitmap(openfl.Assets.getBitmapData("assets/Cowboy/Cowboy4_walk with gun_2.png")));
        walkWithGun.push(new Bitmap(openfl.Assets.getBitmapData("assets/Cowboy/Cowboy4_walk with gun_3.png")));

        jumpWithGun = [];
        jumpWithGun.push(new Bitmap(openfl.Assets.getBitmapData("assets/Cowboy/Cowboy4_jump with gun_0.png")));
        jumpWithGun.push(new Bitmap(openfl.Assets.getBitmapData("assets/Cowboy/Cowboy4_jump with gun_0.png")));
        jumpWithGun.push(new Bitmap(openfl.Assets.getBitmapData("assets/Cowboy/Cowboy4_jump with gun_0.png")));
        jumpWithGun.push(new Bitmap(openfl.Assets.getBitmapData("assets/Cowboy/Cowboy4_jump with gun_0.png")));

        speedX = 5.0;
        speedY = 0.0;
        hitBox = new Rectangle(-20/2,-35/2,20,30);
    
        //scaleX = -1.0;
        
        this.addChild(idleWidthGun[0]);
        idleWidthGun[0].x = -15;
        idleWidthGun[0].y = -40;
        trace(width+" "+height);
       // drawHitBox();
       //this.addChild(idleWidthGun[0]);  
        ind =0; 
        timeFlag = Timer.stamp();

        //shootingTime = Timer.stamp();

        inventory = new Inventory();
        inventory.panel.x =250;
        inventory.panel.y =5;

        healthPoints = maxHealthPoints;
    

        Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
        Lib.current.stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
        Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
        Lib.current.stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
    }
    public function spriteAnimated(state:State) 
    {
        var spriteSheet:Array<Bitmap>;
        switch (state)
        {
            case idle:
                spriteSheet = idleWidthGun;
            case walk: 
                spriteSheet = walkWithGun;
            case jump:
                spriteSheet = jumpWithGun;  
        }
        if(Timer.stamp()- timeFlag >= frameTime)
            {
               //ind =0;
               updateSprite(spriteSheet);
                timeFlag = Timer.stamp();
            }
    }

    public function updateSprite(spriteSheet:Array<Bitmap>) 
    {
        this.removeChildren();
                if(ind == spriteSheet.length)
                    ind =0;
                this.addChild(spriteSheet[ind]);
                spriteSheet[ind].x = -15;
                spriteSheet[ind].y = -40;
                
                ind++;       
    }

    public function keyDownHandler(e:KeyboardEvent) 
    {
            if(e.keyCode == 37 || e.keyCode == 65)
            {
                movingLeft = true;
            }  
            if(e.keyCode == 39 || e.keyCode == 68)
            {
                movingRight = true;
            }
            if(e.keyCode == 38 || e.keyCode == 87)
                jump = true;
            if(e.keyCode == 32)
                shooting = true;
    }
    public function mouseDownHandler(e:MouseEvent) 
    {
        shooting = true;
    }
    public function keyUpHandler(e:KeyboardEvent) 
    {
        if(e.keyCode == 37 || e.keyCode == 65)
        {
            movingLeft = false;
        }  
        if(e.keyCode == 39 || e.keyCode == 68)
        {
            movingRight = false;
        }
        if(e.keyCode == 38 || e.keyCode == 87)
            jump = false;
        if(e.keyCode == 32)
            shooting = false;
    }
    public function mouseUpHandler(e:MouseEvent) 
    {
        shooting = false;    
    }
    public function move() 
    {
        if(movingLeft )
            {
                if(x-hitBox.width/2 >= 0)
                    x -= speedX;
                state = walk;
                scaleX = -1.0;
                direction = left;
            }
        if(movingRight)
            {
                if(x+hitBox.width/2 <= Main.sizeWidth)
                    x += speedX;    
                state = walk;
                scaleX = 1.0;
                direction = right;
            }
        if(movingLeft && movingRight)
            state = idle;
        if(!movingLeft && !movingRight)
            state = idle;
        speedY += gravity;
        y += speedY;

    }

    public function doShot(game:Game) 
    {
        inventory.update(this);
        if(gunCounter == 0 && shooting && inventory.get_weapon() == gun)
            {
                doShotGun(game);
            }
        else if(gunCounter != 0)
        {
            --gunCounter;
        }
        if(grenadeCounter ==0 && shooting && inventory.get_weapon() == grenade)
        {
            doShotGrenade(game);
        }
        else if(grenadeCounter != 0)
        {
            --grenadeCounter;
        }
           //trace(gunCounter);
    }
    public function doShotGun(game:Game) 
    {
        var bullet:Bullet;
        if(game.spentBullets.length > 0)
            {
                //trace(999999);
                game.bullets.push(game.spentBullets.pop());
                game.bullets[game.bullets.length-1].setBullet(this);
               // game.bullets.push(bullet);
                game.addChild(game.bullets[game.bullets.length-1]);
               // shootingTime = Timer.stamp();
               gunCounter = Math.floor(Main.get_FPS() / rateOfFire);
            }
            else
            {
                bullet = new Bullet(this);
                game.bullets.push(bullet);
                game.addChild(bullet);
                //trace("Shot");          
                gunCounter = Math.floor(Main.get_FPS() / rateOfFire);
            }
    }
    public function doShotGrenade(game:Game) 
    {
        if(game.grenade != null) //  && game.grenade.get_state() == inactive)
        {
            game.grenade.setGrenade(this);
            game.addChild(game.grenade);
            game.grenade.set_state(active);
            grenadeCounter = Math.floor(Main.get_FPS() / rateOfThrow);
            trace("SETTING GRENADE");
        }
        else
        {
            var grenade = new Grenade(this);
            game.grenade = grenade;
            game.addChild(grenade);
            grenadeCounter = Math.floor(Main.get_FPS() / rateOfThrow);
        }
    }

    public function checkCollisionWithEnemy(enemy:Enemy):Bool
    {
        if(x + hitBox.width/2 > enemy.x-enemy.hitBox.width/2 && x - hitBox.width/2 < enemy.x + enemy.hitBox.width/2 &&
            y + hitBox.height/2 > enemy.y - enemy.hitBox.height/2 && y - hitBox.height/2 < enemy.y + enemy.hitBox.height/2)
            {
                return true;
            }
            else 
                return false;
    }

    public function get_state()
    {
        return state;    
    }
  

    public function drawHitBox() 
    {
        graphics.lineStyle(1,0xFF0000);
        graphics.drawRect(-hitBox.width/2,-hitBox.height/2,hitBox.width,hitBox.height);
        graphics.endFill();
    }

    public function doCollisionsWithTilesForPLayer(level:Array<Array<Int>>) 
    {
        Game.haveCollision = false;
       if(direction == left)
        {
            scaleX = 1.0;
            this.doCollisionsWithTiles(level);
            scaleX = -1.0;
        }
        else
            this.doCollisionsWithTiles(level);
    }

    public override function doCollisionsWithTiles(level:Array<Array<Int>>) 
        {
            var tileWidth = Main.sizeWidth/20;
            var tileHeight = Main.sizeHeight/15;
           // var direction:CollisionDirection;
            for(i in 0...level.length)
            {
                for(j in 0...level[i].length)
                {
                    if(checkCollisionWithTile(level[i][j], j * tileWidth, i * tileHeight))
                    {
                        Game.haveCollision = true;
                        collisionDirection = directionDefinition(j * tileWidth, i * tileHeight);
                        doCollisionWithTile(collisionDirection, j * tileWidth, i * tileHeight);
                    }
                }
            }
        }

    public function doInvulnerability() 
    {
        if(invulnerabilityCounter % (Main.get_FPS()/6) == 0)
        {
            alpha = (alpha == 1.0)? 0.0 : 1.0;
            /*if(alpha == 1.0)
                alpha = 0.0;
            else alpha =1.0;*/
        }
        ++invulnerabilityCounter;
        if(invulnerabilityCounter >= Main.get_FPS()*invulnerabilityTime)
        {
            invulnerability = false;
            invulnerabilityCounter =0;
        }
    }

    public function doCollisionWithPlatform(platform:Sprite) 
    {
        if(speedY >= 0.0 && x + hitBox.width/2 > platform.x && x - hitBox.width/2 < platform.x + platform.width &&
            y + hitBox.height/2 > platform.y && y - hitBox.height/2 < platform.y)
        {
            Game.haveCollision = true;
            collisionDirection = up;
            y = platform.y - hitBox.height/2;
            speedY = 0.0;
        }
    }

  

    public function get_directionLeft() 
    {
        return movingLeft;    
    }
    public function get_directionRight() 
    {
        return movingRight;    
    }
    public function get_jump() 
    {
        return jump;    
    }
    public function set_state(value:State) 
    {
        state = value;    
    }
    public function get_gunCounter()
    {
        return gunCounter;    
    }
    public function get_rateOfFire() 
    {
        return rateOfFire;    
    }
    public function get_grenadeCounter() 
    {
        return grenadeCounter;    
    }
    public function get_rateOfThrow() 
    {
        return rateOfThrow;    
    }
    public function get_healthPoints() 
    {
        return healthPoints;    
    }
    public function set_healthPoints(value:Int) 
    {
         healthPoints = value;    
    }
    public function get_maxHealthPoints() 
    {
        return maxHealthPoints;    
    }
    public function get_invulnerability()
    {
        return invulnerability;    
    }
    public function set_invulnerability(value:Bool)
    {
        invulnerability = value;    
    }

   /* public function set_shootingTime(value:Float):Float
    {
        shootingTime = value;
        return shootingTime;
    }
    public function get_shootingTime() 
    {
        return shootingTime;    
    }*/
    
}
