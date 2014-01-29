package se.salomonsson.candyjam.systems;

import flash.events.KeyboardEvent;
import flash.Lib;
import flash.ui.Keyboard;
import se.salomonsson.candyjam.components.PlayerComponent;
import se.salomonsson.seagal.core.GameTime;
import se.salomonsson.seagal.core.Sys;

/**
 * ...
 * @author Tommislav
 */
class UpdatePlayerSystem extends Sys
{
	private var _spaceDown:Bool;
	
	
	public function new() 
	{
		super();
	}
	
	override public function onAdded(sm, em):Void 
	{
		super.onAdded(sm, em);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
	}
	
	
	
	override public function onRemoved():Void 
	{
		super.onRemoved();
	}
	
	override public function tick(gt:GameTime):Void 
	{
		var players:Array<PlayerComponent> = em().getComponents(PlayerComponent);
		var p:PlayerComponent = players[0];
		p.thrust = _spaceDown;
		
	}
	
	
	
	private function onKeyDown(e:KeyboardEvent):Void 
	{
		if (e.keyCode == Keyboard.SPACE) {
			_spaceDown = true;
		}
	}
	
	private function onKeyUp(e:KeyboardEvent):Void 
	{
		if (e.keyCode == Keyboard.SPACE) {
			_spaceDown = false;
		}
	}
	
}