package se.salomonsson.game.components;
import flash.display.Graphics;
import se.salomonsson.seagal.core.IComponent;

/**
 * ...
 * @author Tommislav
 */

class ViewPortComponent implements IComponent
{
	public var graphics:Graphics;
	public var viewportId:String;
	
	public function new(graphics:Graphics, viewportId:String) 
	{
		this.viewportId = viewportId;
		this.graphics = graphics;
	}
	
}