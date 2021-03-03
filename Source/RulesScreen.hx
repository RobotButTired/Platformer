package;

import openfl.display.Sprite;
import openfl.events.MouseEvent;

class RulesScreen extends Sprite
{
    var sizeWidth:Int;
    var sizeHeight:Int;

    var backButton:Button;
    var backButtonIsPressed:Bool = false;

    var backGround:BackGround;
    public function new(width:Int, height:Int)
    {
        super();
        sizeWidth = width;
        sizeHeight = height;

        backGround = new BackGround("rulesScreen");
        addChild(backGround);
        backButton = new Button(sizeWidth, sizeHeight, "BACK");
        backButton.x = sizeWidth /2;
        backButton.y = sizeHeight *3.5/ 4;
        addChild(backButton);
        backButton.addEventListener(MouseEvent.MOUSE_OVER, backButtonOver);
        backButton.addEventListener(MouseEvent.MOUSE_OUT, backButtonOut);
        backButton.addEventListener(MouseEvent.MOUSE_DOWN, backButtonClick);
        
    }

    public function backButtonOver(e:MouseEvent)
    {
        backButton.scaleX = 1.25;
        backButton.scaleY = 1.25;   
    }
    public function backButtonOut(e:MouseEvent)
    {
        backButton.scaleX = 1.0;
        backButton.scaleY = 1.0;    
    }
    public function backButtonClick(e:MouseEvent) 
    {
        backButtonIsPressed = true;
    }
    public function get_backButtonIsPressed() 
    {
        return backButtonIsPressed;    
    }
    public function reset() 
    {
        backButtonIsPressed = false;    
    }

}