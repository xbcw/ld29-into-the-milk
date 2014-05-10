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
			path.set("graphics/bacteriaguy.png", "graphics/bacteriaguy.png");
			type.set("graphics/bacteriaguy.png", "image".toUpperCase());
			path.set("graphics/block.png", "graphics/block.png");
			type.set("graphics/block.png", "image".toUpperCase());
			path.set("graphics/drinkingstraw.png", "graphics/drinkingstraw.png");
			type.set("graphics/drinkingstraw.png", "image".toUpperCase());
			path.set("graphics/full cookie crumb.png", "graphics/full cookie crumb.png");
			type.set("graphics/full cookie crumb.png", "image".toUpperCase());
			path.set("graphics/glass.png", "graphics/glass.png");
			type.set("graphics/glass.png", "image".toUpperCase());
			path.set("graphics/glassbottom.png", "graphics/glassbottom.png");
			type.set("graphics/glassbottom.png", "image".toUpperCase());
			path.set("graphics/glassside.png", "graphics/glassside.png");
			type.set("graphics/glassside.png", "image".toUpperCase());
			path.set("graphics/glasssquare.png", "graphics/glasssquare.png");
			type.set("graphics/glasssquare.png", "image".toUpperCase());
			path.set("graphics/jetpackkitty.png", "graphics/jetpackkitty.png");
			type.set("graphics/jetpackkitty.png", "image".toUpperCase());
			path.set("graphics/jetpackkittyleft.png", "graphics/jetpackkittyleft.png");
			type.set("graphics/jetpackkittyleft.png", "image".toUpperCase());
			path.set("graphics/jetpackkittyright.png", "graphics/jetpackkittyright.png");
			type.set("graphics/jetpackkittyright.png", "image".toUpperCase());
			path.set("graphics/kitty.png", "graphics/kitty.png");
			type.set("graphics/kitty.png", "image".toUpperCase());
			path.set("graphics/kittyleft.png", "graphics/kittyleft.png");
			type.set("graphics/kittyleft.png", "image".toUpperCase());
			path.set("graphics/kittyright.png", "graphics/kittyright.png");
			type.set("graphics/kittyright.png", "image".toUpperCase());
			path.set("graphics/Left cookie crumb.png", "graphics/Left cookie crumb.png");
			type.set("graphics/Left cookie crumb.png", "image".toUpperCase());
			path.set("graphics/milkbackground.png", "graphics/milkbackground.png");
			type.set("graphics/milkbackground.png", "image".toUpperCase());
			path.set("graphics/Milkshipleft.png", "graphics/Milkshipleft.png");
			type.set("graphics/Milkshipleft.png", "image".toUpperCase());
			path.set("graphics/Milkshipright.png", "graphics/Milkshipright.png");
			type.set("graphics/Milkshipright.png", "image".toUpperCase());
			path.set("graphics/milktileset.png", "graphics/milktileset.png");
			type.set("graphics/milktileset.png", "image".toUpperCase());
			path.set("graphics/mindcontrolmoocowleft.png", "graphics/mindcontrolmoocowleft.png");
			type.set("graphics/mindcontrolmoocowleft.png", "image".toUpperCase());
			path.set("graphics/mindcontrolmoocowright.png", "graphics/mindcontrolmoocowright.png");
			type.set("graphics/mindcontrolmoocowright.png", "image".toUpperCase());
			path.set("graphics/mmcookielarge.png", "graphics/mmcookielarge.png");
			type.set("graphics/mmcookielarge.png", "image".toUpperCase());
			path.set("graphics/moocowleft.png", "graphics/moocowleft.png");
			type.set("graphics/moocowleft.png", "image".toUpperCase());
			path.set("graphics/moocowright.png", "graphics/moocowright.png");
			type.set("graphics/moocowright.png", "image".toUpperCase());
			path.set("graphics/normalcookie.png", "graphics/normalcookie.png");
			type.set("graphics/normalcookie.png", "image".toUpperCase());
			path.set("graphics/ocean.png", "graphics/ocean.png");
			type.set("graphics/ocean.png", "image".toUpperCase());
			path.set("graphics/pbcookie.png", "graphics/pbcookie.png");
			type.set("graphics/pbcookie.png", "image".toUpperCase());
			path.set("graphics/player.png", "graphics/player.png");
			type.set("graphics/player.png", "image".toUpperCase());
			path.set("graphics/Right cookie crumb.png", "graphics/Right cookie crumb.png");
			type.set("graphics/Right cookie crumb.png", "image".toUpperCase());
			path.set("graphics/stars.png", "graphics/stars.png");
			type.set("graphics/stars.png", "image".toUpperCase());
			path.set("graphics/straw.png", "graphics/straw.png");
			type.set("graphics/straw.png", "image".toUpperCase());
			className.set ("font/04B_03__.ttf", nme.NME_font_5);
			type.set("font/04B_03__.ttf", "font".toUpperCase());
			path.set("maps/world1.tmx", "maps/world1.tmx");
			type.set("maps/world1.tmx", "binary".toUpperCase());
			path.set("maps/world10.tmx", "maps/world10.tmx");
			type.set("maps/world10.tmx", "binary".toUpperCase());
			path.set("maps/world2.tmx", "maps/world2.tmx");
			type.set("maps/world2.tmx", "binary".toUpperCase());
			path.set("maps/world3.tmx", "maps/world3.tmx");
			type.set("maps/world3.tmx", "binary".toUpperCase());
			path.set("maps/world4.tmx", "maps/world4.tmx");
			type.set("maps/world4.tmx", "binary".toUpperCase());
			path.set("maps/world5.tmx", "maps/world5.tmx");
			type.set("maps/world5.tmx", "binary".toUpperCase());
			path.set("maps/world6.tmx", "maps/world6.tmx");
			type.set("maps/world6.tmx", "binary".toUpperCase());
			path.set("maps/world7.tmx", "maps/world7.tmx");
			type.set("maps/world7.tmx", "binary".toUpperCase());
			path.set("maps/world8.tmx", "maps/world8.tmx");
			type.set("maps/world8.tmx", "binary".toUpperCase());
			path.set("maps/world9.tmx", "maps/world9.tmx");
			type.set("maps/world9.tmx", "binary".toUpperCase());
			
			
			initialized = true;
		}
	}
}

class NME_font_04b_03___ttf extends flash.text.Font { }
class NME_font_5 extends flash.text.Font { }

