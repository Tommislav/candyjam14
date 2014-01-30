package se.salomonsson.game.systems;
import flash.display.DisplayObjectContainer;
import flash.Lib;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import se.salomonsson.seagal.core.GameTime;
import se.salomonsson.seagal.core.Sys;
import se.salomonsson.game.components.CameraComponent;
import se.salomonsson.game.components.CanvasComponent;
import se.salomonsson.game.components.DebugComponent;

/**
 * Should be as close to 16.6 as possible.
 * The higher the worse
 * @author Tommislav
 */

class DebugFpsDisplaySystem extends Sys
{
	private var _holder:DisplayObjectContainer;
	private var _tf:TextField;
	private var _times:Array<Int>;
	private var _lastTime:Int;
	
	public function new(holder:DisplayObjectContainer, x:Float = 250, y:Float = 20)  { 
		#if debug
			_holder = holder;
			_tf = new TextField();
			_tf.selectable = false;
			_tf.x = x;
			_tf.y = y;
			_tf.autoSize = TextFieldAutoSize.LEFT;
			_tf.background = true;
			_holder.addChild(_tf);
			
			_times = new Array<Int>();
			_lastTime = Lib.getTimer();
		#end
		
		super(); 
	}
	
	override public function tick(gt:GameTime):Void 
	{
		#if debug
			var now = Lib.getTimer();
			var diff = now - _lastTime;
			_lastTime = now;
			
			_times.push(diff);
			if (_times.length > 9) {
				var t:Float = 0;
				for (diffs in _times) {
					t += diffs;
				}
				t /= _times.length;
				
				_times = [];
				_tf.text = "FPS: " + t;
			}
		#end
	}
}