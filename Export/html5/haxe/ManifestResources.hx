package;


import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:pathy35:assets%2FbackGround%2Fdesert_BG.pngy4:sizei40660y4:typey5:IMAGEy2:idR1y7:preloadtgoR0y40:assets%2FbackGround%2FgameOverScreen.pngR2i100976R3R4R5R7R6tgoR0y36:assets%2FbackGround%2FgameScreen.pngR2i92561R3R4R5R8R6tgoR0y37:assets%2FbackGround%2FrulesScreen.pngR2i81718R3R4R5R9R6tgoR0y37:assets%2FbackGround%2FstartScreen.pngR2i11036R3R4R5R10R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_background_desert_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_background_gameoverscreen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_background_gamescreen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_background_rulesscreen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_background_startscreen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:image("Assets/backGround/desert_BG.png") @:noCompletion #if display private #end class __ASSET__assets_background_desert_bg_png extends lime.graphics.Image {}
@:keep @:image("Assets/backGround/gameOverScreen.png") @:noCompletion #if display private #end class __ASSET__assets_background_gameoverscreen_png extends lime.graphics.Image {}
@:keep @:image("Assets/backGround/gameScreen.png") @:noCompletion #if display private #end class __ASSET__assets_background_gamescreen_png extends lime.graphics.Image {}
@:keep @:image("Assets/backGround/rulesScreen.png") @:noCompletion #if display private #end class __ASSET__assets_background_rulesscreen_png extends lime.graphics.Image {}
@:keep @:image("Assets/backGround/startScreen.png") @:noCompletion #if display private #end class __ASSET__assets_background_startscreen_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else



#end

#if (openfl && !flash)

#if html5

#else

#end

#end
#end

#end
