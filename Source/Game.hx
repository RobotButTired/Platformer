package;

import lime.system.BackgroundWorker;
import openfl.text.TextField;
import openfl.events.KeyboardEvent;
import openfl.Lib;
import haxe.Timer;
import openfl.geom.Point;
import openfl.display.Tile;
import openfl.geom.Rectangle;
import openfl.display.Sprite;
import openfl.events.MouseEvent;

class Game extends Sprite
{
    var sizeWidth:Int;
    var sizeHeight:Int;
    var backGround:BackGround;
    var quitButton:Button;
    var quitButtonIsPressed:Bool =false;
    var pauseIsPressed:Bool = false;
    var gameLevel:GameLevel;
    var player:Player;
    public static var haveCollision:Bool = false;
    public static var jumpPower:Float;           //сила прыжка

    var gameIsOver(get,null):Bool = false;

    var bonus:Bonus;

    var gamePoints:Int = 0;
    var pointsField:TextField;

    public var bullets:Array<Bullet>;          //массив пуль
    public var spentBullets:Array<Bullet>;     //массив отработавших пуль

    var enemies:Array<Enemy>;                   //массив врагов
    var deadEnemies:Array<Enemy>;               //массив убитых врагов
    var maxEnemies:Int = 4;                         //максимальное число врагов на поле
    var spawnDelay:Float = 1.0;                       //промежуток времени, через который появляются враги
  //  var enemiesTimeFlag:Float;                  //временной флаг для генерации врагов
    var counter:Int =0;

    public function new(width:Int, height:Int)
    {
        super();
        sizeWidth = width;
        sizeHeight = height;
        //BackGround
        backGround = new BackGround("gameScreen");
       // backGround.scaleY = 1.5;
        addChild(backGround);

          //GameLevel
          gameLevel = new GameLevel(sizeWidth,sizeHeight);
          addChild(gameLevel);

          //Bullets
          bullets = [];
          spentBullets = [];


          //PLayer
          jumpPower = 15.0;
        player = new Player();
        player.x = 100;
        player.y = Main.sizeHeight/2;
        addChild(player);

        //Enemies
        enemies = [];
        deadEnemies = [];
       // enemiesTimeFlag = Timer.stamp();

       //Bonus
       Bonus.bonusIsUsed = false;
       Bonus.haveBonus = false;
       /* bonus = new Bonus();
       bonus.x = Main.sizeWidth/2;
       bonus.y = Main.sizeHeight/4;
       addChild(bonus);*/

        // PointsField
        pointsField = new TextField();
        pointsField.text = Std.string(gamePoints);
        pointsField.x  = Main.sizeWidth/2;
        pointsField.y = 0;
        pointsField.scaleX = 2.0;
        pointsField.scaleY = 2.0;
        pointsField.mouseEnabled = false;
        addChild(pointsField);

          
        //quitButton
        quitButton = new Button(sizeWidth/2,sizeHeight/2,"QUIT");
        quitButton.x = sizeWidth *7/ 8;
        quitButton.y = sizeHeight /25;
        
        addChild(quitButton);

        quitButton.addEventListener(MouseEvent.MOUSE_OVER, quitButtonOver);
        quitButton.addEventListener(MouseEvent.MOUSE_OUT, quitButtonOut);
        quitButton.addEventListener(MouseEvent.MOUSE_DOWN, quitButtonClick);
        Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, pause);

      

            
    }
    /*public function get_haveCollision() 
    {
        return haveCollision;    
    }*/

    public function pause(e:KeyboardEvent) 
    {
        if(e.keyCode == 120)
        {
            if(!pauseIsPressed)
                pauseIsPressed = true;
            else 
                pauseIsPressed = false;
        }
    }
    public function quitButtonClick(e:MouseEvent) 
    {
        quitButtonIsPressed = true;
    }
    public function quitButtonOver(e:MouseEvent)
    {
        quitButton.scaleX = 1.25;
        quitButton.scaleY = 1.25;   
    }
    public function quitButtonOut(e:MouseEvent)
    {
        quitButton.scaleX = 1.0;
        quitButton.scaleY = 1.0;    
    }

    public function get_quitButtonIsPressed() 
    {
        return quitButtonIsPressed;    
    }
    public function update() 
    {
        if(!pauseIsPressed)
        {
            bonusBuf();
            player.move(); 
           // doCollisionsWithTiles(); 
            player.doCollisionsWithTilesForPLayer(gameLevel.level);
            doCollidionWithEnemies();
            playerJump(jumpPower);
            player.spriteAnimated(player.get_state());  
            player.doShot(this);

            bulletsMove();
            generateEnemies();
            moveEnemies();
            doCollisionsWithBullet();
            //bonusDebuf();

            if(this.contains(bonus))
                {
                    bonus.fall(gameLevel.level);
                   if(bonus.checkCollisionWithPlayer(player))
                    {
                        removeChild(bonus);
                        bonus = null;
                    }
                }
        }
        else 
        {
            //enemiesTimeFlag += Timer.stamp() - enemiesTimeFlag;
           // player.set_shootingTime(player.get_shootingTime() + (Timer.stamp() - player.get_shootingTime()));
        }
        //trace(enemies.length+" "+deadEnemies.length);
       // trace(pauseIsPressed);
    }

    public function checkCollisionWithTile(playerHitBox: Rectangle, tile:Tile):Bool
    {
        var hitBox = new Point();
        hitBox = player.localToGlobal(new Point(playerHitBox.x,playerHitBox.y));  // координаты хитбокса игрока в глобальной системе координат
            if(player.get_direction() == right)
            {
                if(hitBox.x + playerHitBox.width > tile.x &&                        // проверка коллизии с верхней стороной тайла и направлением игрока вправо
                    hitBox.x  < tile.x +tile.width)
                {
                    if(hitBox.y + playerHitBox.height > tile.y && 
                        hitBox.y  < tile.y)
                        {
                            //trace("Collision with tile! "+ tile.x);
                            return true;
                        }
                }
            }
            else
            {
                if(hitBox.x  > tile.x &&                                            // проверка коллизии с верхней стороной тайла и направлением игрока влево
                    hitBox.x - playerHitBox.width  < tile.x +tile.width)
                {
                    if(hitBox.y + playerHitBox.height > tile.y && 
                        hitBox.y  < tile.y)
                        {
                           // trace("Collision with tile! "+ tile.x);
                            return true;
                        }
                }
            }
            
            return false;
    }
    public function doCollisionsWithTiles() 
    {
        haveCollision = false;
        for(i in 0...gameLevel.tilemap.numTiles)
        {
            if(checkCollisionWithTile(player.get_hitBox(),gameLevel.tilemap.getTileAt(i)))
            {
                player.y  = gameLevel.tilemap.getTileAt(i).y - player.get_hitBox().height/2+2.5;
                player.set_speedY(0.0);
                haveCollision = true;
            }
            //trace(i);
        }
    }
    public function playerJump(jumpPower:Float)
    {
       // trace(player.get_jump()+" "+haveCollision);
        if(player.get_jump() && haveCollision && player.get_collisionDirection() == up)
            {
                trace("jump");
                player.set_speedY(player.get_speedY()-jumpPower);
            }    
        if(!haveCollision)
            player.set_state(jump);
    }
    public function bulletsMove() 
    {
        var i=0;
        while(i < bullets.length)
            {
                bullets[i].move();
                if(bullets[i].x-bullets[i].width/2 >= Main.sizeWidth || bullets[i].x+bullets[i].width/2 <= 0)
                {
                    removeChild(bullets[i]);
                    spentBullets.push(bullets[i]);
                    bullets.remove(bullets[i]);
                }
                i++;
            }    
    }

    public function generateEnemies() 
    {
       // if(Timer.stamp()- enemiesTimeFlag >= spawnDelay)
        if(counter >= Main.get_FPS()* spawnDelay)
        {
            if(enemies.length < maxEnemies)
            {
                generateEnemy();
            }
            counter =0;
            //enemiesTimeFlag = Timer.stamp();
        }
        else
            ++counter;
    }

    public function generateEnemy() 
    {
        var enemy:Enemy;
        if(deadEnemies.length > 0)
        {
            enemy = deadEnemies.pop();
        }
        else
        {
            enemy = new Enemy();
        }
        enemy.y = 100;
        enemy.set_speedY(0.0);
        enemies.push(enemy);
        addChild(enemies[enemies.length-1]);
        if(Math.random() >= 0.5)
            {
                enemy.x = 800;
            }
            else
            {
                enemy.x = 0;
            } 
        
    }

    public function moveEnemies() 
    {
        var i=0;
        while(i < enemies.length)
        {
            enemies[i].move(player, gameLevel.level);
            i++;
        }    
    }

    public function doCollisionsWithBullet() 
    {
        var b =0;
        while(b < bullets.length)
        {
            var e =0;
            while(e < enemies.length)
            {
                if(bullets[b].checkCollisionWithEnemy(enemies[e]))
                {
                    removeChild(bullets[b]);
                    spentBullets.push(bullets[b]);
                    bullets.remove(bullets[b]);
                    removeChild(enemies[e]);
                    spawnBonus(enemies[e]);
                    ++gamePoints;
                    pointsField.text = Std.string(gamePoints);
                    deadEnemies.push(enemies[e]);
                    enemies.remove(enemies[e]);
                    b--;
                    break;
                }
                e++;
            }
            b++;
        } 
    }
    
    public function get_gameIsOver() 
    {
        return gameIsOver;    
    }
    public function get_gamePoints() 
    {
        return gamePoints;    
    }

    public function doCollidionWithEnemies() 
    {
        var e = 0;
        while(e< enemies.length)
        {
            if(player.checkCollisionWithEnemy(enemies[e]))
            {
                gameIsOver = true;
            }
            e++;
        }    
    }

    public function bonusBuf()
    {
        if(Bonus.bonusIsUsed)
        {
            if(Bonus.get_bonusType() == slow)
                Bonus.doBonusSlow(player,enemies,deadEnemies, bullets);
            else if(Bonus.get_bonusType()== destroy)
                doBonusDestroy();
        }    
    }
   /* public function bonusDebuf()
        {
            if(Bonus.bonusIsUsed)
            {
                Bonus.resetBonus(player,enemies, bullets);
            }    
        }*/

    public function spawnBonus(enemy:Enemy) 
    {
        if(!Bonus.bonusIsUsed && !Bonus.haveBonus && Math.random() < 0.08)
        {
            Bonus.bonusIsUsed = false;
            Bonus.haveBonus = true;
            bonus = new Bonus();
            bonus.set_speedY(-10.0);
            bonus.x = enemy.x;
            bonus.y = enemy.y;
            addChild(bonus);
        }
    }
        public function doBonusDestroy() 
        {
            var e =0;
            while(e < enemies.length)
            {
                {
                    removeChild(enemies[e]);
                    ++gamePoints;
                    pointsField.text = Std.string(gamePoints);
                    deadEnemies.push(enemies[e]);
                    enemies.remove(enemies[e]);
                }
                //e++;
            }
                Bonus.haveBonus = false;
                Bonus.bonusIsUsed = false;
        }
}