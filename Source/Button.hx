package;

import openfl.display.Sprite;
import openfl.display.SimpleButton;
import openfl.text.TextField;

class Button extends Sprite
{
    var sizeWidth:Int;
    var sizeHeight:Int;

   // var isPressed:Bool = false;
    public function new(width:Float, height:Float, text:String) 
    {
        super();
        var buttonWidth = width / 2.5;
        var buttonHeight = height / 10; 
        this.graphics.beginFill(0xFF00FF);
        this.graphics.drawRoundRect(-buttonWidth/2, -buttonHeight/2, buttonWidth, buttonHeight,width/16);
        this.graphics.endFill();
        this.graphics.lineStyle(5,0x000000);
        this.graphics.drawRoundRect(-buttonWidth/2, -buttonHeight/2, buttonWidth, buttonHeight, width/16);
        this.graphics.endFill();
        
        var textstart = new TextField();
        textstart.text = text;
       
        textstart.textColor = 0x000000;
        textstart.x = -buttonWidth/6;
        textstart.y = -buttonHeight/2.5;
        textstart.mouseEnabled = false;
        textstart.scaleX = (width/800)*2.5;
        textstart.scaleY = (height/600)*2.5;
        textstart.height = buttonHeight/3;
        textstart.width = buttonWidth/5;
        this.addChild(textstart);
    }

}