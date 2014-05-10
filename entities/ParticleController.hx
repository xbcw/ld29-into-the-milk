package entities; 
import com.haxepunk.Entity;
import com.haxepunk.graphics.Emitter;
import com.haxepunk.utils.Ease;
import com.haxepunk.graphics.Image;
import flash.display.BitmapData;
import com.haxepunk.HXP;

class ParticleController extends Entity 
{

	private var emitter:Emitter;

	public function new() 
	{
		super(x, y);
		//emitter = new Emitter("graphics/block.png", 4, 4);
		//emitter = new Emitter(new Image.createRect(3, 3, 0xFF0000), 3, 3);
		emitter = new Emitter(new BitmapData(3, 3, false, 0xFF0000), 3, 3);
		emitter.newType("explosion", [0]);
		emitter.setMotion("explosion", 0, Std.random(200), 3, 360, -40, 1, Ease.quadOut);
		emitter.setAlpha("explosion", 1, 0.1);
		graphic = emitter;
	}

	public function explosion(_x:Float, _y:Float, _p:Int = 20)
	{
		//trace("Starting explosion with _x: " + _x + " _y: " + _y);
		emitter.setMotion("explosion", 0, Std.random(200), Std.random(4), 360, Std.random( -40), 1, Ease.quadOut);
		emitter.setColor("explosion", HXP.choose(0x000000, 0xFF0000, 0x00FF00, 0x0000FF, 0xFFFFFF, 0x333333, 0x3366FF, 0x33FF33), HXP.choose(0x000000, 0xFF0000, 0x00FF00, 0x0000FF, 0xFFFFFF, 0x333333, 0x3366FF, 0x33FF33));
		for (i in 0..._p) {
			//trace("EXPLOSION " + i + " starting");
			emitter.emit("explosion", _x, _y);
			//trace("EXPLOSION " + i + " finished");
		}
	}
}