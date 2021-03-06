package;

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
    var gameLevel:GameLevel;
    var player:Player;
    var haveCollision:Bool = false;
    var gameIsOver(get,null):Bool = false;

    public var bullets:Array<Bullet>;          //массив пуль
    public var spentBullets:Array<Bullet>;     //массив отработавших пуль

    var enemies:Array<Enemy>;                   //массив врагов
    var deadEnemies:Array<Enemy>;               //массив убитых врагов
    var maxEnemies:Int = 2;                         //максимальное число врагов на поле
    var spawnDelay:Float = 2.0;                       //промежуток времени, через который появляются враги
    var enemiesTimeFlag:Float;                  //временной флаг для генерации врагов

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
        player = new Player();
        player.x = 100;
        player.y = 100;
        addChild(player);

        //Enemies
        enemies = [];
        deadEnemies = [];
        enemiesTimeFlag = Timer.stamp();

          
        //quitButton
        quitButton = new Button(sizeWidth/2,sizeHeight/2,"QUIT");
        quitButton.x = sizeWidth *7/ 8;
        quitButton.y = sizeHeight /25;
        
        addChild(quitButton);

        quitButton.addEventListener(MouseEvent.MOUSE_OVER, quitButtonOver);
        quitButton.addEventListener(MouseEvent.MOUSE_OUT, quitButtonOut);
        quitButton.addEventListener(MouseEvent.MOUSE_DOWN, quitButtonClick);

      

            
    }
    /*public function get_haveCollision() 
    {
        return haveCollision;    
    }*/
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
        player.move(); 
        doCollisionsWithTiles(); 
        doCollidionWithEnemies();
        playerJump();
        player.spriteAnimated(player.get_state());  
        player.doShot(this);
        bulletsMove();
        generateEnemies();
        moveEnemies();
        doCollisionsWithBullet();
        trace(enemies.length+" "+deadEnemies.length);
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
    public function playerJump()
    {
       // trace(player.get_jump()+" "+haveCollision);
        if(player.get_jump() && haveCollision)
            {
                trace("jump");
                player.set_speedY(player.get_speedY()-15.0);
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
        if(Timer.stamp()- enemiesTimeFlag >= spawnDelay)
        {
            if(enemies.length < maxEnemies)
            {
                generateEnemy();
            }
            enemiesTimeFlag = Timer.stamp();
        }
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
            enemies[i].move(player);
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
                    deadEnemies.push(enemies[e]);
                    enemies.remove(enemies[e]);
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
}