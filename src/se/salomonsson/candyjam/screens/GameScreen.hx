package se.salomonsson.candyjam.screens;
import flash.display.BitmapData;
import flash.display.DisplayObjectContainer;
import flash.Lib;
import openfl.Assets;
import se.salomonsson.candyjam.components.DrawableComponent;
import se.salomonsson.candyjam.components.PlayerComponent;
import se.salomonsson.candyjam.systems.RenderSystem;
import se.salomonsson.candyjam.systems.UpdatePlayerSystem;
import se.salomonsson.game.components.CameraComponent;
import se.salomonsson.game.components.CanvasComponent;
import se.salomonsson.game.systems.DebugCameraPositionSystem;
import se.salomonsson.seagal.core.Core;

/**
 * ...
 * @author Tommislav
 */
class GameScreen
{
	private var _core:Core;
	private var _holder:DisplayObjectContainer;
	
	
	public function new(holder) 
	{
		_holder = holder;
	}
	
	public function enter() {
		_core = new Core();
		
		var canvas:BitmapData = new BitmapData(640, 480, true);
		_core.getEntManager().allocateEntity()
			.addComponent(CanvasComponent.build(canvas));
		
		_core.getEntManager().allocateEntity()
			.addComponent(CameraComponent.build("mainCamera", 0, 0, 1024, 768));
		
		_core.getEntManager().allocateEntity()
			.addComponent(new PlayerComponent("Tommy"))
			.addComponent(new DrawableComponent(10, 10, Assets.getBitmapData("assets/ship.png", true)));
			
			
			
		_core.addSystem(new UpdatePlayerSystem(), 4);
		_core.addSystem(new RenderSystem(), 10);
		_core.addSystem(new DebugCameraPositionSystem(_holder), 10);
	}
	
	
	public function update() {
		_core.tick();
	}
	
	public function exit() {
		
	}
	
}