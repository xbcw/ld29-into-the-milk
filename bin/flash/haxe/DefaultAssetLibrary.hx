package;


import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.MovieClip;
import flash.text.Font;
import flash.media.Sound;
import flash.net.URLRequest;
import flash.utils.ByteArray;
import haxe.Unserializer;
import openfl.Assets;

#if (flash || js)
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLLoader;
#end

#if ios
import openfl.utils.SystemPath;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public static var className (default, null) = new Map <String, Dynamic> ();
	public static var path (default, null) = new Map <String, String> ();
	public static var type (default, null) = new Map <String, AssetType> ();
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("gfx/debug/console_debug.png", __ASSET__gfx_debug_console_debug_png);
		type.set ("gfx/debug/console_debug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("gfx/debug/console_hidden.png", __ASSET__gfx_debug_console_hidden_png);
		type.set ("gfx/debug/console_hidden.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("gfx/debug/console_logo.png", __ASSET__gfx_debug_console_logo_png);
		type.set ("gfx/debug/console_logo.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("gfx/debug/console_output.png", __ASSET__gfx_debug_console_output_png);
		type.set ("gfx/debug/console_output.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("gfx/debug/console_pause.png", __ASSET__gfx_debug_console_pause_png);
		type.set ("gfx/debug/console_pause.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("gfx/debug/console_play.png", __ASSET__gfx_debug_console_play_png);
		type.set ("gfx/debug/console_play.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("gfx/debug/console_step.png", __ASSET__gfx_debug_console_step_png);
		type.set ("gfx/debug/console_step.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("gfx/debug/console_visible.png", __ASSET__gfx_debug_console_visible_png);
		type.set ("gfx/debug/console_visible.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("gfx/preloader/haxepunk.png", __ASSET__gfx_preloader_haxepunk_png);
		type.set ("gfx/preloader/haxepunk.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("font/04B_03__.ttf", __ASSET__font_04b_03___ttf);
		type.set ("font/04B_03__.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
		className.set ("graphics/block.png", __ASSET__graphics_block_png);
		type.set ("graphics/block.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("graphics/bus.png", __ASSET__graphics_bus_png);
		type.set ("graphics/bus.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("graphics/bus2.png", __ASSET__graphics_bus2_png);
		type.set ("graphics/bus2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("graphics/cow.png", __ASSET__graphics_cow_png);
		type.set ("graphics/cow.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("graphics/cow2.png", __ASSET__graphics_cow2_png);
		type.set ("graphics/cow2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("graphics/drinkingstraw.jpg", __ASSET__graphics_drinkingstraw_jpg);
		type.set ("graphics/drinkingstraw.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("graphics/drinkingstraw.png", __ASSET__graphics_drinkingstraw_png);
		type.set ("graphics/drinkingstraw.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("graphics/glass.png", __ASSET__graphics_glass_png);
		type.set ("graphics/glass.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("graphics/glassbottom.png", __ASSET__graphics_glassbottom_png);
		type.set ("graphics/glassbottom.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("graphics/glassside.png", __ASSET__graphics_glassside_png);
		type.set ("graphics/glassside.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("graphics/glasssquare.png", __ASSET__graphics_glasssquare_png);
		type.set ("graphics/glasssquare.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("graphics/kitty.png", __ASSET__graphics_kitty_png);
		type.set ("graphics/kitty.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("graphics/kitty64.png", __ASSET__graphics_kitty64_png);
		type.set ("graphics/kitty64.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("graphics/milkbackground.png", __ASSET__graphics_milkbackground_png);
		type.set ("graphics/milkbackground.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("graphics/Milkshipleft.png", __ASSET__graphics_milkshipleft_png);
		type.set ("graphics/Milkshipleft.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("graphics/Milkshipright.png", __ASSET__graphics_milkshipright_png);
		type.set ("graphics/Milkshipright.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("graphics/milktileset.png", __ASSET__graphics_milktileset_png);
		type.set ("graphics/milktileset.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("graphics/mmcookie.png", __ASSET__graphics_mmcookie_png);
		type.set ("graphics/mmcookie.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("graphics/mmcookielarge.png", __ASSET__graphics_mmcookielarge_png);
		type.set ("graphics/mmcookielarge.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("graphics/Moocow.png", __ASSET__graphics_moocow_png);
		type.set ("graphics/Moocow.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("graphics/moocowleft.png", __ASSET__graphics_moocowleft_png);
		type.set ("graphics/moocowleft.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("graphics/normalcookie.png", __ASSET__graphics_normalcookie_png);
		type.set ("graphics/normalcookie.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("graphics/plane.png", __ASSET__graphics_plane_png);
		type.set ("graphics/plane.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("graphics/player.png", __ASSET__graphics_player_png);
		type.set ("graphics/player.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("font/04B_03__.ttf", __ASSET__font_5);
		type.set ("font/04B_03__.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
		className.set ("maps/world1.tmx", __ASSET__maps_world1_tmx);
		type.set ("maps/world1.tmx", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("maps/world2.tmx", __ASSET__maps_world2_tmx);
		type.set ("maps/world2.tmx", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		
		#elseif html5
		
		addExternal("gfx/debug/console_debug.png", "image", "gfx/debug/console_debug.png");
		addExternal("gfx/debug/console_hidden.png", "image", "gfx/debug/console_hidden.png");
		addExternal("gfx/debug/console_logo.png", "image", "gfx/debug/console_logo.png");
		addExternal("gfx/debug/console_output.png", "image", "gfx/debug/console_output.png");
		addExternal("gfx/debug/console_pause.png", "image", "gfx/debug/console_pause.png");
		addExternal("gfx/debug/console_play.png", "image", "gfx/debug/console_play.png");
		addExternal("gfx/debug/console_step.png", "image", "gfx/debug/console_step.png");
		addExternal("gfx/debug/console_visible.png", "image", "gfx/debug/console_visible.png");
		addExternal("gfx/preloader/haxepunk.png", "image", "gfx/preloader/haxepunk.png");
		addEmbed("font/04B_03__.ttf", "font", __ASSET__font_04b_03___ttf);
		addExternal("graphics/block.png", "image", "graphics/block.png");
		addExternal("graphics/bus.png", "image", "graphics/bus.png");
		addExternal("graphics/bus2.png", "image", "graphics/bus2.png");
		addExternal("graphics/cow.png", "image", "graphics/cow.png");
		addExternal("graphics/cow2.png", "image", "graphics/cow2.png");
		addExternal("graphics/drinkingstraw.jpg", "image", "graphics/drinkingstraw.jpg");
		addExternal("graphics/drinkingstraw.png", "image", "graphics/drinkingstraw.png");
		addExternal("graphics/glass.png", "image", "graphics/glass.png");
		addExternal("graphics/glassbottom.png", "image", "graphics/glassbottom.png");
		addExternal("graphics/glassside.png", "image", "graphics/glassside.png");
		addExternal("graphics/glasssquare.png", "image", "graphics/glasssquare.png");
		addExternal("graphics/kitty.png", "image", "graphics/kitty.png");
		addExternal("graphics/kitty64.png", "image", "graphics/kitty64.png");
		addExternal("graphics/milkbackground.png", "image", "graphics/milkbackground.png");
		addExternal("graphics/Milkshipleft.png", "image", "graphics/Milkshipleft.png");
		addExternal("graphics/Milkshipright.png", "image", "graphics/Milkshipright.png");
		addExternal("graphics/milktileset.png", "image", "graphics/milktileset.png");
		addExternal("graphics/mmcookie.png", "image", "graphics/mmcookie.png");
		addExternal("graphics/mmcookielarge.png", "image", "graphics/mmcookielarge.png");
		addExternal("graphics/Moocow.png", "image", "graphics/Moocow.png");
		addExternal("graphics/moocowleft.png", "image", "graphics/moocowleft.png");
		addExternal("graphics/normalcookie.png", "image", "graphics/normalcookie.png");
		addExternal("graphics/plane.png", "image", "graphics/plane.png");
		addExternal("graphics/player.png", "image", "graphics/player.png");
		addEmbed("font/04B_03__.ttf", "font", __ASSET__font_5);
		addExternal("maps/world1.tmx", "binary", "maps/world1.tmx");
		addExternal("maps/world2.tmx", "binary", "maps/world2.tmx");
		
		
		#else
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<AssetData> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							path.set (asset.id, asset.path);
							type.set (asset.id, asset.type);
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest");
				
			}
			
		} catch (e:Dynamic) {
			
			trace ("Warning: Could not load asset manifest");
			
		}
		
		#end
		
	}
	
	
	#if html5
	private function addEmbed(id:String, kind:String, value:Dynamic):Void {
		className.set(id, value);
		type.set(id, Reflect.field(AssetType, kind.toUpperCase()));
	}
	
	
	private function addExternal(id:String, kind:String, value:String):Void {
		path.set(id, value);
		type.set(id, Reflect.field(AssetType, kind.toUpperCase()));
	}
	#end
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = DefaultAssetLibrary.type.get (id);
		
		#if pixi
		
		if (assetType == IMAGE) {
			
			return true;
			
		} else {
			
			return false;
			
		}
		
		#end
		
		if (assetType != null) {
			
			if (assetType == type || ((type == SOUND || type == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && type == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (type == BINARY || type == null) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		#if pixi
		
		return BitmapData.fromImage (path.get (id));
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), BitmapData);
		
		#elseif js
		
		return cast (ApplicationMain.loaders.get (path.get (id)).contentLoaderInfo.content, Bitmap).bitmapData;
		
		#else
		
		return BitmapData.load (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if pixi
		
		return null;
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif js
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}

		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if pixi
		
		return null;
		
		#elseif (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		return new Font (path.get (id));
		
		#end
		
	}
	
	
	public override function getMusic (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		#if flash
		
		if (type != AssetType.MUSIC && type != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		#if pixi
		
		handler (getBitmapData (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBitmapData (id));
			
		}
		
		#else
		
		handler (getBitmapData (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if pixi
		
		handler (getBytes (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getFont (id));
			
		//}
		
		#else
		
		handler (getFont (id));
		
		#end
		
	}
	
	
	public override function loadMusic (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getSound (id));
			
		//}
		
		#else
		
		handler (getSound (id));
		
		#end
		
	}
	
	
}


#if pixi
#elseif flash

class __ASSET__gfx_debug_console_debug_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__gfx_debug_console_hidden_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__gfx_debug_console_logo_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__gfx_debug_console_output_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__gfx_debug_console_pause_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__gfx_debug_console_play_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__gfx_debug_console_step_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__gfx_debug_console_visible_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__gfx_preloader_haxepunk_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__font_04b_03___ttf extends flash.text.Font { }
class __ASSET__graphics_block_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__graphics_bus_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__graphics_bus2_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__graphics_cow_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__graphics_cow2_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__graphics_drinkingstraw_jpg extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__graphics_drinkingstraw_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__graphics_glass_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__graphics_glassbottom_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__graphics_glassside_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__graphics_glasssquare_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__graphics_kitty_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__graphics_kitty64_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__graphics_milkbackground_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__graphics_milkshipleft_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__graphics_milkshipright_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__graphics_milktileset_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__graphics_mmcookie_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__graphics_mmcookielarge_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__graphics_moocow_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__graphics_moocowleft_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__graphics_normalcookie_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__graphics_plane_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__graphics_player_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__font_5 extends flash.text.Font { }
class __ASSET__maps_world1_tmx extends flash.utils.ByteArray { }
class __ASSET__maps_world2_tmx extends flash.utils.ByteArray { }


#elseif html5










class __ASSET__font_04b_03___ttf extends flash.text.Font { }
























class __ASSET__font_5 extends flash.text.Font { }




#end
