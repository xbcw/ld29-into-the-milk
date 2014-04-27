package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.masks.Pixelmask;
import com.haxepunk.utils.Key;
import com.haxepunk.utils.Input;
import assets.Assets;

class Block extends Terrain
{
	public function new(x:Int, y:Int)
	{
		super(x, y);
		
		graphic = new Image(Assets.GRAPHIC_TERRAIN_BLOCK);
		graphic.x = -16;
		graphic.y = -16;
		mask = new Pixelmask(Assets.GRAPHIC_TERRAIN_BLOCK, -16, -16);
	}
	
	public override function update()
	{
		super.update();
	}
}