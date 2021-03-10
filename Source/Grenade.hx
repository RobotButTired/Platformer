package;

import openfl.geom.Point;
import openfl.display.Tile;
import openfl.display.Sprite;

enum GrenadeState{active; inactive; explosion;}
class Grenade extends Sprite
{
    var radius:Float = 5.0;
    var speedX:Float;
    var speedY:Float;
    var gravity:Float = 0.8;
    var state:GrenadeState;
    var explosionTime:Float = 0.2;
    var explosionRadius:Float = 100.0;
    var currentRadius:Float =0;
    var explosionCounter:Int =0;
    public function new(player:Player)
    {
        super();
       
        setGrenade(player);
        state = active;
    }

    public function move() 
    {
        if(state == active)
        {
            x += speedX;
            y += speedY;
            speedY += gravity;
        }
        else if(state == explosion)
        {
            currentRadius = radius+((explosionRadius-radius)/(Main.get_FPS()*explosionTime)*explosionCounter);
            graphics.clear();
            graphics.lineStyle(2,0x0000FF);
            graphics.drawCircle(0,0,currentRadius);
            graphics.endFill();
            ++explosionCounter;
            if(explosionCounter > Main.get_FPS()*explosionTime)
            {
                graphics.clear();
                state = inactive;
                explosionCounter =0;
            }
        }
        
    }

    public function setGrenade(player:Player) 
    {
        graphics.clear();
        graphics.beginFill(0x0000FF);
        graphics.drawCircle(0,0,radius);
        graphics.endFill();
        if(player.get_direction() == right)
            {
                x= player.x + 10.0;
                y = player.y;
                speedX = 6.0;
                speedY = -15.0;
                gravity =0.8;
            } 
        else
            {
                x = player.x - 10.0;
                y = player.y;
                speedX = -6.0;
                speedY = -15.0;
                gravity =0.8;
                /*if(Bonus.bonusIsUsed)
                    {
                        speedX *= 4.0;
                        speedY *= 4.0;
                        gravity *= 8.0;
                    }*/
            }  
            if(Bonus.bonusIsUsed)
                {
                    speedX /= 4.0;
                    speedY /= 4.0;
                    gravity /= 16.0;
                }        
    }
    public function doCollisionWithTiles(level:Array<Array<Int>>) 
    {   if(state == active)
        {
            var tileWidth = Main.sizeWidth/20;
            var tileHeight = Main.sizeHeight/15;
            for(i in 0...level.length)
                {
                    for(j in 0...level[i].length)
                    {
                        if(checkCollisionWithTile(level[i][j], j * tileWidth, i * tileHeight))
                        {
                            state = explosion;
                        }
                    }
                } 
        }
    }

    public function checkCollisionWithTile(tileType:Int, tileX:Float, tileY:Float):Bool
    {
        if(tileType > 0 && tileType < 5)
        {
            var tileWidth = Main.sizeWidth/20;
            var tileHeight = Main.sizeHeight/15;
            var center = new Point(x,y);      // Сначала вычисляем точку центра окружности 

            var aabb_half_extands = new Point(tileWidth/2, tileHeight/2);
            var aabb_center = new Point(tileX+tileWidth/2, tileY+tileHeight/2);      // Вычисляем информацию по AABB (координаты центра, и половинки длин сторон)
    
            var difference = new Point(center.x - aabb_center.x, center.y - aabb_center.y);     // Получаем вектор разности между центром окружности и центром AABB
            var clamped = new Point(clamp(difference.x, -aabb_half_extands.x, aabb_half_extands.x),clamp(difference.y, -aabb_half_extands.y, aabb_half_extands.y));
                // Добавляя переменную clamped к AABB_center, мы получим ближайшую к окружности точку, лежащую на стороне AABB
            var closest = new Point(aabb_center.x + clamped.x, aabb_center.y + clamped.y);
                // Получаем вектор между центром окружности и ближайшей к ней точкой AABB, и проверяем, чтобы длина этого вектора была меньше радиуса окружности
            difference = new Point(closest.x - center.x, closest.y - center.y);
            var zero = new Point(0,0);
    
            var dist =Math.abs(Point.distance(difference, zero));
            //trace(dist +" "+ball.get_radius());
            if(dist < radius)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else
            return false;
        
    }
    public function checkCollisionWithEnemy(enemy:Enemy) 
    {
        
        if(state != inactive)
        {
            var radius_:Float;
            if(state == active)
                radius_ = radius;
            else 
                radius_ = currentRadius;
            var center = new Point(x,y);      // Сначала вычисляем точку центра окружности 

            var aabb_half_extands = new Point(enemy.get_hitBox().width/2, enemy.get_hitBox().height/2);
            var aabb_center = new Point(enemy.x, enemy.y);      // Вычисляем информацию по AABB (координаты центра, и половинки длин сторон)
    
            var difference = new Point(center.x - aabb_center.x, center.y - aabb_center.y);     // Получаем вектор разности между центром окружности и центром AABB
            var clamped = new Point(clamp(difference.x, -aabb_half_extands.x, aabb_half_extands.x),clamp(difference.y, -aabb_half_extands.y, aabb_half_extands.y));
                // Добавляя переменную clamped к AABB_center, мы получим ближайшую к окружности точку, лежащую на стороне AABB
            var closest = new Point(aabb_center.x + clamped.x, aabb_center.y + clamped.y);
                // Получаем вектор между центром окружности и ближайшей к ней точкой AABB, и проверяем, чтобы длина этого вектора была меньше радиуса окружности
            difference = new Point(closest.x - center.x, closest.y - center.y);
            var zero = new Point(0,0);
    
            var dist =Math.abs(Point.distance(difference, zero));
            if(dist < radius_)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else 
            return false;
        
    }

    public function clamp(value:Float, min:Float, max:Float):Float
    {
        return Math.max(min,Math.min(max,value));
    }
    public function get_state() 
    {
        return state;    
    }
    public function set_state(value:GrenadeState) 
    {
        state = value;    
    }
    public function get_explosionRadius() 
    {
        return explosionRadius;    
    }
    public function set_speedX(value:Float) 
    {
        speedX = value;    
    }
    public function get_speedX() 
    {
        return speedX;    
    }
    public function set_speedY(value:Float) 
        {
            speedY = value;    
        }
        public function get_speedY() 
        {
            return speedY;    
        }
        public function set_gravity(value:Float) 
            {
                gravity = value;    
            }
            public function get_gravity() 
            {
                return gravity;    
            }
}