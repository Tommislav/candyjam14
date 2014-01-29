package;


import flash.display.Sprite;
import flash.text.TextField;


class Main extends Sprite {
	
	// resolution on nexus 7:		1280x736
	// resolution on htc one:		1080x776
	
	
	public function new () {
		
		super ();
		
		var tf:TextField = new TextField();
		tf.text = "hej";
		addChild(tf);
		
	}
	
	
}