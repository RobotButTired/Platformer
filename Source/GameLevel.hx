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

    var tilemap:Tilemap;
    var bmpData:BitmapData;
    var tileset:Tileset;
    var IDs:Array<Int>;
    var tile:Tile;
    public function new(width:Int, height:Int) 
    {
        super();
        sizeWidth = width;
        sizeHeight = height;

        bmpData = Assets.getBitmapData("assets/tileMap/PixelAtlas.png");
    
        tileset = new Tileset(bmpData);
        tilemap = new Tilemap(sizeWidth, sizeHeight, tileset);
        addChild(tilemap);

        var ind1 = tileset.addRect(new Rectangle(0,0,32,32));
        var ind2 = tileset.addRect(new Rectangle(32,0,32,32));
        var ind3 = tileset.addRect(new Rectangle(64,0,32,32));
        var ind4 = tileset.addRect(new Rectangle(96,0,32,32));

        this.IDs = [];
        this.IDs.push(ind1);
        this.IDs.push(ind2);
        this.IDs.push(ind3);
        this.IDs.push(ind4);
        addTiles();
       
       // trace(Lib.current.stage.stageWidth);
        
    }
    public function addTiles() 
    {
       
        for(i in 0...15)
            for(j in 0...20)    
                {
                    if(i == 11)
                    {
                        tile = new Tile(this.IDs[0],j*sizeWidth/20,i*sizeHeight/15);
                    }
                    if(i == 12)
                    {
                        tile = new Tile(this.IDs[1],j*sizeWidth/20,i*sizeHeight/15);
                    }
                    if(i == 13)
                        {
                            tile = new Tile(this.IDs[2],j*sizeWidth/20,i*sizeHeight/15);
                        }
                    if(i == 14)
                        {
                            tile = new Tile(this.IDs[3],j*sizeWidth/20,i*sizeHeight/15);
                        }
                    if(i>=11)
                    {
                        tile.scaleX = 1.25;
                        tile.scaleY = 1.25;
                        tilemap.addTile(tile); 
                    }

                }
    }
    
        
}