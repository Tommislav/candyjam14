package;


import flash.display.Sprite;
import flash.text.TextField;
import se.salomonsson.candyjam.screens.GameScreen;


class Main extends Sprite {
	
	// resolution on nexus 7:		1280x736
	// resolution on htc one:		1080x776
	
	private var _currentScreen:GameScreen;
	
	public function new () {
		
		super ();
		
		
		_currentScreen = new GameScreen(this);
		_currentScreen.enter();
		
	}
	
	
}