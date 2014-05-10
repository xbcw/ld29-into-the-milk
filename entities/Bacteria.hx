package entities;

import com.haxepunk.graphics.Image;
import com.haxepunk.masks.Pixelmask;
import com.haxepunk.Entity;
import com.haxepunk.HXP;
import entities.GV.PARTICLE_EMITTER;

class Bacteria extends Enemy
{
    public function new(x:Float, y:Float)
    {
        super(x, y);
		var e:Entity = collide("terrain", x, y);
		if (e != null)
		{
			scene.remove(this);
		}
        graphic = graphicBacteriaRight;
		graphic.x = -8;
		graphic.y = -10;
		// mask = new Pixelmask("graphics/bacteriaguy.png", -32, -32);
        setHitbox(48, 52);
        type = "enemy";
		velocityX = Math.random() * 4.0;
		velocityY = Math.random() * 4.0;
		stuck = false;
		ttl = 3000;
		
    }

    public override function update()
    {
		if (y < 128 || x < 0  || x > 2100)
		{
			gravity = 7;
		}
		else if (y < 160)
		{
			gravity = 2;
		}
		else
		{
			gravity = 1;
		}
		var e:Entity = collide("terrain", x, y + velocityY + gravity);
		if (e == null)
		{
			moveBy(0, velocityY + gravity);
		}
		else
		{
			// trace("Colliding with terrain on X");
			moveBy(0, 0);
		}
		
		var e:Entity = collide("terrain", x + velocityX, y);
		if (e == null)
		{
			if (velocityX > 0)
			{
				graphic = graphicBacteriaRight;
				graphic.x = -8;
				graphic.y = -10;
			}
			else if (velocityX < 0)
			{
				graphic = graphicBacteriaLeft;
				graphic.x = -8;
				graphic.y = -10;
			}
			moveBy(velocityX, 0);
			stuck = false;
		}
		else
		{
			// trace("Colliding with terrain on X");
			if (stuck == true)
			{
				scene.remove(this);
			}
			moveBy(0, 0);
			velocityX = -velocityX;
			stuck = true;
		}
		
		if ( this.x < -32 || ttl <= 0  || y > 4000)
		{
			PARTICLE_EMITTER.explosion(x + Std.random(20), y + Std.random(20), 20);
			PARTICLE_EMITTER.explosion(x-Std.random(20), y-Std.random(20), 20);
			PARTICLE_EMITTER.explosion(x, y, 20);
			scene.remove(this);
		}
		if (ttl % 1000 == 0)
		{
			velocityX = Math.random() * 4.0 + 2.0;
		}
		if (ttl % 10 == 0)
		{
			velocityY = Math.random() * 4.0 * HXP.choose(-1, 1);
		}
		ttl--;
    }
	
	private var ttl:Int;
	private var velocityX:Float;
	private var velocityY:Float;
	private var gravity:Float = 1;
	private var stuck:Bool;
	private var graphicBacteriaRight:Image = new Image("graphics/bacteriaguy.png");
	private var graphicBacteriaLeft:Image = new Image("graphics/bacteriaguy.png");
}