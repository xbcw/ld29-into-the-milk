package entities;

import com.haxepunk.graphics.Image;
import com.haxepunk.masks.Pixelmask;
import com.haxepunk.Entity;
import com.haxepunk.HXP;

class MindControlCow extends Cow
{
    override public function new(x:Float, y:Float)
	{
		super(x, y);
		graphicCowRight = new Image("graphics/mindcontrolmoocowright.png");
		graphicCowLeft = new Image("graphics/mindcontrolmoocowleft.png");
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
				GV.PARTICLE_EMITTER.explosion(x + Std.random(20), y + Std.random(20), 20);
				GV.PARTICLE_EMITTER.explosion(x-Std.random(20), y-Std.random(20), 20);
				GV.PARTICLE_EMITTER.explosion(x, y, 20);
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
				GV.PARTICLE_EMITTER.explosion(x + Std.random(20), y + Std.random(20), 20);
				GV.PARTICLE_EMITTER.explosion(x-Std.random(20), y-Std.random(20), 20);
				GV.PARTICLE_EMITTER.explosion(x, y, 20);
				scene.remove(this);
			}
			moveBy(0, 0);
			velocityX = -velocityX;
			stuck = true;
		}
		
		if (ttl <= 0 )
		{
			GV.PARTICLE_EMITTER.explosion(x + Std.random(20), y + Std.random(20), 20);
			GV.PARTICLE_EMITTER.explosion(x-Std.random(20), y-Std.random(20), 20);
			GV.PARTICLE_EMITTER.explosion(x, y, 20);
			scene.remove(this);
		}
		if (ttl % 250 == 0)
		{
			velocityX = Math.random()* HXP.choose(1, 10);
			velocityY = 0;
		}
		ttl--;
    }
}