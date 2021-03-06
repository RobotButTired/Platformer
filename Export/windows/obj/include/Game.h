// Generated by Haxe 4.0.1
#ifndef INCLUDED_Game
#define INCLUDED_Game

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_openfl_display_Sprite
#include <openfl/display/Sprite.h>
#endif
HX_DECLARE_CLASS0(BackGround)
HX_DECLARE_CLASS0(Bullet)
HX_DECLARE_CLASS0(Button)
HX_DECLARE_CLASS0(Enemy)
HX_DECLARE_CLASS0(Game)
HX_DECLARE_CLASS0(GameLevel)
HX_DECLARE_CLASS0(Player)
HX_DECLARE_CLASS0(Unit)
HX_DECLARE_CLASS2(openfl,display,DisplayObject)
HX_DECLARE_CLASS2(openfl,display,DisplayObjectContainer)
HX_DECLARE_CLASS2(openfl,display,IBitmapDrawable)
HX_DECLARE_CLASS2(openfl,display,InteractiveObject)
HX_DECLARE_CLASS2(openfl,display,Sprite)
HX_DECLARE_CLASS2(openfl,display,Tile)
HX_DECLARE_CLASS2(openfl,events,Event)
HX_DECLARE_CLASS2(openfl,events,EventDispatcher)
HX_DECLARE_CLASS2(openfl,events,IEventDispatcher)
HX_DECLARE_CLASS2(openfl,events,MouseEvent)
HX_DECLARE_CLASS2(openfl,geom,Rectangle)



class HXCPP_CLASS_ATTRIBUTES Game_obj : public  ::openfl::display::Sprite_obj
{
	public:
		typedef  ::openfl::display::Sprite_obj super;
		typedef Game_obj OBJ_;
		Game_obj();

	public:
		enum { _hx_ClassId = 0x2f382012 };

		void __construct(int width,int height);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="Game")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"Game"); }
		static hx::ObjectPtr< Game_obj > __new(int width,int height);
		static hx::ObjectPtr< Game_obj > __alloc(hx::Ctx *_hx_ctx,int width,int height);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~Game_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		hx::Val __SetField(const ::String &inString,const hx::Val &inValue, hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("Game",12,20,38,2f); }

		int sizeWidth;
		int sizeHeight;
		 ::BackGround backGround;
		 ::Button quitButton;
		bool quitButtonIsPressed;
		 ::GameLevel gameLevel;
		 ::Player player;
		bool haveCollision;
		bool gameIsOver;
		::Array< ::Dynamic> bullets;
		::Array< ::Dynamic> spentBullets;
		::Array< ::Dynamic> enemies;
		::Array< ::Dynamic> deadEnemies;
		int maxEnemies;
		Float spawnDelay;
		Float enemiesTimeFlag;
		void quitButtonClick( ::openfl::events::MouseEvent e);
		::Dynamic quitButtonClick_dyn();

		void quitButtonOver( ::openfl::events::MouseEvent e);
		::Dynamic quitButtonOver_dyn();

		void quitButtonOut( ::openfl::events::MouseEvent e);
		::Dynamic quitButtonOut_dyn();

		bool get_quitButtonIsPressed();
		::Dynamic get_quitButtonIsPressed_dyn();

		void update();
		::Dynamic update_dyn();

		bool checkCollisionWithTile( ::openfl::geom::Rectangle playerHitBox, ::openfl::display::Tile tile);
		::Dynamic checkCollisionWithTile_dyn();

		void doCollisionsWithTiles();
		::Dynamic doCollisionsWithTiles_dyn();

		void playerJump();
		::Dynamic playerJump_dyn();

		void bulletsMove();
		::Dynamic bulletsMove_dyn();

		void generateEnemies();
		::Dynamic generateEnemies_dyn();

		void generateEnemy();
		::Dynamic generateEnemy_dyn();

		void moveEnemies();
		::Dynamic moveEnemies_dyn();

		void doCollisionsWithBullet();
		::Dynamic doCollisionsWithBullet_dyn();

		bool get_gameIsOver();
		::Dynamic get_gameIsOver_dyn();

		void doCollidionWithEnemies();
		::Dynamic doCollidionWithEnemies_dyn();

};


#endif /* INCLUDED_Game */ 
