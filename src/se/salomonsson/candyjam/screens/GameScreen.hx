package se.salomonsson.candyjam.screens;
import flash.display.BitmapData;
import flash.display.DisplayObjectContainer;
import flash.display.Graphics;
import flash.display.Sprite;
import flash.geom.Rectangle;
import flash.Lib;
import openfl.Assets;
import openfl.display.Tilesheet;
import se.salomonsson.candyjam.components.DrawableComponent;
import se.salomonsson.candyjam.components.PlayerComponent;
import se.salomonsson.candyjam.systems.RenderSystem;
import se.salomonsson.candyjam.systems.UpdatePlayerSystem;
import se.salomonsson.game.components.CameraComponent;
import se.salomonsson.game.components.CanvasComponent;
import se.salomonsson.game.components.ITileGrid;
import se.salomonsson.game.components.TileLayerComponent;
import se.salomonsson.game.components.TilesheetComponent;
import se.salomonsson.game.systems.DebugCameraPositionSystem;
import se.salomonsson.game.systems.DebugFpsDisplaySystem;
import se.salomonsson.game.systems.SineMoveCameraSystem;
import se.salomonsson.game.utils.TileGrid;
import se.salomonsson.seagal.core.Core;
import se.salomonsson.seagal.debug.SLogger;

/**
 * ...
 * @author Tommislav
 */
class GameScreen
{
	private static inline var WIDTH = 1024;
	private static inline var HEIGHT = 768;
	
	private var _core:Core;
	private var _holder:DisplayObjectContainer;
	private var _canvas:Sprite;
	
	
	public function new(holder) 
	{
		_holder = holder;
	}
	
	public function enter() {
		_core = new Core();
		
		
		_core.getEntManager().allocateEntity()
			.addComponent(new CanvasComponent(getGraphicCanvas(), WIDTH, HEIGHT, "main", 1.0))
			.addComponent(new CameraComponent("mainCamera", 0, 0, WIDTH, HEIGHT))
			.addComponent(new TilesheetComponent().setSingleSheet(getTilesheet()))
			.addComponent(new TileLayerComponent("bg_back", 0, TileGrid.getRandomized(40, 20, 0, 8), 0, 0.3, 0.3))
			.addComponent(new TileLayerComponent("bg_mid", 0, TileGrid.getRandomized(40, 20, 12, 20), 0, 0.5, 0.5))
			.addComponent(new TileLayerComponent("bg_front", 0, TileGrid.getRandomized(40, 20, 24, 32), 0, 1, 1));
		
		
		_core.addSystem(new SineMoveCameraSystem("mainCamera", 0, 2560-1024, 0, 1280-768), 9);
		_core.addSystem(new DebugCameraPositionSystem(_holder), 9);
		_core.addSystem(new DebugFpsDisplaySystem(_holder), 9);
		_core.addSystem(new RenderSystem(), 10);
		
		
		
		
		
		//_core.addSystem(new UpdatePlayerSystem(), 4);
		//_core.addSystem(new RenderSystem(), 10);
		//_core.addSystem(new DebugCameraPositionSystem(_holder), 10);
	}
	
	
	public function update() {
		_core.tick();
	}
	
	public function exit() {
		
	}
	
	
	
	private function getGraphicCanvas():Graphics {
		_canvas = new Sprite();
		_canvas.width = WIDTH;
		_canvas.height = HEIGHT;
		
		_holder.addChild(_canvas);
		return _canvas.graphics;
	}
	
	private function getTilesheet():Tilesheet {
		var sheet:Tilesheet = new Tilesheet(Assets.getBitmapData("assets/candy_sheet.png", true));
		
		var w = 12;
		var h = 9;
		
		for (y in 0...h) {
			for (x in 0...w) {
				sheet.addTileRect(new Rectangle(x * 64, y * 64, 64, 64));
			}
		}
		return sheet;
	}
	
	
}