package entities;

import com.haxepunk.graphics.Image;

class Cow extends Enemy
{
    public function new(x:Float, y:Float)
    {
        super(x, y);

        graphic = new Image("graphics/cow.png");
        setHitbox(64, 32);
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