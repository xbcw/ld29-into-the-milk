package entities;

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
}