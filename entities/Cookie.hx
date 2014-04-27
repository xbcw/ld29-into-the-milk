package entities;

import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import com.haxepunk.Entity;

class Cookie extends Entity
{
	public function new(x:Float, y:Float, cookieGraphic:Image)
	{
		super(x, y);
		graphic = cookieGraphic;
		graphic.x = graphic.y = -16;
		setHitbox(96, 96);
		type = "cookie";
	}
}