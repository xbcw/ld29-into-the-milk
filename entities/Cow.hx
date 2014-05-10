package entities;

import com.haxepunk.graphics.Image;
import com.haxepunk.masks.Pixelmask;
import com.haxepunk.Entity;
import com.haxepunk.HXP;
import entities.GV.PARTICLE_EMITTER;

class Cow extends Enemy
{
    public function new(x:Float, y:Float)
    {
        super(x, y);
		var e:Entity = collide("terrain", x, y);
		if (e != null)
		{
			scene.remove(this);
		}
        graphic = graphicCowRight;
		graphic.x = -18;
		graphic.y = -6;
        setHitbox(104, 57);
        type = "enemy";
		velocityX = Math.random() * 2.0;
		velocityY = 0;
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
			gravity = 5;
		}
		else
		{
			gravity = 4;
		}		
		var e:Entity = collide("terrain", x, y + velocityY + gravity);
		if (e == null)
		{
			moveBy(0, velocityY + gravity);
		}
		else
		{
			// trace("Colliding with terrain on X");
			if (stuck == true)
			{
				PARTICLE_EMITTER.explosion(x + Std.random(20), y + Std.random(20), 20);
				PARTICLE_EMITTER.explosion(x-Std.random(20), y-Std.random(20), 20);
				PARTICLE_EMITTER.explosion(x, y, 20);
				scene.remove(this);
			}
			moveBy(0, 0);
			stuck = true;
		}
		
		var e:Entity = collide("terrain", x + velocityX, y);
		if (e == null)
		{
			if (velocityX > 0)
			{
				graphic = graphicCowRight;
				graphic.x = -18;
				graphic.y = -6;
			}
			else if (velocityX < 0)
			{
				graphic = graphicCowLeft;
				graphic.x = -18;
				graphic.y = -6;
			}
			moveBy(velocityX, 0);
			stuck = false;
		}
		else
		{
			// trace("Colliding with terrain on X");
			if (stuck == true)
			{
				PARTICLE_EMITTER.explosion(x + Std.random(20), y + Std.random(20), 15);
				PARTICLE_EMITTER.explosion(x-Std.random(20), y-Std.random(20), 15);
				PARTICLE_EMITTER.explosion(x, y, 20);
				scene.remove(this);
			}
			moveBy(0, 0);
			velocityX = -velocityX;
			stuck = true;
		}
		
		if (ttl <= 0 )
		{
			PARTICLE_EMITTER.explosion(x + Std.random(20), y + Std.random(20), 15);
			PARTICLE_EMITTER.explosion(x-Std.random(20), y-Std.random(20), 15);
			PARTICLE_EMITTER.explosion(x, y, 20);
			scene.remove(this);
		}
		if (ttl % 500 == 0)
		{
			velocityX = Math.random()* HXP.choose(1, 1, 1, 1, 1, 1, 1, 10);
			velocityY = 0;
		}
		ttl--;
    }
	
	private var ttl:Int;
	private var velocityX:Float;
	private var velocityY:Float;
	private var gravity:Float = 4;
	private var stuck:Bool;
	private var graphicCowRight:Image = new Image("graphics/moocowright.png");
	private var graphicCowLeft:Image = new Image("graphics/moocowleft.png");
}