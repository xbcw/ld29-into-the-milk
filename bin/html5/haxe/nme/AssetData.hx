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
			path.set("graphics/cow.png", "graphics/cow.png");
			type.set("graphics/cow.png", "image".toUpperCase());
			path.set("graphics/drinkingstraw.jpg", "graphics/drinkingstraw.jpg");
			type.set("graphics/drinkingstraw.jpg", "image".toUpperCase());
			path.set("graphics/drinkingstraw.png", "graphics/drinkingstraw.png");
			type.set("graphics/drinkingstraw.png", "image".toUpperCase());
			path.set("graphics/kitty.png", "graphics/kitty.png");
			type.set("graphics/kitty.png", "image".toUpperCase());
			path.set("graphics/milkbackground.png", "graphics/milkbackground.png");
			type.set("graphics/milkbackground.png", "image".toUpperCase());
			path.set("graphics/plane.png", "graphics/plane.png");
			type.set("graphics/plane.png", "image".toUpperCase());
			path.set("graphics/player.png", "graphics/player.png");
			type.set("graphics/player.png", "image".toUpperCase());
			className.set ("font/04B_03__.ttf", nme.NME_font_5);
			type.set("font/04B_03__.ttf", "font".toUpperCase());
			
			
			initialized = true;
		}
	}
}

class NME_font_04b_03___ttf extends flash.text.Font { }
class NME_font_5 extends flash.text.Font { }

