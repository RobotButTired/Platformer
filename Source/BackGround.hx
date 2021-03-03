package;

import openfl.display.Sprite;
import openfl.Assets;
import openfl.display.Bitmap;

class BackGround extends Sprite
{
    var bmp:Bitmap;
    public function new(name:String) 
    {
        super();
        bmp = new Bitmap(Assets.getBitmapData("assets/backGround/"+name+".png"));
        addChild(bmp);
    }
}