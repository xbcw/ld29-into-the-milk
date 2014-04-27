package entities;

import com.haxepunk.graphics.Image;
import com.haxepunk.masks.Pixelmask;
import com.haxepunk.Entity;
import com.haxepunk.HXP;

class Kitten extends Enemy
{
    public function new(x:Float, y:Float)
    {
        super(x, y);
		var e:Entity = collide("terrain", x, y);
		if (e != null)
		{
			scene.remove(this);
		}
        graphic = graphicKittyRight;
		graphic.x = -8;
		graphic.y = -10;
		// mask = new Pixelmask("graphics/kitty.png", -32, -32);
        setHitbox(48, 52);
        type = "enemy";
		velocityX = Math.random() * 4.0;
		velocityY = Math.random() * 4.0;
		stuck = false;
		ttl = 3000;
		
    }

    public override function update()
    {
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
				scene.remove(this);
			}
			moveBy(0, 0);
			velocityX = -velocityX;
			stuck = true;
		}
		
		if ( this.x < -32 || ttl <= 0 )
		{
			scene.remove(this);
		}
		if (ttl % 250 == 0)
		{
			velocityX = Math.random() * 4.0;
			velocityY = Math.random() * 4.0 * HXP.choose(-1, 1);
		}
		ttl--;
    }
	
	private var ttl:Int;
	private var velocityX:Float;
	private var velocityY:Float;
	private var gravity:Float = 1;
	private var stuck:Bool;
	private var graphicKittyRight:Image = new Image("graphics/kittyright.png");
	private var graphicKittyLeft:Image = new Image("graphics/kittyleft.png");
}