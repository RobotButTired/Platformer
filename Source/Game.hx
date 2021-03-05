package;

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

    public var bullets:Array<Bullet>;          //массив пуль
    public var spentBullets:Array<Bullet>;     //массив отработавших пуль
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
        doCollisions(); 
        playerJump();
        player.spriteAnimated(player.get_state());  
        player.doShot(this);
        bulletsMove();
        trace(bullets.length+" "+spentBullets.length);
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
    public function doCollisions() 
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
}