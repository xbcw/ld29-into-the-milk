package worlds;

import com.haxepunk.graphics.Image;
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

class World10 extends World
{
	public function new(player:entities.Player)
	{
		super();
		var b:Backdrop = new Backdrop("graphics/stars.png", true, true);
		b.scrollX = 0.5;
		b.scrollY = 0.5;
		var e:Entity = new Entity();
		e.graphic = b;
		add(e);
		
		player.worldLevel = 10;
		player.worldName.text = "World 10";
		createMap();
		
		add(player);
		player.moveTo(HXP.halfWidth, -1000);
		camera = new Point();
		camera.x = 0;
		camera.y = -1000 - HXP.halfHeight;
		
		cookieMagicDelay = 10;
		add(cookieMagic);
		add(new Cookie(1000, 3800, new Image("graphics/normalcookie.png")));
		
		GV.PARTICLE_EMITTER = new ParticleController();
		add(GV.PARTICLE_EMITTER);
		
		for (i in 0...30)
		{
			spawn();
		}
	}
	public function createMap()
	{
	  // create the map
	  var e = new TmxEntity("maps/world10.tmx");

	  // load layers named bottom, main, top with the appropriate tileset
	  e.loadGraphic("graphics/milktileset.png", ["background", "background2", "walls"]);

	  // loads a grid layer named collision and sets the entity type to walls
	  e.loadMask("walls", "terrain");

	  add(e);
	}

	public override function update()
	{
		spawnTimer -= HXP.elapsed;
		if (spawnTimer < 0)
		{
			spawn();
		}
		if (cookieMagicDelay <= 0)
		{
			cookieMagic.explosion(1048, 3832, 15);
			cookieMagicDelay = 10;
		}
		cookieMagicDelay--;
		super.update();
	}

	private function spawn()
	{
		var enemyY = Math.random() * 4000;
		var enemyX = Math.random() * 2000;
		var randomSpawn:Int = Std.random(100);
			if (randomSpawn <= 20)
			{
				add(new entities.Cow(enemyX, enemyY));
			}
			else if (randomSpawn <= 39)
			{
				add(new entities.Kitten(enemyX, enemyY));
			}
			else if (randomSpawn <= 59)
			{
				add(new entities.MindControlCow(enemyX, enemyY));
			}
			else if (randomSpawn <= 79)
			{
				add(new entities.MindControlKitten(enemyX, enemyY));
			}
			else if (randomSpawn <= 99)
			{
				add(new entities.Bacteria(enemyX, enemyY));
			}
		spawnTimer = 0.3; // every second
	}
	
	public var cookieMagicDelay:Int;
	private var spawnTimer:Float;
	public var cookieMagic:ParticleController = new ParticleController();
}