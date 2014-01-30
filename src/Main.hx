package;


import flash.display.Graphics;
import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.text.TextField;
import flash.ui.Keyboard;
import openfl.Assets;
import openfl.display.Tilesheet;
import se.salomonsson.candyjam.screens.GameScreen;
import se.salomonsson.game.components.ITileGrid;
import se.salomonsson.game.utils.PixelMapParser;
import se.salomonsson.seagal.debug.SLogger;


class Main extends Sprite {
	
	// resolution on nexus 7:		1280x736
	// resolution on htc one:		1080x776
	
	private var _currentScreen:GameScreen;
	
	public function new () {
		
		super ();
		
		
		_currentScreen = new GameScreen(this);
		_currentScreen.enter();
		
		var s:Sprite = new Sprite();
		addChild(s);
		
		var g:Graphics = s.graphics;
		
		var sheet:Tilesheet = new Tilesheet(Assets.getBitmapData("assets/ship.png", true));
		sheet.addTileRect(new Rectangle(0, 0, 64, 64), new Point(32, 32));
		
		sheet.drawTiles(g, [100, 100, 0], true);
		
		
		SLogger.setShortcutKeyCode(Keyboard.F1);
		addEventListener(Event.ENTER_FRAME, onEF);
	}
	
	private function onEF(e:Event):Void 
	{
		_currentScreen.update();
	}
	
	
}