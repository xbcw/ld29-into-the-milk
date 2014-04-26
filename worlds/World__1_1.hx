package worlds;

import com.haxepunk.World;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Backdrop;
import com.haxepunk.Entity;
import entities.Straw;

class World_1_1 extends World
{
	public function new()
	{
		super();
		var b:Backdrop = new Backdrop("graphics/milkbackground.png", true, true);
		b.scrollX = 0.5;
		b.scrollY = 0.5;
		var e:Entity = new Entity();
		e.graphic = b;
		add(e);
		
		add(new entities.Player(HXP.halfWidth, HXP.halfHeight));
		add(new Straw(1000, 1000));
		spawn(); // create our first enemy
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
		var y = Math.random() * HXP.height;
		add(new entities.Cow(HXP.width, y));
		add(new entities.Kitten(HXP.width, y + 50));
		spawnTimer = 1; // every second
	}

	private var spawnTimer:Float;
}