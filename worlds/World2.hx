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

class World2 extends World
{
	public function new(player:entities.Player)
	{
		super();
		var b:Backdrop = new Backdrop("graphics/milkbackground.png", true, true);
		b.scrollX = 0.5;
		b.scrollY = 0.5;
		var e:Entity = new Entity();
		e.graphic = b;
		add(e);
		
		player.worldLevel = 2;
		player.worldName.text = "World 2";
		createMap();
		
		add(player);
		player.moveTo(HXP.halfWidth, -1000);
		camera = new Point();
		camera.x = 0;
		camera.y = -1000 - HXP.halfHeight;
		
		GV.PARTICLE_EMITTER = new ParticleController();
		add(GV.PARTICLE_EMITTER);
		
		add(new entities.Straw(1000, 1000));
		
		add(new Cookie(1250, 3500, new Image("graphics/normalcookie.png")));
		
		for (i in 0...15)
		{
			spawn();
		}
	}
	public function createMap()
	{
	  // create the map
	  var e = new TmxEntity("maps/world2.tmx");

	  // load layers named bottom, main, top with the appropriate tileset
	  e.loadGraphic("graphics/milktileset.png", ["background", "walls"]);

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
		
		super.update();
	}

	private function spawn()
	{
		var enemyY = Math.random() * 4000;
		var enemyX = Math.random() * 2000;
		var randomSpawn:Int = Std.random(100);
			if (randomSpawn <= 49)
			{
				add(new entities.Cow(enemyX, enemyY));
			}
			else if (randomSpawn <= 96)
			{
				add(new entities.Kitten(enemyX, enemyY));
			}
			else if (randomSpawn <= 97)
			{
				add(new entities.MindControlCow(enemyX, enemyY));
			}
			else if (randomSpawn <= 98)
			{
				add(new entities.MindControlKitten(enemyX, enemyY));
			}
			else if (randomSpawn <= 99)
			{
				add(new entities.Bacteria(enemyX, enemyY));
			}
		spawnTimer = 0.75; // every second
	}

	private var spawnTimer:Float;
}