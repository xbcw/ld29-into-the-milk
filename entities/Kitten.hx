package entities;

import com.haxepunk.graphics.Image;

class Kitten extends Enemy
{
    public function new(x:Float, y:Float)
    {
        super(x, y);

        graphic = new Image("graphics/kitty.png");
        setHitbox(32, 32);
        type = "enemy";
    }

    public override function update()
    {
        moveBy( -1, 0, "player");
		
		if ( this.x < -32)
		{
			scene.remove(this);
		}
    }
}