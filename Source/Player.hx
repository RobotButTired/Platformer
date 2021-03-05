package;

import openfl.display.Sprite;
import openfl.geom.Rectangle;
import openfl.Lib;
import openfl.events.KeyboardEvent;
import haxe.Timer;
import openfl.Assets;
import openfl.display.Bitmap;

enum State {idle; walk; jump;}
enum Direction {left; right;}

class Player extends Unit
{
    var idleWidthGun:Array<Bitmap>;
    var walkWithGun:Array<Bitmap>;
    var jumpWithGun:Array<Bitmap>;

    var directionLeft:Bool = false;
    var directionRight:Bool = false;
    var direction:Direction = right;
    var jump:Bool = false;
    var hitBox(get, null):Rectangle;

    var state:State = idle;

    var timeFlag:Float;
    var frameTime:Float = 0.15;
    var ind:Int;
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
        drawHitBox();
       //this.addChild(idleWidthGun[0]);  
        ind =0; 
        timeFlag = Timer.stamp();

        Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
        Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
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
                directionLeft = true;
                //state = walk;
            }  
            if(e.keyCode == 39 || e.keyCode == 68)
            {
                directionRight = true;
                //state = walk;
            }
            if(e.keyCode == 38 || e.keyCode == 87)
                jump = true;
    }
    public function keyUpHandler(e:KeyboardEvent) 
    {
        if(e.keyCode == 37 || e.keyCode == 65)
        {
            directionLeft = false;
            direction = left;
        }  
        if(e.keyCode == 39 || e.keyCode == 68)
        {
            directionRight = false;
            direction = right;
        }
        if(e.keyCode == 38 || e.keyCode == 87)
            jump = false;
    }
    public function move() 
    {
        if(directionLeft )
            {
                if(x-hitBox.width/2 >= 0)
                    x -= speedX;
                state = walk;
                scaleX = -1.0;
            }
        if(directionRight)
            {
                if(x+hitBox.width/2 <= Main.sizeWidth)
                    x += speedX;    
                state = walk;
                scaleX = 1.0;
            }
        if(directionLeft && directionRight)
            state = idle;
        if(!directionLeft && !directionRight)
            state = idle;
        speedY += gravity;
        y += speedY;

    }
    public function get_state()
    {
        return state;    
    }
    public function get_direction() 
    {
        return direction;    
    }


    public function drawHitBox() 
    {
        graphics.lineStyle(1,0xFF0000);
        graphics.drawRect(-hitBox.width/2,-hitBox.height/2,hitBox.width,hitBox.height);
        graphics.endFill();
    }

    public function get_hitBox() 
    {
        return this.hitBox;
    }

    public function get_directionLeft() 
    {
        return directionLeft;    
    }
    public function get_directionRight() 
    {
        return directionRight;    
    }
    public function get_jump() 
    {
        return jump;    
    }
    public function set_state(value:State) 
    {
        state = value;    
    }
    
}
