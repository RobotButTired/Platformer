// Generated by Haxe 4.0.1
#ifndef INCLUDED_GameOverScreen
#define INCLUDED_GameOverScreen

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_openfl_display_Sprite
#include <openfl/display/Sprite.h>
#endif
HX_DECLARE_CLASS0(BackGround)
HX_DECLARE_CLASS0(Button)
HX_DECLARE_CLASS0(GameOverScreen)
HX_DECLARE_CLASS2(openfl,display,DisplayObject)
HX_DECLARE_CLASS2(openfl,display,DisplayObjectContainer)
HX_DECLARE_CLASS2(openfl,display,IBitmapDrawable)
HX_DECLARE_CLASS2(openfl,display,InteractiveObject)
HX_DECLARE_CLASS2(openfl,display,Sprite)
HX_DECLARE_CLASS2(openfl,events,Event)
HX_DECLARE_CLASS2(openfl,events,EventDispatcher)
HX_DECLARE_CLASS2(openfl,events,IEventDispatcher)
HX_DECLARE_CLASS2(openfl,events,MouseEvent)
HX_DECLARE_CLASS2(openfl,text,TextField)



class HXCPP_CLASS_ATTRIBUTES GameOverScreen_obj : public  ::openfl::display::Sprite_obj
{
	public:
		typedef  ::openfl::display::Sprite_obj super;
		typedef GameOverScreen_obj OBJ_;
		GameOverScreen_obj();

	public:
		enum { _hx_ClassId = 0x65eca692 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="GameOverScreen")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"GameOverScreen"); }
		static hx::ObjectPtr< GameOverScreen_obj > __new();
		static hx::ObjectPtr< GameOverScreen_obj > __alloc(hx::Ctx *_hx_ctx);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~GameOverScreen_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		hx::Val __SetField(const ::String &inString,const hx::Val &inValue, hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("GameOverScreen",92,a6,ec,65); }

		 ::Button quitButton;
		bool quitButtonIsPressed;
		 ::Button tryAgainButton;
		bool tryAgainButtonIsPressed;
		 ::openfl::text::TextField pointsField;
		 ::BackGround backGround;
		void quitButtonOver( ::openfl::events::MouseEvent e);
		::Dynamic quitButtonOver_dyn();

		void quitButtonOut( ::openfl::events::MouseEvent e);
		::Dynamic quitButtonOut_dyn();

		void quitButtonClick( ::openfl::events::MouseEvent e);
		::Dynamic quitButtonClick_dyn();

		bool get_quitButtonIsPressed();
		::Dynamic get_quitButtonIsPressed_dyn();

		void reset();
		::Dynamic reset_dyn();

		void tryAgainButtononOver( ::openfl::events::MouseEvent e);
		::Dynamic tryAgainButtononOver_dyn();

		void tryAgainButtonOut( ::openfl::events::MouseEvent e);
		::Dynamic tryAgainButtonOut_dyn();

		void tryAgainButtonClick( ::openfl::events::MouseEvent e);
		::Dynamic tryAgainButtonClick_dyn();

		bool get_tryAgainButtonIsPressed();
		::Dynamic get_tryAgainButtonIsPressed_dyn();

};


#endif /* INCLUDED_GameOverScreen */ 
