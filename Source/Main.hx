package;

import haxe.Timer;
import openfl.events.Event;
import openfl.display.Sprite;



class Main extends Sprite
{
	public static  var sizeWidth = 800;
	public static var sizeHeight = 600;
	var startScreen:StartScreen;
	var rulesScreen:RulesScreen;
	var gameOverScreen:GameOverScreen;
	var game:Game;

	static var FPS(get,null):Int = 60;
	var timeFlag:Float;
	public function new()
	{
		super();
		startScreen = new StartScreen(sizeWidth, sizeHeight, this);
		rulesScreen = new RulesScreen(sizeWidth, sizeHeight);
		gameOverScreen = new GameOverScreen();
		
		
		addChild(startScreen);
		
		trace(this.width+" "+this.height);

		addEventListener(Event.ENTER_FRAME, update);

		timeFlag = Timer.stamp();
	}

	public function update(e:Event)
	{
		if(Timer.stamp() - timeFlag >= 1/FPS)
		{
			if(startScreen.get_rulesButtonIsPressed())
				{
					removeChild(startScreen);
					startScreen.reset();
					addChild(rulesScreen);
				}
			if(rulesScreen.get_backButtonIsPressed())
				{
					removeChild(rulesScreen);
					rulesScreen.reset();
					addChild(startScreen);
				}
			if(startScreen.get_startButtonIsPressed())
				{
					removeChild(startScreen);
					startScreen.reset();
					game = new Game(sizeWidth, sizeHeight);
					addChild(game);
				}
			if(gameOverScreen.get_quitButtonIsPressed())
			{
				removeChild(gameOverScreen);
				gameOverScreen.reset();
				addChild(startScreen);
			}
			if(gameOverScreen.get_tryAgainButtonIsPressed())
			{
				removeChild(gameOverScreen);
				gameOverScreen.reset();
				game = new Game(sizeWidth, sizeHeight);
				addChild(game);
			}
			if(this.contains(game))
				{
					if(game.get_quitButtonIsPressed())
					{
						removeChild(game);
						addChild(startScreen);
						game =null;
					}
					else if(game.get_gameIsOver())
					{
						removeChild(game);
						gameOverScreen.pointsField.text = Std.string(game.get_gamePoints());
						addChild(gameOverScreen);
						game =null;
					}
					if(game != null)
						{
							game.update();
						}
				}
			timeFlag = Timer.stamp();
		}
		
	}

	public static function get_FPS() 
	{
		return FPS;
	}
}
