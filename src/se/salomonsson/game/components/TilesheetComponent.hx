package se.salomonsson.game.components;
import flash.display.BitmapData;
import openfl.display.Tilesheet;
import se.salomonsson.seagal.core.IComponent;

/**
 * ...
 * @author Tommislav
 */

class TilesheetComponent implements IComponent
{
	public var tileSheets:Array<Tilesheet>;
	
	public function new() {
		this.tileSheets = new Array<Tilesheet>();
	}
	
	public function setSingleSheet(sheet:Tilesheet):TilesheetComponent {
		this.tileSheets = [sheet];
		return this;
	}
}