package se.salomonsson.candyjam.screens;
import se.salomonsson.seagal.core.Core;

/**
 * ...
 * @author Tommislav
 */
class GameScreen
{
	private var _core:Core;
	
	
	public function new() 
	{
		
	}
	
	public function enter() {
		_core = new Core();
		
	}
	
	
	
	public function update() {
		_core.tick();
	}
	
	public function exit() {
		
	}
	
}