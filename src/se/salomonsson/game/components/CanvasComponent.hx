package se.salomonsson.game.components;
import flash.display.BitmapData;
import se.salomonsson.seagal.core.IComponent;

/**
 * ...
 * @author Tommislav
 */

class CanvasComponent implements IComponent
{

	public var canvas:BitmapData;
	public var width:Float;
	public var heigth:Float;
	public var scale:Float;
	public var name:String;
	
	public function new() 
	{
		
	}
	
	public static function build(canvas:BitmapData, width:Int=-1, height:Int=-1, name:String="", scale:Float=1.0):CanvasComponent {
		var c:CanvasComponent = new CanvasComponent();
		c.canvas = canvas;
		c.width = (width <= 0) ? canvas.width : width;
		c.heigth = (height <= 0) ? canvas.height : height;
		c.name = name;
		c.scale = scale;
		
		return c;
	}
}