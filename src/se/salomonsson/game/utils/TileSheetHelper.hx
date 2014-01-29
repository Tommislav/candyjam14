package se.salomonsson.game.utils;
import aze.display.TilesheetEx;
import flash.display.BitmapData;
import flash.geom.Point;
import flash.geom.Rectangle;

/**
 * ...
 * @author Tommislav
 */
class TileSheetHelper
{
	
	private var _sheet:TilesheetEx;
	private var _tileW:Int;
	private var _tileH:Int;
	
	private var _keys:Map<String,Int>;
	private var _count:Int;
	
	public function new(bd:BitmapData, tileWidth:Int, tileHeight:Int, scale:Float=1.0) 
	{
		_sheet = new TilesheetEx(bd, scale);
		_tileW = tileWidth;
		_tileH = tileHeight;
		_keys = new Map<String,Int>();
	}
	
	public function retisterTile(name:String, tileIndexX:Int, tileIndexY:Int, centerPoint:Point=null) {
		var rect = new Rectangle(tileIndexX * _tileW, tileIndexY * _tileH, _tileW, _tileH);
		var id:Int = _sheet.addTileRect(rect, centerPoint);
		_keys.set(name, id);
	}
	
	
}