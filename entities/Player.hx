package entities;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.graphics.Text;
import com.haxepunk.masks.Pixelmask;
import worlds.*;
import flash.text.TextFormatAlign;

class Player extends Entity
{
	public function new(x:Float, y:Float)
	{
		super(x, y);
		destroyed = false;
		graphic = graphicShipRight;
		facing = "right";
		
		width = 128;
		height = 64;
		//mask = new Pixelmask("graphics/bus2.png", -64, -32);
		setHitbox(128, 64);
		
		Input.define("up", [Key.UP, Key.W]);
		Input.define("down", [Key.DOWN, Key.S]);
		Input.define("right", [Key.RIGHT, Key.D]);
		Input.define("left", [Key.LEFT, Key.A]);
		Input.define("shoot", [Key.TAB]);
		Input.define("debugUI", [Key.H]);
		Input.define("restart", [Key.R, Key.SPACE]);
		Input.define("next_world", [Key.N]);
		Input.define("previous_world", [Key.P]);
		
		velocityX = 0;
		velocityY = 0;
		type = "player";
		//layer = 99;
		
		gravityMultiplier = 7;
		
		worldLevel = 0;
		
		shootDelay = 5;
		
		maxHealth = 6;
		health = maxHealth;
		//updateHealthBar();
		 
		worldTextUpdateCounter = 150;
		textUpdate();
		worldName = new Text("World: ?");
		initUI();
		showUI = false;
		
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
		
		if (Input.check("right") && destroyed == false)
		{
			accelerationX = 1;
			//this.graphic = graphicShipRight;
			set_graphic(graphicShipRight);
			if (showUI == true)
			{
				initUI();
			}
			//updateHealthBar();
			if (worldTextUpdateCounter > 0)
			{
				textUpdate();
			}
			facing = "right";
		}
		
		if (Input.check("left") && destroyed == false)
		{
			accelerationX = -1;
			//this.graphic = graphicShipLeft;
			set_graphic(graphicShipLeft);
			if (showUI == true) 
			{
				initUI();
			}
			//updateHealthBar();
			if (worldTextUpdateCounter > 0)
			{
				textUpdate();
			}
			facing = "left";
		}
		
	    if ((Input.mouseDown || Input.check("shoot")) && shootDelay <= 0 && destroyed == false)
		{
			scene.add(new Bullet(x + halfWidth, y + halfHeight,20,Std.int(HXP.angle(this.x, this.y, world.mouseX, world.mouseY)+0.5)));
			shootDelay = 15;
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
		
		if (Input.pressed("restart"))
		{
			restart();
		}
		
		if (Input.pressed("next_world"))
		{
			worldLevel++;
			loadWorld();
		}
		
		if (Input.pressed("previous_world"))
		{
			if (worldLevel > 1)
			{
				worldLevel--;
			}
			loadWorld();
		}
/*		if (destroyed == false)
		{
			updateHealthBar();
		}*/
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
	
	private function updateHealthBar()
	{		
		healthBarGraphicBorder = Image.createRect(122, 12, 0x000000);
		healthBarGraphicBorder.x = -1;
		healthBarGraphicBorder.y = -33;
		addGraphic(healthBarGraphicBorder);
		
		healthBarGraphic = Image.createRect(Std.int(120*(health/maxHealth)+0.5), 10, 0x00CC00);
		healthBarGraphic.y = -32;
		addGraphic(healthBarGraphic);
	}
	
	private function initUI()
	{
		var uiHeight:Float = -365;
		var uiWidth:Float = 325;
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
		
		hideUI();
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
	
	public function textUpdate()
	{
		switch (worldLevel)
		{
			case 1:
				worldText.text = "World 1";
				worldText2.text = "Into the Milk Glass";
			case 2:
				worldText.text = "World 2";
				worldText2.text = "Chocolate Rain";
			case 3:
				worldText.text = "World 3";
				worldText2.text = "Cookie Wonderland";
			case 4:
				worldText.text = "World 4";
				worldText2.text = "The Core";
			case 5:
				worldText.text = "World 5";
				worldText2.text = "Deeper Down";
			case 6:
				worldText.text = "World 6";
				worldText2.text = "Getting Closer";
			case 7:
				worldText.text = "World 7";
				worldText2.text = "Chocolate Storm";
			case 8:
				worldText.text = "World 8";	
				worldText2.text = "Cosmic Candy Crunch";
			case 9:
				worldText.text = "World 9";
				worldText2.text = "The Core Revisited";
			case 10:
				worldText.text = "World 10";
				worldText2.text = "Chocolate Q.E.D.";
			case 11:
				worldText.text = "";
				worldText2.text = "";
			default:
				worldText.text = "World 1";
				worldText2.text = "Into the Milk Glass";				
		}
		worldText.align = CENTER;
		worldText.color = 0xFF0000; 
		worldText.size = 64; 
		worldText.x = HXP.screen.x - 95; 
		worldText.y = HXP.screen.y - 200;
		addGraphic(worldText);
		
		worldText2.align = CENTER;
		worldText2.color = 0xFF0000; 
		worldText2.size = 64; 
		worldText2.x = HXP.screen.x - 220; 
		worldText2.y = HXP.screen.y - 150;
		addGraphic(worldText2);
	}
	
	public function loadWorld()
	{
		switch (worldLevel)
		{
			case 1:
				HXP.world = new worlds.World1(new entities.Player(HXP.halfWidth, HXP.halfHeight));
			case 2:
				HXP.world = new worlds.World2(new entities.Player(HXP.halfWidth, HXP.halfHeight));
			case 3:
				HXP.world = new worlds.World3(new entities.Player(HXP.halfWidth, HXP.halfHeight));
			case 4:
				HXP.world = new worlds.World4(new entities.Player(HXP.halfWidth, HXP.halfHeight));
			case 5:
				HXP.world = new worlds.World5(new entities.Player(HXP.halfWidth, HXP.halfHeight));
			case 6:
				HXP.world = new worlds.World6(new entities.Player(HXP.halfWidth, HXP.halfHeight));
			case 7:
				HXP.world = new worlds.World7(new entities.Player(HXP.halfWidth, HXP.halfHeight));
			case 8:
				HXP.world = new worlds.World8(new entities.Player(HXP.halfWidth, HXP.halfHeight));				
			case 9:
				HXP.world = new worlds.World9(new entities.Player(HXP.halfWidth, HXP.halfHeight));
			case 10:
				HXP.world = new worlds.World10(new entities.Player(HXP.halfWidth, HXP.halfHeight));
			case 11:
				HXP.world = new worlds.WorldWin(this);
			default:
				worldLevel = 1;
				HXP.world = new World1(new Player(HXP.halfWidth, HXP.halfHeight));
		}
			
	}
	
	public function restart()
	{
		//trace("restart");
		HXP.world.removeAll;
		loadWorld();
	}
	
	public override function update()
	{
		if (worldTextUpdateCounter > 0)
		{
			textUpdate();
			worldTextUpdateCounter--;
		}
		handleInput();
		if (destroyed == false) 
		{
			if (showUI == true)
			{
				updateUI();
			}
			else
			{
				//hideUI();
			}
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
			
			var e:Entity = collide("enemy", x + velocityX, y + velocityY);
			if (e != null )
			{
				GV.PARTICLE_EMITTER.explosion(x + halfWidth, y + halfHeight, 5);
				health -= 2;
				velocityX = -velocityX*2;
				velocityY = -velocityY * 2;
				
				if (health <= 0)
				{
					GV.PARTICLE_EMITTER.explosion(x + halfWidth, y + halfHeight, 50);
					destroyed = true;
					graphic = null;
					this.type = "player_dead";
					gravity = 0;
					velocityX = 0;
					velocityY = 0;
					
					gameOverText = new Text("YOU DIED!  Press 'R' to Restart"); 
					gameOverText.color = 0xFF0000; 
					gameOverText.size = 32; 
					gameOverText.x = -150; 
					gameOverText.y = -100;
					addGraphic(gameOverText);
					//scene.remove(this);
				}
			}
			
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
				//trace("collided with Cookie");
				worldLevel++;
				HXP.world.removeAll;
				loadWorld();
			}
		}
		else
		{
			gameOverText.text = "YOU DIED!  Press 'SPACEBAR' to Restart";
			addGraphic(gameOverText);
		}
		super.update();
		//trace("Destroyed: " + destroyed);
	}

	private var worldTextUpdateCounter:Int;
	
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
	
	public var gameOverText:Text;
	
	public var worldName:Text;
	
	private var showUI:Bool;
	
	public var graphicShipRight:Image = new Image("graphics/Milkshipright.png");
	public var graphicShipLeft:Image = new Image("graphics/Milkshipleft.png");
	
	public var worldLevel:Int;
	
	public var healthBarGraphic:Image;
	public var healthBarGraphicBorder:Image;
	public var health:Int;
	public var maxHealth:Int;
	
	public var worldText:Text = new Text("test");
	public var worldText2:Text = new Text("test2");
	
	public var destroyed:Bool;
	
	public var facing:String;
	
	private static inline var maxVelocity:Float = 8;
	private static inline var speed:Float = 5;
	private static inline var drag:Float = 1;
	public var gravity:Float = 3;
}