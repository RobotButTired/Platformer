package;

import openfl.display.SimpleButton;
import openfl.text.TextField;
import openfl.events.MouseEvent;
import openfl.display.Sprite;

class StartScreen extends Sprite
{
    var startButton:Button;
    var rulesButton:Button;
    var rulesButtonIsPressed:Bool = false;

    var sizeWidth:Int;
    var sizeHeight:Int;
    var main:Main;
    public function new(width:Int, height:Int , main:Main)
    {
        super();
        
        sizeWidth = width;
        sizeHeight = height;
        startButton = new Button(sizeWidth,sizeHeight,"START");
        startButton.x = sizeWidth / 2;
        startButton.y = sizeHeight / 4;
        startButton.addEventListener(MouseEvent.MOUSE_OVER, startButtonOver);
        startButton.addEventListener(MouseEvent.MOUSE_OUT, startButtonOut);
        addChild(startButton);
        rulesButton = new Button(sizeWidth,sizeHeight,"RULES");
        rulesButton.x = sizeWidth / 2;
        rulesButton.y = sizeHeight * 3 / 4;
        addChild(rulesButton);
        rulesButton.addEventListener(MouseEvent.MOUSE_OVER, rulesButtonOver);
        rulesButton.addEventListener(MouseEvent.MOUSE_OUT, rulesButtonOut);
        rulesButton.addEventListener(MouseEvent.MOUSE_DOWN, rulesButtonClick);
    }
    public function startButtonOver(e:MouseEvent)
    {
        startButton.scaleX = 1.25;
        startButton.scaleY = 1.25;   
    }
    public function startButtonOut(e:MouseEvent)
    {
        startButton.scaleX = 1.0;
        startButton.scaleY = 1.0;    
    }
    public function rulesButtonOver(e:MouseEvent)
     {
        rulesButton.scaleX = 1.25;
        rulesButton.scaleY = 1.25;   
    }
    public function rulesButtonOut(e:MouseEvent)
    {
        rulesButton.scaleX = 1.0;
        rulesButton.scaleY = 1.0;    
    }
    public function rulesButtonClick(e:MouseEvent) 
    {
        rulesButtonIsPressed = true;
    }
    public function get_rulesButtonIsPressed() 
    {
        return rulesButtonIsPressed;    
    }
    public function reset() 
    {
        rulesButtonIsPressed = false;    
    }
}