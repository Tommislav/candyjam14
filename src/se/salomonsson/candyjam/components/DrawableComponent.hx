package se.salomonsson.candyjam.components;
import flash.display.BitmapData;
import se.salomonsson.seagal.core.IComponent;

/**
 * ...
 * @author Tommislav
 */
class DrawableComponent implements IComponent
{
	public var x:Float;
	public var y:Float;
	public var drawable:BitmapData;
	public var layerIndex:Int;
	
	
	public function new(x:Float, y:Float, drawable:BitmapData, ?layerIndex = null) {
		this.x = x;
		this.y = y;
		this.drawable = drawable;
		this.layerIndex = layerIndex;
	}
	
}