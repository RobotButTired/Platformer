package;

import openfl.events.Event;
import openfl.display.Sprite;


class Main extends Sprite
{
	var sizeWidth = 800;
	var sizeHeight = 600;
	var startScreen:StartScreen;
	var rulesScreen:RulesScreen;
	public function new()
	{
		super();
		startScreen = new StartScreen(sizeWidth, sizeHeight, this);
		rulesScreen = new RulesScreen(sizeWidth, sizeHeight);
		
		addChild(startScreen);
		
		trace(this.width+" "+this.height);

		addEventListener(Event.ENTER_FRAME, update);
	}

	public function update(e:Event)
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
	}
}
