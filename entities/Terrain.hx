package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Key;
import com.haxepunk.utils.Input;

class Terrain extends Entity
{
	public function new(x:Int, y:Int)
	{
		super(x, y);
		
		graphic = new Image("graphics/block.png");
		type = "terrain";
	}
	
	public override function update()
	{
		super.update();
	}
}