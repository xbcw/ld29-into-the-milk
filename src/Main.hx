import com.haxepunk.Engine;
import com.haxepunk.HXP;

class Main extends Engine
{

	override public function init()
	{
#if debug
		HXP.console.enable();
#end
		// HXP.scene = new scenes.GameScene();
		player = new entities.Player(HXP.halfWidth, HXP.halfHeight);
		HXP.world = new worlds.World1(player);
	}

	public static function main() { new Main(); }
	public var player:entities.Player;

}