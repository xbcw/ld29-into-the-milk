package entities;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.graphics.Text;
import com.haxepunk.masks.Pixelmask;

class Player extends Entity
{
	public function new(x:Float, y:Float)
	{
		super(x, y);
		graphic = graphicShipRight;
		width = 128;
		height = 64;
		//mask = new Pixelmask("graphics/bus2.png", -64, -32);
		setHitbox(128, 64);
		
		Input.define("up", [Key.UP, Key.W]);
		Input.define("down", [Key.DOWN, Key.S]);
		Input.define("right", [Key.RIGHT, Key.A]);
		Input.define("left", [Key.LEFT, Key.D]);
		Input.define("shoot", [Key.SPACE]);
		Input.define("debugUI", [Key.H]);
		
		velocityX = 0;
		velocityY = 0;
		type = "player";
		//layer = 99;
		
		gravityMultiplier = 7;
		
		worldLevel = 0;
		
		shootDelay = 5;
		
		worldName = new Text("World: ?");
		initUI();
		showUI = true;
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
			//this.graphic = graphicShipRight;
			set_graphic(graphicShipRight);
		}
		
		if (Input.check("left"))
		{
			accelerationX = -1;
			//this.graphic = graphicShipLeft;
			set_graphic(graphicShipLeft);
		}
		
	    if ((Input.mouseDown || Input.check("shoot")) && shootDelay <= 0)
		{
			scene.add(new Bullet(x+width, y + halfHeight));
			shootDelay = 5;
		}
		
		if (Input.pressed("debugUI"))
		{
			if (showUI == true)
			{
				showUI = false;
			}
			else 
			{
				showUI = true;
			}
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
	
	private function initUI()
	{
		showUI = false;
		
		var uiHeight:Float = 100;
		var uiWidth:Float = 100;
		var uiSpacing = 25;
		
		ui_worldText = new Text(worldName.text); 
		ui_worldText.color = 0x00ccff; 
		ui_worldText.size = 28; 
		ui_worldText.x = uiWidth; 
		ui_worldText.y = uiHeight + 0 * uiSpacing; 
		addGraphic(ui_worldText);
		
		ui_xText = new Text("x: " + this.x);
		ui_xText.color = 0x00ccff; 
		ui_xText.size = 28; 
		ui_xText.x = uiWidth; 
		ui_xText.y = uiHeight + 1*uiSpacing; 
		addGraphic(ui_xText);
		
		ui_yText = new Text("x: " + this.x);
		ui_yText.color = 0x00ccff; 
		ui_yText.size = 28; 
		ui_yText.x = uiWidth; 
		ui_yText.y = uiHeight + 2*uiSpacing; 
		addGraphic(ui_yText);
		
		ui_velocityXText = new Text("X Velocity: " + this.velocityX);
		ui_velocityXText.color = 0x00ccff; 
		ui_velocityXText.size = 28; 
		ui_velocityXText.x = uiWidth; 
		ui_velocityXText.y = uiHeight + 3*uiSpacing; 
		addGraphic(ui_velocityXText);
		
		ui_velocityYText = new Text("Y Velocity: " + this.velocityY);
		ui_velocityYText.color = 0x00ccff; 
		ui_velocityYText.size = 28; 
		ui_velocityYText.x = uiWidth; 
		ui_velocityYText.y = uiHeight + 4*uiSpacing; 
		addGraphic(ui_velocityYText); 
	}
	
	public function updateUI()
	{
		ui_worldText.text = worldName.text;
		ui_xText.text = "x: " + this.x;
		ui_yText.text = "y: " + this.y;
		ui_velocityYText.text = "Y Velocity: " + this.velocityY;
		ui_velocityXText.text = "X Velocity: " + this.velocityX;
	}
	
	public function hideUI()
	{
		ui_worldText.text = "";
		ui_xText.text = "";
		ui_yText.text = "";
		ui_velocityXText.text = "";
		ui_velocityYText.text = "";
	}
	
	public override function update()
	{
		if (showUI == true)
		{
			updateUI();
		}
		else
		{
			hideUI();
		}
		handleInput();
		if (y < 144)
		{
			gravityMultiplier = 7;
		}
		else if (y < 160)
		{
			gravityMultiplier = 2;
		}
		else
		{
			gravityMultiplier = 1;
		}
		move();

		var e:Entity = collide("terrain", x + velocityX, y);
		if (e == null)
		{
			moveBy(velocityX, 0);
			HXP.world.camera.x += velocityX;
		}
		else
		{
			// trace("Colliding with terrain on X");
			moveBy(0, 0);
		}
		
		var e:Entity = collide("terrain", x, y + velocityY + gravity);
		if (e == null)
		{
			moveBy(0, velocityY + (gravityMultiplier * gravity));
			HXP.world.camera.y += (velocityY + (gravityMultiplier * gravity));
		}
		else
		{
			// trace("Colliding with terrain on Y");
			moveBy(0,0);
		}
		
		var e:Entity = collide("cookie", x, y);
		if (e != null)
		{
			trace("collided with Cookie");
			HXP.world.removeAll;
			if (worldLevel == 1) 
			{
				HXP.world = new worlds.World2(new entities.Player(HXP.halfWidth, HXP.halfHeight));
			}
			if (worldLevel == 2)
			{
				HXP.world = new worlds.World2(new entities.Player(HXP.halfWidth, HXP.halfHeight));
			}
		}
		super.update();
	}

	private var velocityX:Float;
	private var velocityY:Float;
	private var shootDelay:Int;
	private var accelerationX:Float;
	private var accelerationY:Float;
	private var rockets:Float;
	
	private var gravityMultiplier:Int;
	
	private var ui_worldText:Text;
	private var ui_xText:Text;
	private var ui_yText:Text;
	private var ui_velocityXText:Text;
	private var ui_velocityYText:Text;
	
	public var worldName:Text;
	
	private var showUI:Bool;
	
	public var graphicShipRight:Image = new Image("graphics/Milkshipright.png");
	public var graphicShipLeft:Image = new Image("graphics/Milkshipleft.png");
	
	public var worldLevel:Int;
	
	private static inline var maxVelocity:Float = 8;
	private static inline var speed:Float = 5;
	private static inline var drag:Float = 1;
	private static inline var gravity:Float = 3;
}