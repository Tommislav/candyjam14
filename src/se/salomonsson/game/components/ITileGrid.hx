package se.salomonsson.game.components;

/**
 * ...
 * @author Tommislav
 */
interface ITileGrid
{
	var width (get, null):Int;
	var height(get, null):Int;
	var size(get, null):Int;
	
	function atCoord(x:Int, y:Int):Int;
	function setOverrideValueAtCoord(x:Int, y:Int, value:Int):Void;
	function clearOverrideValueAt(x:Int, y:Int):Void;
	function clearAllOverrideValues():Void;
}