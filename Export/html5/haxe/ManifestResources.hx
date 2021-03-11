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

		data = '{"name":null,"assets":"aoy4:pathy23:assets%2F2dplatform.pngy4:sizei7707y4:typey5:IMAGEy2:idR1y7:preloadtgoR0y35:assets%2FbackGround%2Fdesert_BG.pngR2i40660R3R4R5R7R6tgoR0y40:assets%2FbackGround%2FgameOverScreen.pngR2i100976R3R4R5R8R6tgoR0y36:assets%2FbackGround%2FgameScreen.pngR2i448276R3R4R5R9R6tgoR0y37:assets%2FbackGround%2FrulesScreen.pngR2i81718R3R4R5R10R6tgoR0y37:assets%2FbackGround%2FstartScreen.pngR2i11036R3R4R5R11R6tgoR0y29:assets%2FCowboy%2FCowboy4.pngR2i6250R3R4R5R12R6tgoR0y49:assets%2FCowboy%2FCowboy4_idle%20with%20gun_1.pngR2i623R3R4R5R13R6tgoR0y49:assets%2FCowboy%2FCowboy4_idle%20with%20gun_2.pngR2i627R3R4R5R14R6tgoR0y49:assets%2FCowboy%2FCowboy4_idle%20with%20gun_3.pngR2i627R3R4R5R15R6tgoR0y52:assets%2FCowboy%2FCowboy4_idle%20without%20gun_0.pngR2i557R3R4R5R16R6tgoR0y52:assets%2FCowboy%2FCowboy4_idle%20without%20gun_1.pngR2i557R3R4R5R17R6tgoR0y52:assets%2FCowboy%2FCowboy4_idle%20without%20gun_2.pngR2i560R3R4R5R18R6tgoR0y52:assets%2FCowboy%2FCowboy4_idle%20without%20gun_3.pngR2i560R3R4R5R19R6tgoR0y45:assets%2FCowboy%2FCowboy4_idle_with_gun_0.pngR2i623R3R4R5R20R6tgoR0y44:assets%2FCowboy%2FCowboy4_jump%20shoot_0.pngR2i626R3R4R5R21R6tgoR0y44:assets%2FCowboy%2FCowboy4_jump%20shoot_1.pngR2i808R3R4R5R22R6tgoR0y44:assets%2FCowboy%2FCowboy4_jump%20shoot_2.pngR2i778R3R4R5R23R6tgoR0y44:assets%2FCowboy%2FCowboy4_jump%20shoot_3.pngR2i767R3R4R5R24R6tgoR0y49:assets%2FCowboy%2FCowboy4_jump%20with%20gun_0.pngR2i627R3R4R5R25R6tgoR0y52:assets%2FCowboy%2FCowboy4_jump%20without%20gun_0.pngR2i560R3R4R5R26R6tgoR0y37:assets%2FCowboy%2FCowboy4_shoot_0.pngR2i630R3R4R5R27R6tgoR0y37:assets%2FCowboy%2FCowboy4_shoot_1.pngR2i817R3R4R5R28R6tgoR0y37:assets%2FCowboy%2FCowboy4_shoot_2.pngR2i788R3R4R5R29R6tgoR0y37:assets%2FCowboy%2FCowboy4_shoot_3.pngR2i774R3R4R5R30R6tgoR0y49:assets%2FCowboy%2FCowboy4_walk%20with%20gun_0.pngR2i628R3R4R5R31R6tgoR0y49:assets%2FCowboy%2FCowboy4_walk%20with%20gun_1.pngR2i610R3R4R5R32R6tgoR0y49:assets%2FCowboy%2FCowboy4_walk%20with%20gun_2.pngR2i630R3R4R5R33R6tgoR0y49:assets%2FCowboy%2FCowboy4_walk%20with%20gun_3.pngR2i610R3R4R5R34R6tgoR0y52:assets%2FCowboy%2FCowboy4_walk%20without%20gun_0.pngR2i551R3R4R5R35R6tgoR0y52:assets%2FCowboy%2FCowboy4_walk%20without%20gun_1.pngR2i513R3R4R5R36R6tgoR0y52:assets%2FCowboy%2FCowboy4_walk%20without%20gun_2.pngR2i541R3R4R5R37R6tgoR0y52:assets%2FCowboy%2FCowboy4_walk%20without%20gun_3.pngR2i513R3R4R5R38R6tgoR0y28:assets%2FtileMap%2Fgrass.pngR2i6766R3R4R5R39R6tgoR0y33:assets%2FtileMap%2FPixelAtlas.pngR2i5091R3R4R5R40R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
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

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_2dplatform_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_background_desert_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_background_gameoverscreen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_background_gamescreen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_background_rulesscreen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_background_startscreen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_idle_with_gun_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_idle_with_gun_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_idle_with_gun_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_idle_without_gun_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_idle_without_gun_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_idle_without_gun_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_idle_without_gun_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_idle_with_gun_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_jump_shoot_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_jump_shoot_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_jump_shoot_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_jump_shoot_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_jump_with_gun_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_jump_without_gun_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_shoot_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_shoot_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_shoot_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_shoot_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_walk_with_gun_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_walk_with_gun_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_walk_with_gun_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_walk_with_gun_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_walk_without_gun_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_walk_without_gun_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_walk_without_gun_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_walk_without_gun_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tilemap_grass_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tilemap_pixelatlas_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:image("Assets/2dplatform.png") @:noCompletion #if display private #end class __ASSET__assets_2dplatform_png extends lime.graphics.Image {}
@:keep @:image("Assets/backGround/desert_BG.png") @:noCompletion #if display private #end class __ASSET__assets_background_desert_bg_png extends lime.graphics.Image {}
@:keep @:image("Assets/backGround/gameOverScreen.png") @:noCompletion #if display private #end class __ASSET__assets_background_gameoverscreen_png extends lime.graphics.Image {}
@:keep @:image("Assets/backGround/gameScreen.png") @:noCompletion #if display private #end class __ASSET__assets_background_gamescreen_png extends lime.graphics.Image {}
@:keep @:image("Assets/backGround/rulesScreen.png") @:noCompletion #if display private #end class __ASSET__assets_background_rulesscreen_png extends lime.graphics.Image {}
@:keep @:image("Assets/backGround/startScreen.png") @:noCompletion #if display private #end class __ASSET__assets_background_startscreen_png extends lime.graphics.Image {}
@:keep @:image("Assets/Cowboy/Cowboy4.png") @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_png extends lime.graphics.Image {}
@:keep @:image("Assets/Cowboy/Cowboy4_idle with gun_1.png") @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_idle_with_gun_1_png extends lime.graphics.Image {}
@:keep @:image("Assets/Cowboy/Cowboy4_idle with gun_2.png") @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_idle_with_gun_2_png extends lime.graphics.Image {}
@:keep @:image("Assets/Cowboy/Cowboy4_idle with gun_3.png") @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_idle_with_gun_3_png extends lime.graphics.Image {}
@:keep @:image("Assets/Cowboy/Cowboy4_idle without gun_0.png") @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_idle_without_gun_0_png extends lime.graphics.Image {}
@:keep @:image("Assets/Cowboy/Cowboy4_idle without gun_1.png") @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_idle_without_gun_1_png extends lime.graphics.Image {}
@:keep @:image("Assets/Cowboy/Cowboy4_idle without gun_2.png") @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_idle_without_gun_2_png extends lime.graphics.Image {}
@:keep @:image("Assets/Cowboy/Cowboy4_idle without gun_3.png") @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_idle_without_gun_3_png extends lime.graphics.Image {}
@:keep @:image("Assets/Cowboy/Cowboy4_idle_with_gun_0.png") @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_idle_with_gun_0_png extends lime.graphics.Image {}
@:keep @:image("Assets/Cowboy/Cowboy4_jump shoot_0.png") @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_jump_shoot_0_png extends lime.graphics.Image {}
@:keep @:image("Assets/Cowboy/Cowboy4_jump shoot_1.png") @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_jump_shoot_1_png extends lime.graphics.Image {}
@:keep @:image("Assets/Cowboy/Cowboy4_jump shoot_2.png") @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_jump_shoot_2_png extends lime.graphics.Image {}
@:keep @:image("Assets/Cowboy/Cowboy4_jump shoot_3.png") @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_jump_shoot_3_png extends lime.graphics.Image {}
@:keep @:image("Assets/Cowboy/Cowboy4_jump with gun_0.png") @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_jump_with_gun_0_png extends lime.graphics.Image {}
@:keep @:image("Assets/Cowboy/Cowboy4_jump without gun_0.png") @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_jump_without_gun_0_png extends lime.graphics.Image {}
@:keep @:image("Assets/Cowboy/Cowboy4_shoot_0.png") @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_shoot_0_png extends lime.graphics.Image {}
@:keep @:image("Assets/Cowboy/Cowboy4_shoot_1.png") @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_shoot_1_png extends lime.graphics.Image {}
@:keep @:image("Assets/Cowboy/Cowboy4_shoot_2.png") @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_shoot_2_png extends lime.graphics.Image {}
@:keep @:image("Assets/Cowboy/Cowboy4_shoot_3.png") @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_shoot_3_png extends lime.graphics.Image {}
@:keep @:image("Assets/Cowboy/Cowboy4_walk with gun_0.png") @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_walk_with_gun_0_png extends lime.graphics.Image {}
@:keep @:image("Assets/Cowboy/Cowboy4_walk with gun_1.png") @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_walk_with_gun_1_png extends lime.graphics.Image {}
@:keep @:image("Assets/Cowboy/Cowboy4_walk with gun_2.png") @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_walk_with_gun_2_png extends lime.graphics.Image {}
@:keep @:image("Assets/Cowboy/Cowboy4_walk with gun_3.png") @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_walk_with_gun_3_png extends lime.graphics.Image {}
@:keep @:image("Assets/Cowboy/Cowboy4_walk without gun_0.png") @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_walk_without_gun_0_png extends lime.graphics.Image {}
@:keep @:image("Assets/Cowboy/Cowboy4_walk without gun_1.png") @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_walk_without_gun_1_png extends lime.graphics.Image {}
@:keep @:image("Assets/Cowboy/Cowboy4_walk without gun_2.png") @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_walk_without_gun_2_png extends lime.graphics.Image {}
@:keep @:image("Assets/Cowboy/Cowboy4_walk without gun_3.png") @:noCompletion #if display private #end class __ASSET__assets_cowboy_cowboy4_walk_without_gun_3_png extends lime.graphics.Image {}
@:keep @:image("Assets/tileMap/grass.png") @:noCompletion #if display private #end class __ASSET__assets_tilemap_grass_png extends lime.graphics.Image {}
@:keep @:image("Assets/tileMap/PixelAtlas.png") @:noCompletion #if display private #end class __ASSET__assets_tilemap_pixelatlas_png extends lime.graphics.Image {}
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
