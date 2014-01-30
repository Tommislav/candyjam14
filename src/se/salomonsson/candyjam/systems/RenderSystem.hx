package se.salomonsson.candyjam.systems;

import flash.display.DisplayObjectContainer;
import flash.geom.Point;
import flash.geom.Rectangle;
import se.salomonsson.candyjam.components.DrawableComponent;
import se.salomonsson.game.components.CameraComponent;
import se.salomonsson.game.components.CanvasComponent;
import se.salomonsson.game.components.TileLayerComponent;
import se.salomonsson.game.components.TilesheetComponent;
import se.salomonsson.seagal.core.GameTime;
import se.salomonsson.seagal.core.Sys;
import se.salomonsson.seagal.debug.SLogger;

/**
 * ...
 * @author Tommislav
 */
class RenderSystem extends Sys
{
	public function new() 
	{
		super();
	}
	
	override public function tick(gt:GameTime):Void 
	{
		var holder:CanvasComponent = em().getComp(CanvasComponent);
		var sheets:TilesheetComponent = em().getComp(TilesheetComponent);
		var camera:CameraComponent = em().getComp(CameraComponent);
		var layers:Array<TileLayerComponent> = em().getComponents(TileLayerComponent);
		
		var renderData:Array<Float> = new Array<Float>();
		
		for (layer in layers) {
			recalcLayerData(renderData, layer, camera);
		}
		
		
		
		
		var smooth:Bool = false;
		holder.canvas.clear();
		sheets.tileSheets[0].drawTiles(holder.canvas, renderData, smooth);
		
	}
	
	function recalcLayerData(renderData:Array<Float>, layers:TileLayerComponent, camera:CameraComponent) 
	{
		var tileW = 64;
		var tileH = 64;
		
		var camX = camera.x * layers.scrollX;
		var camY = camera.y * layers.scrollY;
		var startX = Math.floor(camX / tileW);
		var startY = Math.floor(camY / tileH);
		var camOffX = camX - (startX * tileW);
		var camOffY = camY - (startY * tileH);
		
		var endX = startX + (Math.floor(camera.width / tileW) + 1);
		var endY = startY + (Math.floor(camera.height / tileH) + 1);
		
		for (y in startY...endY) {
			for (x in startX...endX) {
				
				var tileId = layers.grid.atCoord(x, y);
				if (tileId >= 0) {
					var tX:Float = (x*tileW) - camX;
					var tY:Float = (y*tileH) - camY;
					var tW = tX + 64;
					var tH = tY + 64;
					
					renderData.push(tX);
					renderData.push(tY);
					renderData.push(tileId);
				}
			}
		}
	}
}