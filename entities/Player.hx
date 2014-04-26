package entities;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;

class Player extends Entity
{
	public function new(x:Float, y:Float)
	{
		super(x, y);
		
		graphic = Image.createRect(64, 32, 0xFFFF00);
		setHitbox(64, 32);
		
		Input.define("up", [Key.UP, Key.W]);
		Input.define("down", [Key.DOWN, Key.S]);
		Input.define("right", [Key.RIGHT, Key.A]);
		Input.define("left", [Key.LEFT, Key.D]);
		Input.define("shoot", [Key.SPACE]);
		
		velocityX = 0;
		velocityY = 0;
		type = "player";
		
		shootDelay = 5;
	}
	
	private function handleInput()
	{
		accelerationX = 0;
		accelerationY = 0;
		
		if (Input.check("up"))
		{
			accelerationY = -1;
		}
		
		if (Input.check("down"))
		{
			accelerationY = 1;
		}
		
		if (Input.check("right"))
		{
			accelerationX = 1;
		}
		
		if (Input.check("left"))
		{
			accelerationX = -1;
		}
		
	    if ((Input.mouseDown || Input.check("shoot")) && shootDelay <= 0)
		{
			scene.add(new Bullet(x + width, y + height / 2));
			shootDelay = 5;
		}
		shootDelay--;
	}
	
	private function move()
	{
		velocityX += accelerationX * speed;
		if (Math.abs(velocityX) > maxVelocity)
		{
			velocityX = maxVelocity * HXP.sign(velocityX);
		}
		
		if (velocityX < 0)
		{
			velocityX = Math.min(velocityX + drag, 0);
		}
		else if (velocityX > 0)
		{
			velocityX = Math.max(velocityX - drag, 0);
		}
		
		velocityY += accelerationY * speed;
		if (Math.abs(velocityY) > maxVelocity)
		{
			velocityY = maxVelocity * HXP.sign(velocityY);
		}
		
		if (velocityY < 0)
		{
			velocityY = Math.min(velocityY + drag, 0);
		}
		else if (velocityY > 0)
		{
			velocityY = Math.max(velocityY - drag, 0);
		}
	}
	
	public override function update()
	{
		handleInput();
		move();
		moveBy(velocityX, velocityY);
		HXP.world.camera.x += velocityX;
		HXP.world.camera.y += velocityY;
		super.update();
	}
	
	private var velocityX:Float;
	private var velocityY:Float;
	private var shootDelay:Int;
	private var accelerationX:Float;
	private var accelerationY:Float;
	
	private static inline var maxVelocity:Float = 8;
	private static inline var speed:Float = 3;
	private static inline var drag:Float = 0.4;
}