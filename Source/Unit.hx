package;

import openfl.geom.Rectangle;
import openfl.display.Sprite;

enum Direction {left; right;}
enum CollisionDirection {up;down;left;right;}
class Unit extends Sprite
{
    var speedX:Float = 0.0;
    var speedY:Float = 0.0;
    var gravity:Float = 24;
    var direction:Direction = right;
    var collisionDirection(get,null):CollisionDirection;

    var movingLeft:Bool = false;
    var movingRight:Bool = false;

    var hitBox(get, null):Rectangle;
    public function new() 
    {
        super();

    }

    public function get_speedY():Float
    {
        return speedY;    
    }
    public function set_speedY(value:Float)
    {
        speedY = value;    
    }

    public function get_hitBox() 
    {
        return this.hitBox;
    }

    public function checkCollisionWithTile(tileType:Int, tileX:Float, tileY:Float):Bool
    {
        if(tileType > 0 && tileType < 5)
        {
            var tileWidth = Main.sizeWidth/20;
            var tileHeight = Main.sizeHeight/15;
            if(x+ hitBox.width/2 > tileX && x - hitBox.width/2 < tileX + tileWidth &&
                y + hitBox.height/2 > tileY && y - hitBox.height/2 < tileY +  tileHeight)
            {
                return true;
            }
            else 
                return false;
        }
        else 
            return false;
    }

    public function directionDefinition(tileX:Float, tileY:Float):CollisionDirection
    {
        var tileWidth = Main.sizeWidth/20;
        var tileHeight = Main.sizeHeight/15;
        var up = 0.0;
        var down = 0.0;
        var left = 0.0;
        var right = 0.0;
        left = x + hitBox.width/2 - tileX;
        up =  y + hitBox.height/2  - tileY;
        right = tileX + tileWidth -(x - hitBox.width/2);
        down = tileY + tileHeight - (y - hitBox.height/2);
        if(left <= up && left <= right && left <= down)
            return CollisionDirection.left;
        else if(up <= left && up <= right && up <= down)
            return CollisionDirection.up;
        else if(right <= left && right <= up &&right <= down)
            return CollisionDirection.right;
        else if(down <= left && down <= up && down <= right)
            return CollisionDirection.down;
        else 
            return CollisionDirection.up;

    }

    public function doCollisionWithTile(direction:CollisionDirection,tileX:Float, tileY:Float)
    {
       
        var tileWidth = Main.sizeWidth/20;
        var tileHeight = Main.sizeHeight/15;
        if(collisionDirection == up)
        {
            y = tileY - hitBox.height/2;
            speedY =0.0;
        }
        else if(collisionDirection == down)
        {
            y = tileY + tileHeight + hitBox.height/2;
            speedY =0.0;
        }
        else if(collisionDirection == left)
        {
            x = tileX - hitBox.width/2;
        }
        else if(collisionDirection == right)
        {
            x = tileX + tileWidth + hitBox.width/2;
        }
      
    }

    public function doCollisionsWithTiles(level:Array<Array<Int>>) 
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
                    collisionDirection = directionDefinition(j * tileWidth, i * tileHeight);
                    doCollisionWithTile(collisionDirection, j * tileWidth, i * tileHeight);
                }
            }
        }
    }

    public function get_collisionDirection() 
    {
        return collisionDirection;    
    }
    public function get_direction() 
        {
            return direction;    
        }
}