package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import entities.GV.PARTICLE_EMITTER;

class Bullet extends Entity
{
    public function new(x:Float, y:Float, move:Int = 20, angle:Int = 0)
    {
        super(x, y);
		this.move = move;
		this.angle = angle;
        graphic = Image.createRect(5, 5,0x000000);
        setHitbox(5, 5);
        type = "bullet";
		ttl = 100;
    }

    public override function moveCollideX(e:Entity)
    {
		if (e.type == "enemy")
		{
			PARTICLE_EMITTER.explosion(x + Std.random(20), y + Std.random(20), 20);
			PARTICLE_EMITTER.explosion(x-Std.random(20), y-Std.random(20), 20);
			PARTICLE_EMITTER.explosion(x, y, 20);
			scene.remove(e);
		}
        scene.remove(this);
        return true;
    }
	
	public override function moveCollideY(e:Entity)
    {
		if (e.type == "enemy")
		{
			PARTICLE_EMITTER.explosion(x + Std.random(20), y + Std.random(20), 15);
			PARTICLE_EMITTER.explosion(x-Std.random(20), y-Std.random(20), 15);
			PARTICLE_EMITTER.explosion(x, y, 20);
			scene.remove(e);
		}
        scene.remove(this);
        return true;
    }

    public override function update()
    {
        //moveBy(move, 0, ["enemy", "terrain"]);
		moveAtAngle(angle, move, ["enemy", "terrain"]);
		
		
		ttl--;
		if (ttl <= 0)
		{
			scene.remove(this);
		}
		
        super.update();
    }
	
	private var ttl:Int;
	private var move:Int;
	private var angle:Int;
}