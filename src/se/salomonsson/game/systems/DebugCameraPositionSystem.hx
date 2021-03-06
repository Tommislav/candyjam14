package se.salomonsson.game.systems;
import flash.display.DisplayObjectContainer;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import se.salomonsson.seagal.core.GameTime;
import se.salomonsson.seagal.core.Sys;
import se.salomonsson.game.components.CameraComponent;
import se.salomonsson.game.components.CanvasComponent;
import se.salomonsson.game.components.DebugComponent;

/**
 * ...
 * @author Tommislav
 */

class DebugCameraPositionSystem extends Sys
{
	private var _holder:DisplayObjectContainer;
	private var _tf:TextField;
	private var _camera:CameraComponent;
	
	
	public function new(holder:DisplayObjectContainer, x:Float = 250, y:Float = 0)  { 
		#if debug
			_holder = holder;
			_tf = new TextField();
			_tf.selectable = false;
			_tf.x = x;
			_tf.y = y;
			_tf.autoSize = TextFieldAutoSize.LEFT;
			_tf.background = true;
			_holder.addChild(_tf);
		#end
		
		super(); 
	}
	
	override public function onAdded(sm, em):Void 
	{
		super.onAdded(sm, em);
		
		#if debug
			_camera = em.getComp(CameraComponent);
			tick(null);
		#end
	}
	
	override public function tick(gt:GameTime):Void 
	{
		#if debug
			var str:String = "Camera x=" + Std.int(_camera.x) + ", y=" + Std.int(_camera.y) + "\n";
			_tf.text = str;
		#end
	}
}