package nme;


import openfl.Assets;


class AssetData {
	//
	public static var className:Map<String, Dynamic> = new Map<String, Dynamic>();
	public static var library:Map<String, LibraryType> = new Map<String, LibraryType>();
	public static var path:Map<String, String> = new Map<String, String>();
	public static var type:Map<String, AssetType> = new Map<String, AssetType>();
	//
	private static var initialized:Bool = false;
	
	public static function initialize ():Void {
		if (!initialized) {
			path.set("gfx/debug/console_debug.png", "gfx/debug/console_debug.png");
			type.set("gfx/debug/console_debug.png", "image".toUpperCase());
			path.set("gfx/debug/console_hidden.png", "gfx/debug/console_hidden.png");
			type.set("gfx/debug/console_hidden.png", "image".toUpperCase());
			path.set("gfx/debug/console_logo.png", "gfx/debug/console_logo.png");
			type.set("gfx/debug/console_logo.png", "image".toUpperCase());
			path.set("gfx/debug/console_output.png", "gfx/debug/console_output.png");
			type.set("gfx/debug/console_output.png", "image".toUpperCase());
			path.set("gfx/debug/console_pause.png", "gfx/debug/console_pause.png");
			type.set("gfx/debug/console_pause.png", "image".toUpperCase());
			path.set("gfx/debug/console_play.png", "gfx/debug/console_play.png");
			type.set("gfx/debug/console_play.png", "image".toUpperCase());
			path.set("gfx/debug/console_step.png", "gfx/debug/console_step.png");
			type.set("gfx/debug/console_step.png", "image".toUpperCase());
			path.set("gfx/debug/console_visible.png", "gfx/debug/console_visible.png");
			type.set("gfx/debug/console_visible.png", "image".toUpperCase());
			path.set("gfx/preloader/haxepunk.png", "gfx/preloader/haxepunk.png");
			type.set("gfx/preloader/haxepunk.png", "image".toUpperCase());
			className.set ("font/04B_03__.ttf", nme.NME_font_04b_03___ttf);
			type.set("font/04B_03__.ttf", "font".toUpperCase());
			path.set("graphics/block.png", "graphics/block.png");
			type.set("graphics/block.png", "image".toUpperCase());
			path.set("graphics/bus.png", "graphics/bus.png");
			type.set("graphics/bus.png", "image".toUpperCase());
			path.set("graphics/bus2.png", "graphics/bus2.png");
			type.set("graphics/bus2.png", "image".toUpperCase());
			path.set("graphics/cow.png", "graphics/cow.png");
			type.set("graphics/cow.png", "image".toUpperCase());
			path.set("graphics/cow2.png", "graphics/cow2.png");
			type.set("graphics/cow2.png", "image".toUpperCase());
			path.set("graphics/drinkingstraw.jpg", "graphics/drinkingstraw.jpg");
			type.set("graphics/drinkingstraw.jpg", "image".toUpperCase());
			path.set("graphics/drinkingstraw.png", "graphics/drinkingstraw.png");
			type.set("graphics/drinkingstraw.png", "image".toUpperCase());
			path.set("graphics/glass.png", "graphics/glass.png");
			type.set("graphics/glass.png", "image".toUpperCase());
			path.set("graphics/glassbottom.png", "graphics/glassbottom.png");
			type.set("graphics/glassbottom.png", "image".toUpperCase());
			path.set("graphics/glassside.png", "graphics/glassside.png");
			type.set("graphics/glassside.png", "image".toUpperCase());
			path.set("graphics/glasssquare.png", "graphics/glasssquare.png");
			type.set("graphics/glasssquare.png", "image".toUpperCase());
			path.set("graphics/kitty.png", "graphics/kitty.png");
			type.set("graphics/kitty.png", "image".toUpperCase());
			path.set("graphics/kitty64.png", "graphics/kitty64.png");
			type.set("graphics/kitty64.png", "image".toUpperCase());
			path.set("graphics/milk-vector.jpg", "graphics/milk-vector.jpg");
			type.set("graphics/milk-vector.jpg", "image".toUpperCase());
			path.set("graphics/milkbackground.png", "graphics/milkbackground.png");
			type.set("graphics/milkbackground.png", "image".toUpperCase());
			path.set("graphics/milktileset.png", "graphics/milktileset.png");
			type.set("graphics/milktileset.png", "image".toUpperCase());
			path.set("graphics/Moocow.png", "graphics/Moocow.png");
			type.set("graphics/Moocow.png", "image".toUpperCase());
			path.set("graphics/moocowleft.png", "graphics/moocowleft.png");
			type.set("graphics/moocowleft.png", "image".toUpperCase());
			path.set("graphics/plane.png", "graphics/plane.png");
			type.set("graphics/plane.png", "image".toUpperCase());
			path.set("graphics/player.png", "graphics/player.png");
			type.set("graphics/player.png", "image".toUpperCase());
			className.set ("font/04B_03__.ttf", nme.NME_font_5);
			type.set("font/04B_03__.ttf", "font".toUpperCase());
			path.set("maps/world_1_1.tmx", "maps/world_1_1.tmx");
			type.set("maps/world_1_1.tmx", "binary".toUpperCase());
			path.set("maps/world_1_2.tmx", "maps/world_1_2.tmx");
			type.set("maps/world_1_2.tmx", "binary".toUpperCase());
			
			
			initialized = true;
		}
	}
}

class NME_font_04b_03___ttf extends flash.text.Font { }
class NME_font_5 extends flash.text.Font { }

