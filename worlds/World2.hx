package worlds;

import com.haxepunk.graphics.Image;
import com.haxepunk.World;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Backdrop;
import com.haxepunk.Entity;
import com.haxepunk.tmx.TmxEntity;
import com.haxepunk.tmx.TmxMap;
import entities.Cookie;
import flash.geom.Point;

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
		
		player.worldName.text = "World 2";
		player.worldLevel = 2;
		createMap();
		
		add(player);
		player.moveTo(HXP.halfWidth, -1000);
		camera = new Point();
		camera.x = 0;
		camera.y = -1000 - HXP.halfHeight;
		
		add(new entities.Block( -1000, -1000));
		add(new entities.Straw(1000, 1000));
		
		add(new Cookie(500, 500, new Image("graphics/normalcookie.png")));
		
		spawn(); // create our first enemy
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
/*	public function createMap()
	{
		// create the map
		var map = TmxMap.loadFromFile("maps/world_1_2.tmx");

		// access map properties
		var prop = map.properties.resolve("myCustomProperties");

		// go through the list of objects in an object layer
		for(object in map.getObjectGroup("myObjectsLayer").objects)
		{
			// you can access:
			object.name; 
			object.type;

			object.x;
			object.y;

			object.width;
			object.height;

			// to read custom properties
			object.custom.resolve("myProp");
		}

		// create the map
		var e = new TmxEntity(map);

		// load layers named bottom, main, top with the appropriate tileset
		e.loadGraphic("graphics/block.png", ["bottom", "main", "top"]);

		// loads a grid layer named collision and sets the entity type to walls
		e.loadMask("collision", "walls");

		add(e);
	}*/
	
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
		var cowy = Math.random() * HXP.height * 3;
		var cowx = Math.random() * HXP.width * 3;
		var kitteny = Math.random() * HXP.height * 3;
		var kittenx = Math.random() * HXP.width * 3;
		add(new entities.Cow(cowx, cowy));
		add(new entities.Kitten(kittenx, kitteny));
		spawnTimer = 0.75; // every second
	}

	private var spawnTimer:Float;
}