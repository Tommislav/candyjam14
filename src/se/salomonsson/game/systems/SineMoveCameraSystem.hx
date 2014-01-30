package se.salomonsson.game.systems;
import flash.display.Stage;
import se.salomonsson.game.components.CameraComponent;
import se.salomonsson.seagal.core.GameTime;
import se.salomonsson.seagal.core.Sys;

/**
 * ...
 * @author Tommislav
 */

class SineMoveCameraSystem extends Sys
{
	private var _name:String;
	private var _camera:CameraComponent;
	
	private var _minX:Float;
	private var _maxX:Float;
	private var _minY:Float;
	private var _maxY:Float;
	
	private var _cntX:Float;
	private var _cntY:Float;
	
	public function new(cameraName:String, minX:Float=0, maxX:Float=1024, minY:Float=0, maxY:Float=768) 
	{
		super();
		_name = cameraName;
		_minX = minX;
		_maxX = maxX;
		_minY = minY;
		_maxY = maxY;
		
		_cntX = 0;
		_cntY = 0;
	}
	
	override public function tick(gt:GameTime):Void 
	{
		if (_camera == null) {
			getCamera();
		}
		
		_cntX += 0.05;
		_cntY += 0.01;
		
		var w2 = (_maxX - _minX) / 2;
		var h2 = (_maxY - _minY) / 2;
		
		_camera.x = _minX + Std.int(Math.sin(_cntX) * w2 + w2);
		_camera.y = _minY + Std.int(Math.cos(_cntY) * h2 + h2);
	}
	
	
	
	function getCamera() 
	{
		var camArr = em().getComponents(CameraComponent);
		if (camArr.length == 0) { throw "No CameraComponent found"; }
		if (camArr.length == 1) { _camera = camArr[0]; return; }
		
		for (i in 0...camArr.length) {
			if (camArr[i].name == _name) {
				_camera = camArr[i];
				return;
			}
		}
		throw "No CameraComponent with name ["+ _name +"] found";
	}
}