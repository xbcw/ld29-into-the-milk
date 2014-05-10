package entities;

import com.haxepunk.graphics.Image;
import com.haxepunk.masks.Pixelmask;
import com.haxepunk.Entity;
import com.haxepunk.HXP;

class MindControlKitten extends Kitten
{
    override public function new(x:Float, y:Float)
	{
		super(x, y);
		graphicKittyRight = new Image("graphics/jetpackkittyright.png");
		graphicKittyLeft = new Image("graphics/jetpackkittyleft.png");
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
				graphic = graphicKittyRight;
				graphic.x = -8;
				graphic.y = -10;
			}
			else if (velocityX < 0)
			{
				graphic = graphicKittyLeft;
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
		if (ttl % 50 == 0)
		{
			velocityX = Math.random() * 5.0;
			velocityY = Math.random() * 5.0 * HXP.choose(-1, 1);
		}
		ttl--;
    }
}