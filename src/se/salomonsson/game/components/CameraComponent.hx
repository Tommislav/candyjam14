package se.salomonsson.game.components;
//import game.components.CenterPointPositionComponent;
import se.salomonsson.seagal.core.IComponent;

/**
 * ...
 * @author Tommislav
 */

class CameraComponent implements IComponent
{
	public var x:Float;
	public var y:Float;
	public var width:Float;
	public var height:Float;
	public var name:String;
	
	public function new(name:String, x:Float=0, y:Float=0, width:Float=800, height:Float=480) 
	{
		this.name = name;
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
	}
}