/*package entities;

import com.haxepunk.graphics.Image;
import com.haxepunk.masks.Pixelmask;

class Cow extends Enemy
{
    public function new(x:Float, y:Float)
    {
        super(x, y);

        graphic = new Image("graphics/moocowleft.png");
		graphic.x = -18;
		graphic.y = -6;
		//mask = new Pixelmask("graphics/moocowleft.png", -32, -16);
        setHitbox(104, 57);
        type = "enemy";
    }

    public override function update()
    {
        moveBy( -5, 0, "player");
		
		if ( this.x < -32)
		{
			scene.remove(this);
		}
    }
}*/

package entities;

import com.haxepunk.graphics.Image;
import com.haxepunk.masks.Pixelmask;
import com.haxepunk.Entity;
import com.haxepunk.HXP;

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