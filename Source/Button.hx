package;

import openfl.display.Sprite;
import openfl.display.SimpleButton;
import openfl.text.TextField;

class Button extends Sprite
{
    var sizeWidth:Int;
    var sizeHeight:Int;

   // var isPressed:Bool = false;
    public function new(width:Int, height:Int, text:String) 
    {
        super();
        var buttonWidth = width / 2.5;
        var buttonHeight = height / 10; 
        this.graphics.beginFill(0xFF00FF);
        this.graphics.drawRoundRect(-buttonWidth/2, -buttonHeight/2, buttonWidth, buttonHeight, 50.0);
        this.graphics.endFill();
        this.graphics.lineStyle(5,0x000000);
        this.graphics.drawRoundRect(-buttonWidth/2, -buttonHeight/2, buttonWidth, buttonHeight, 50.0);
        this.graphics.endFill();
        
        var textstart = new TextField();
        textstart.text = text;
        
        textstart.textColor = 0x000000;
        textstart.x = -50;
        textstart.y = -25;
        textstart.mouseEnabled = false;
        textstart.scaleX = 2.5;
        textstart.scaleY = 2.5;
        this.addChild(textstart);
    }

}