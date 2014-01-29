package se.salomonsson.candyjam.systems;

import flash.display.DisplayObjectContainer;
import flash.geom.Point;
import flash.geom.Rectangle;
import se.salomonsson.candyjam.components.DrawableComponent;
import se.salomonsson.game.components.CanvasComponent;
import se.salomonsson.seagal.core.GameTime;
import se.salomonsson.seagal.core.Sys;

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
		holder.canvas.fillRect(new Rectangle(0, 0, holder.width, holder.heigth), 0xffffff);
		
		var drawables:Array<DrawableComponent> = em().getComponents(DrawableComponent);
		for (i in 0...drawables.length) {
			holder.canvas.copyPixels(drawables[i].drawable, new Rectangle(0, 0, 64, 64), new Point(drawables[i].x, drawables[i].y));
		}
	}
	
}