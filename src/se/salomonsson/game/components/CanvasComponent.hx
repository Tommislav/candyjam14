package se.salomonsson.game.components;
import flash.display.BitmapData;
import flash.display.Graphics;
import se.salomonsson.seagal.core.IComponent;

/**
 * ...
 * @author Tommislav
 */

class CanvasComponent implements IComponent
{

	public var canvas:Graphics;
	public var width:Float;
	public var heigth:Float;
	public var scale:Float;
	public var name:String;
	
	public function new(canvas:Graphics, width:Int=640, height:Int=480, name:String="", scale:Float=1.0) 
	{
		this.canvas = canvas;
		this.width = width;
		this.heigth = height;
		this.name = name;
		this.scale = scale;
	}
}