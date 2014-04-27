package entities;

import com.haxepunk.graphics.Image;
import com.haxepunk.masks.Pixelmask;
import com.haxepunk.Entity;

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
        graphic = new Image("graphics/kitty.png");
		graphic.x = -8;
		graphic.y = -10;
		// mask = new Pixelmask("graphics/kitty.png", -32, -32);
        setHitbox(48, 52);
        type = "enemy";
		velocityX = 2;
		velocityY = 0;
		stuck = false;
		
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
		
		if ( this.x < -32)
		{
			scene.remove(this);
		}
    }
	
	private var velocityX:Float;
	private var velocityY:Float;
	private var gravity:Float = 3;
	private var stuck:Bool;
}