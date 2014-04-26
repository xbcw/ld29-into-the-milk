package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Key;
import com.haxepunk.utils.Input;

class Block extends Entity
{
	public function new(x:Int, y:Int)
	{
		super(x, y);
		
		graphic = new Image("graphics/block.png");
	}
	
	public override function update()
	{
		super.update();
	}
}