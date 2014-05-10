package worlds;

import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Text;
import com.haxepunk.Sfx;
import com.haxepunk.World;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Backdrop;
import com.haxepunk.Entity;
import com.haxepunk.tmx.TmxEntity;
import com.haxepunk.tmx.TmxMap;
import entities.Cookie;
import entities.GV;
import flash.geom.Point;
import entities.ParticleController;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;

class WorldWin extends World
{
	public function new(player:entities.Player)
	{
		super();
		var b:Backdrop = new Backdrop("graphics/winscreen.png", false, false);
		var e:Entity = new Entity();
		e.graphic = b;
		add(e);
		
		Input.define("next_world", [Key.SPACE]);
	}
	
	public override function update()
	{
		super.update();
		if (Input.check("next_world"))
		{
			HXP.world = new worlds.World1(new entities.Player(HXP.halfWidth, HXP.halfHeight));
		}
	}

}