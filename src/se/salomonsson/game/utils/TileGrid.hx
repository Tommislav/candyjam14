package se.salomonsson.game.utils;

import se.salomonsson.game.components.ITileGrid;

/**
 * ...
 * @author Tommislav
 */
class TileGrid implements ITileGrid
{
	private var _width:Int;
	private var _height:Int;
	private var _size:Int;
	private var _data:Array<Int>;
	private var _overrideData:Array<Int>;
	
	private static inline var OVERFLOW:Int = -1;

	public function new(width:Int, height:Int, data:Array<Int>) 
	{
		_width = width;
		_height = height;
		_size = _width * _height;
		_data = data;
		clearAllOverrideValues();
	}
	
	/* INTERFACE se.salomonsson.game.components.ITileGrid */
	
	function get_width():Int 
	{
		return _width;
	}
	
	public var width(get_width, null):Int;
	
	function get_height():Int 
	{
		return _height;
	}
	
	public var height(get_height, null):Int;
	
	function get_size():Int 
	{
		return _size;
	}
	
	public var size(get_size, null):Int;
	
	public function atCoord(x:Int, y:Int):Int 
	{
		var i:Int = (y * _width + x);
		
		if (i < 0 || i >= _size) return OVERFLOW;
		
		if (_overrideData[i] != -1) {
			return _overrideData[i];
		}
		return _data[i];
	}
	
	public function setOverrideValueAtCoord(x:Int, y:Int, value:Int):Void 
	{
		_overrideData[y * _width + x] = value;
	}
	
	public function clearOverrideValueAt(x:Int, y:Int):Void 
	{
		_overrideData[y * _width + x] = -1;
	}
	
	public function clearAllOverrideValues():Void 
	{
		_overrideData = new Array<Int>();
		for (i in 0..._data.length) {
			_overrideData.push( -1);
		}
	}
	
	
	public static function getRandomized(width:Int, height:Int, min:Int, max:Int) {
		var data:Array<Int> = new Array<Int>();
		var size = width * height;
		for (i in 0...size) {
			data.push(Math.floor(Math.random() * (max-min) + min));
		}
		return new TileGrid(width, height, data);
	}
}