package se.salomonsson.candyjam.components;

import se.salomonsson.seagal.core.IComponent;

/**
 * ...
 * @author Tommislav
 */
class PlayerComponent implements IComponent
{
	public var id:Int;
	public var playerName:String = "";
	public var color:UInt;
	public var thrust:Bool = false;
	public var alive:Bool = true;
	
	
	public function new(name:String) 
	{
		this.playerName = name;
		this.color = Std.int(Math.random() * 0xffffff);
	}
	
}