package se.salomonsson.game.components;
import se.salomonsson.seagal.core.IComponent;
import se.salomonsson.game.utils.PixelMapParser;

/**
 * ...
 * @author Tommislav
 */

class TileLayerComponent implements IComponent
{
	public var name:String;
	
	public var tileSheetId:Int;
	public var grid:ITileGrid;
	public var data:Array<Float>;
	
	// higher value means further back!
	public var zIndex:Int;
	
	public var scrollX:Float;
	public var scrollY:Float;
	
	public function new(layerName:String, zIndex:Int, grid:ITileGrid, sheetId:Int=0, scrollX:Float = 1, scrollY:Float = 1) {
		this.name = layerName;
		this.zIndex = zIndex;
		this.grid = grid;
		this.tileSheetId = sheetId;
		this.scrollX = scrollX;
		this.scrollY = scrollY;
		
		data = new Array<Float>();
	}
	
}