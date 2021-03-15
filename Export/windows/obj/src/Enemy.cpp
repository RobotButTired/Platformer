// Generated by Haxe 4.0.1
#include <hxcpp.h>

#ifndef INCLUDED_Bonus
#include <Bonus.h>
#endif
#ifndef INCLUDED_Enemy
#include <Enemy.h>
#endif
#ifndef INCLUDED_Game
#include <Game.h>
#endif
#ifndef INCLUDED_Main
#include <Main.h>
#endif
#ifndef INCLUDED_Player
#include <Player.h>
#endif
#ifndef INCLUDED_Unit
#include <Unit.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObject
#include <openfl/display/DisplayObject.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObjectContainer
#include <openfl/display/DisplayObjectContainer.h>
#endif
#ifndef INCLUDED_openfl_display_Graphics
#include <openfl/display/Graphics.h>
#endif
#ifndef INCLUDED_openfl_display_IBitmapDrawable
#include <openfl/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_openfl_display_InteractiveObject
#include <openfl/display/InteractiveObject.h>
#endif
#ifndef INCLUDED_openfl_display_Sprite
#include <openfl/display/Sprite.h>
#endif
#ifndef INCLUDED_openfl_events_EventDispatcher
#include <openfl/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_openfl_events_IEventDispatcher
#include <openfl/events/IEventDispatcher.h>
#endif
#ifndef INCLUDED_openfl_geom_Rectangle
#include <openfl/geom/Rectangle.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_c595a05c1c7a687d_6_new,"Enemy","new",0x35d4571a,"Enemy.new","Enemy.hx",6,0xbda88996)
HX_LOCAL_STACK_FRAME(_hx_pos_c595a05c1c7a687d_27_drawHitBox,"Enemy","drawHitBox",0x09b64522,"Enemy.drawHitBox","Enemy.hx",27,0xbda88996)
HX_LOCAL_STACK_FRAME(_hx_pos_c595a05c1c7a687d_35_move,"Enemy","move",0xe3563f17,"Enemy.move","Enemy.hx",35,0xbda88996)
HX_LOCAL_STACK_FRAME(_hx_pos_c595a05c1c7a687d_45_doShot,"Enemy","doShot",0x645f63ab,"Enemy.doShot","Enemy.hx",45,0xbda88996)

void Enemy_obj::__construct(){
            	HX_GC_STACKFRAME(&_hx_pos_c595a05c1c7a687d_6_new)
HXLINE(   8)		this->color = 65280;
HXLINE(  11)		super::__construct();
HXLINE(  13)		this->hitBox =  ::openfl::geom::Rectangle_obj::__alloc( HX_CTX ,((Float)-15.),((Float)-20.),30,40);
HXLINE(  14)		this->drawHitBox();
HXLINE(  15)		this->speedX = ( (Float)(90) );
HXLINE(  16)		this->speedY = ((Float)0.0);
HXLINE(  17)		if (::Bonus_obj::bonusIsUsed) {
HXLINE(  19)			 ::Enemy _hx_tmp = hx::ObjectPtr<OBJ_>(this);
HXDLIN(  19)			_hx_tmp->speedY = (_hx_tmp->speedY * ((Float)0.25));
HXLINE(  20)			 ::Enemy _hx_tmp1 = hx::ObjectPtr<OBJ_>(this);
HXDLIN(  20)			_hx_tmp1->speedX = (_hx_tmp1->speedX * ((Float)0.25));
HXLINE(  21)			 ::Enemy _hx_tmp2 = hx::ObjectPtr<OBJ_>(this);
HXDLIN(  21)			_hx_tmp2->gravity = (_hx_tmp2->gravity * ((Float)0.25));
            		}
            	}

Dynamic Enemy_obj::__CreateEmpty() { return new Enemy_obj; }

void *Enemy_obj::_hx_vtable = 0;

Dynamic Enemy_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< Enemy_obj > _hx_result = new Enemy_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool Enemy_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x19c29573) {
		if (inClassId<=(int)0x0ddfced7) {
			if (inClassId<=(int)0x03a88228) {
				return inClassId==(int)0x00000001 || inClassId==(int)0x03a88228;
			} else {
				return inClassId==(int)0x0ddfced7;
			}
		} else {
			return inClassId==(int)0x17120186 || inClassId==(int)0x19c29573;
		}
	} else {
		if (inClassId<=(int)0x3882f6a4) {
			return inClassId==(int)0x1b123bf8 || inClassId==(int)0x3882f6a4;
		} else {
			return inClassId==(int)0x3f2b00af;
		}
	}
}

void Enemy_obj::drawHitBox(){
            	HX_STACKFRAME(&_hx_pos_c595a05c1c7a687d_27_drawHitBox)
HXLINE(  28)		this->get_graphics()->clear();
HXLINE(  29)		this->get_graphics()->lineStyle(3,this->color,null(),null(),null(),null(),null(),null());
HXLINE(  30)		 ::openfl::display::Graphics _hx_tmp = this->get_graphics();
HXDLIN(  30)		Float _hx_tmp1 = (-(this->get_hitBox()->width) / ( (Float)(2) ));
HXDLIN(  30)		Float _hx_tmp2 = (-(this->get_hitBox()->height) / ( (Float)(2) ));
HXDLIN(  30)		Float _hx_tmp3 = this->get_hitBox()->width;
HXDLIN(  30)		_hx_tmp->drawRect(_hx_tmp1,_hx_tmp2,_hx_tmp3,this->get_hitBox()->height);
HXLINE(  31)		this->get_graphics()->endFill();
            	}


HX_DEFINE_DYNAMIC_FUNC0(Enemy_obj,drawHitBox,(void))

void Enemy_obj::move( ::Player player,::Array< ::Dynamic> level){
            	HX_STACKFRAME(&_hx_pos_c595a05c1c7a687d_35_move)
HXLINE(  36)		Float _hx_tmp = player->get_x();
HXDLIN(  36)		if ((_hx_tmp < this->get_x())) {
HXLINE(  37)			 ::Enemy _g = hx::ObjectPtr<OBJ_>(this);
HXDLIN(  37)			Float _hx_tmp1 = _g->get_x();
HXDLIN(  37)			_g->set_x((_hx_tmp1 - (this->speedX * ::Main_obj::timePerFrame)));
            		}
            		else {
HXLINE(  38)			Float _hx_tmp2 = player->get_x();
HXDLIN(  38)			if ((_hx_tmp2 > this->get_x())) {
HXLINE(  39)				 ::Enemy _g1 = hx::ObjectPtr<OBJ_>(this);
HXDLIN(  39)				Float _hx_tmp3 = _g1->get_x();
HXDLIN(  39)				_g1->set_x((_hx_tmp3 + (this->speedX * ::Main_obj::timePerFrame)));
            			}
            		}
HXLINE(  40)		 ::Enemy _hx_tmp4 = hx::ObjectPtr<OBJ_>(this);
HXDLIN(  40)		_hx_tmp4->speedY = (_hx_tmp4->speedY + this->gravity);
HXLINE(  41)		{
HXLINE(  41)			 ::Enemy _g2 = hx::ObjectPtr<OBJ_>(this);
HXDLIN(  41)			Float _hx_tmp5 = _g2->get_y();
HXDLIN(  41)			_g2->set_y((_hx_tmp5 + (this->speedY * ::Main_obj::timePerFrame)));
            		}
HXLINE(  42)		this->doCollisionsWithTiles(level);
            	}


HX_DEFINE_DYNAMIC_FUNC2(Enemy_obj,move,(void))

void Enemy_obj::doShot( ::Game game){
            	HX_STACKFRAME(&_hx_pos_c595a05c1c7a687d_45_doShot)
            	}


HX_DEFINE_DYNAMIC_FUNC1(Enemy_obj,doShot,(void))


hx::ObjectPtr< Enemy_obj > Enemy_obj::__new() {
	hx::ObjectPtr< Enemy_obj > __this = new Enemy_obj();
	__this->__construct();
	return __this;
}

hx::ObjectPtr< Enemy_obj > Enemy_obj::__alloc(hx::Ctx *_hx_ctx) {
	Enemy_obj *__this = (Enemy_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(Enemy_obj), true, "Enemy"));
	*(void **)__this = Enemy_obj::_hx_vtable;
	__this->__construct();
	return __this;
}

Enemy_obj::Enemy_obj()
{
}

hx::Val Enemy_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"move") ) { return hx::Val( move_dyn() ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"color") ) { return hx::Val( color ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"doShot") ) { return hx::Val( doShot_dyn() ); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"drawHitBox") ) { return hx::Val( drawHitBox_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

hx::Val Enemy_obj::__SetField(const ::String &inName,const hx::Val &inValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"color") ) { color=inValue.Cast< int >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Enemy_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("color",63,71,5c,4a));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static hx::StorageInfo Enemy_obj_sMemberStorageInfo[] = {
	{hx::fsInt,(int)offsetof(Enemy_obj,color),HX_("color",63,71,5c,4a)},
	{ hx::fsUnknown, 0, null()}
};
static hx::StaticInfo *Enemy_obj_sStaticStorageInfo = 0;
#endif

static ::String Enemy_obj_sMemberFields[] = {
	HX_("color",63,71,5c,4a),
	HX_("drawHitBox",9c,20,d3,98),
	HX_("move",11,e3,60,48),
	HX_("doShot",25,7a,56,1c),
	::String(null()) };

hx::Class Enemy_obj::__mClass;

void Enemy_obj::__register()
{
	Enemy_obj _hx_dummy;
	Enemy_obj::_hx_vtable = *(void **)&_hx_dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_("Enemy",28,82,a8,03);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = hx::Class_obj::dupFunctions(Enemy_obj_sMemberFields);
	__mClass->mCanCast = hx::TCanCast< Enemy_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = Enemy_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = Enemy_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

