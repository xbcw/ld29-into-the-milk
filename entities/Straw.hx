package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.masks.Pixelmask;
import com.haxepunk.utils.Key;
import com.haxepunk.utils.Input;
import com.haxepunk.World;
import com.haxepunk.HXP;

class Straw extends Terrain
{
	public function new(x:Int, y:Int)
	{
		super(x, y);
		graphic = new Image("graphics/drinkingstraw.png");
		//graphic.x = -140;
		//graphic.y = -200;
		//mask = new Pixelmask("graphics/drinkingstraw.png");
	}
	
	public override function update()
	{
		super.update();
	}
}