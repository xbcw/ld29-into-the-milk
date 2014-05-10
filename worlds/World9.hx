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

class World9 extends World
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
		
		player.worldLevel = 9;
		player.worldName.text = "World 9";
		createMap();
		
		add(player);
		player.moveTo(HXP.halfWidth, -1000);
		camera = new Point();
		camera.x = 0;
		camera.y = -1000 - HXP.halfHeight;
		
		add(new Cookie(1175, 1225, new Image("graphics/pbcookie.png")));
		
		GV.PARTICLE_EMITTER = new ParticleController();
		add(GV.PARTICLE_EMITTER);
		
		for (i in 0...15)
		{
			spawn();
		}
	}
	public function createMap()
	{
	  // create the map
	  var e = new TmxEntity("maps/world9.tmx");

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
		
		super.update();
	}

	private function spawn()
	{
		var enemyY = Math.random() * 4000;
		var enemyX = Math.random() * 2000;
		var randomSpawn:Int = Std.random(100);
			if (randomSpawn <= 37)
			{
				add(new entities.Cow(enemyX, enemyY));
			}
			else if (randomSpawn <= 69)
			{
				add(new entities.Kitten(enemyX, enemyY));
			}
			else if (randomSpawn <= 79)
			{
				add(new entities.MindControlCow(enemyX, enemyY));
			}
			else if (randomSpawn <= 89)
			{
				add(new entities.MindControlKitten(enemyX, enemyY));
			}
			else if (randomSpawn <= 99)
			{
				add(new entities.Bacteria(enemyX, enemyY));
			}
		spawnTimer = 0.4; // every second
	}

	private var spawnTimer:Float;
}