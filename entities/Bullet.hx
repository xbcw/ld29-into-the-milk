package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class Bullet extends Entity
{
    public function new(x:Float, y:Float)
    {
        super(x, y);

        graphic = Image.createRect(16, 4,0x000000);
        setHitbox(16, 4);
        type = "bullet";
		ttl = 100;
    }

    public override function moveCollideX(e:Entity)
    {
		if (e.type == "enemy")
		{
			scene.remove(e);
		}
        scene.remove(this);
        return true;
    }

    public override function update()
    {
        moveBy(20, 0, ["enemy", "terrain"]);
		
		ttl--;
		if (ttl <= 0)
		{
			scene.remove(this);
		}
		
        super.update();
    }
	
	private var ttl:Int;
}