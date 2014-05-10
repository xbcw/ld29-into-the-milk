package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class Enemy extends Entity
{
    public function new(x:Float, y:Float)
    {
        super(x, y);

        graphic = Image.createRect(32, 32);
        setHitbox(32, 32);
		health = 10;
        type = "enemy";
    }

    public override function moveCollideX(e:Entity)
    {
        //scene.remove(e);
        scene.remove(this);
        return true;
    }

    public override function update()
    {
        moveBy( -5, 0, "player");
		
		if ( this.x < -96)
		{
			scene.remove(this);
		}
		
        super.update();
    }
	
	public var health:Int;
}