package;

import openfl.events.MouseEvent;
import openfl.display.Sprite;

class GameOverScreen extends Sprite
{
    var quitButton:Button;
    var quitButtonIsPressed:Bool = false;
    var tryAgainButton:Button;
    var tryAgainButtonIsPressed:Bool = false;

    var backGround:BackGround;
    public function new() 
    {
        super();
        backGround = new BackGround("gameOverScreen");
        addChild(backGround);

        quitButton = new Button(Main.sizeWidth,Main.sizeHeight, "QUIT");
        quitButton.x = Main.sizeWidth/4;
        quitButton.y = Main.sizeHeight *5/6;
        addChild(quitButton);
        quitButton.addEventListener(MouseEvent.MOUSE_OVER, quitButtonOver);
        quitButton.addEventListener(MouseEvent.MOUSE_OUT, quitButtonOut);
        quitButton.addEventListener(MouseEvent.MOUSE_DOWN, quitButtonClick);

        tryAgainButton = new Button(Main.sizeWidth,Main.sizeHeight, "TRY AGAIN");
        tryAgainButton.x = Main.sizeWidth*3/4;
        tryAgainButton.y = Main.sizeHeight *5/6;
        addChild(tryAgainButton);
        tryAgainButton.addEventListener(MouseEvent.MOUSE_OVER, tryAgainButtononOver);
        tryAgainButton.addEventListener(MouseEvent.MOUSE_OUT, tryAgainButtonOut);
        tryAgainButton.addEventListener(MouseEvent.MOUSE_DOWN, tryAgainButtonClick);
        
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
        public function quitButtonClick(e:MouseEvent) 
        {
            quitButtonIsPressed = true;
        }
        public function get_quitButtonIsPressed() 
        {
            return quitButtonIsPressed;    
        }
        public function reset() 
        {
            quitButtonIsPressed = false; 
            tryAgainButtonIsPressed = false;   
        }
    
        public function tryAgainButtononOver(e:MouseEvent)
            {
                tryAgainButton.scaleX = 1.25;
                tryAgainButton.scaleY = 1.25;   
            }
            public function tryAgainButtonOut(e:MouseEvent)
            {
                tryAgainButton.scaleX = 1.0;
                tryAgainButton.scaleY = 1.0;    
            }
            public function tryAgainButtonClick(e:MouseEvent) 
            {
                tryAgainButtonIsPressed = true;
            }
            public function get_tryAgainButtonIsPressed() 
            {
                return tryAgainButtonIsPressed;    
            }
}