package;

import openfl.Lib;
import openfl.geom.Point;
import openfl.geom.Rectangle;
import openfl.display.BitmapData;
import openfl.display.Tileset;
 import openfl.display.Tilemap;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Tile;
import openfl.display.Sprite;


class GameLevel extends Sprite
{
    var sizeWidth:Int;
    var sizeHeight:Int;

    public var tilemap:Tilemap;
    var bmpData:BitmapData;
    var tileset:Tileset;
    var IDs:Array<Int>;
    var tile:Tile;
    public var level:Array<Array<Int>>;
    public function new(width:Int, height:Int) 
    {
        super();
        sizeWidth = width;
        sizeHeight = height;

        bmpData = Assets.getBitmapData("assets/tileMap/PixelAtlas.png");
    
        tileset = new Tileset(bmpData);
        tilemap = new Tilemap(sizeWidth, sizeHeight, tileset);
        addChild(tilemap);

                //Тайловая карта уровня
        level =[[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                [0,0,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,0,0],
                [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                [2,1,0,0,0,0,0,9,8,5,6,9,0,0,0,0,1,1,1,1],
                [2,2,1,1,1,1,1,2,2,2,2,2,1,1,1,1,2,2,2,2],
                [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
                [3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3],
                [4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4]];

        var ind1 = tileset.addRect(new Rectangle(0,0,32,32));
        var ind2 = tileset.addRect(new Rectangle(32,0,32,32));
        var ind3 = tileset.addRect(new Rectangle(64,0,32,32));
        var ind4 = tileset.addRect(new Rectangle(96,0,32,32));
        var ind5 = tileset.addRect(new Rectangle(96,96,32,32));  // дерево
        var ind6 = tileset.addRect(new Rectangle(0,128,32,32));  // дерево_2
        var ind7 = tileset.addRect(new Rectangle(32,128,32,32));  // камень
        var ind8 = tileset.addRect(new Rectangle(64,128,32,32));  // камень_2
        var ind9 = tileset.addRect(new Rectangle(96,128,32,32));  // куст

        this.IDs = [];
        this.IDs.push(ind1);
        this.IDs.push(ind2);
        this.IDs.push(ind3);
        this.IDs.push(ind4);
        this.IDs.push(ind5);        // дерево
        this.IDs.push(ind6);        // дерево_2
        this.IDs.push(ind7);        // камень
        this.IDs.push(ind8);        // камень_2
        this.IDs.push(ind9);        // куст
        addTiles();
        trace(tilemap.numTiles);
        //trace(tilemap.getTileAt(0).x+" "+tilemap.getTileAt(0).y);
        //trace(tilemap.getTileAt(0).width);

           
       
       // trace(Lib.current.stage.stageWidth);
        
    }
    public function addTiles() 
    {
       // trace(level);
        for(i in 0...level.length)
        {
            for(j in 0...level[i].length)
            {
                if(level[i][j] != 0)
                {
                    tile = new Tile(this.IDs[level[i][j]-1],j*Main.sizeWidth/20, i*Main.sizeHeight/15);
                    tile.scaleX = 1.25;
                    tile.scaleY = 1.25;
                    tilemap.addTile(tile); 
                }  
            }
        }
    }
    
        
}