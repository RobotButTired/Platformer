package;

import openfl.display.Sprite;
import openfl.events.MouseEvent;

class Game extends Sprite
{
    var sizeWidth:Int;
    var sizeHeight:Int;
    var backGround:BackGround;
    var quitButton:Button;
    var quitButtonIsPressed:Bool =false;

    public function new(width:Int, height:Int)
    {
        super();
        sizeWidth = width;
        sizeHeight = height;
        backGround = new BackGround("gameScreen");
        backGround.scaleY = 1.5;
        addChild(backGround);

        quitButton = new Button(sizeWidth/2,sizeHeight/2,"QUIT");
        quitButton.x = sizeWidth *7/ 8;
        quitButton.y = sizeHeight /25;
        
        addChild(quitButton);

        quitButton.addEventListener(MouseEvent.MOUSE_OVER, quitButtonOver);
        quitButton.addEventListener(MouseEvent.MOUSE_OUT, quitButtonOut);
        quitButton.addEventListener(MouseEvent.MOUSE_DOWN, quitButtonClick);

            
    }
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
}