// Generated by Haxe 4.0.1
#ifndef INCLUDED_BonusType
#define INCLUDED_BonusType

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS0(BonusType)


class BonusType_obj : public hx::EnumBase_obj
{
	typedef hx::EnumBase_obj super;
		typedef BonusType_obj OBJ_;

	public:
		BonusType_obj() {};
		HX_DO_ENUM_RTTI;
		static void __boot();
		static void __register();
		static bool __GetStatic(const ::String &inName, Dynamic &outValue, hx::PropertyAccess inCallProp);
		::String GetEnumName( ) const { return HX_("BonusType",d9,a0,0d,44); }
		::String __ToString() const { return HX_("BonusType.",35,1d,df,47) + _hx_tag; }

		static ::BonusType destroy;
		static inline ::BonusType destroy_dyn() { return destroy; }
		static ::BonusType slow;
		static inline ::BonusType slow_dyn() { return slow; }
};


#endif /* INCLUDED_BonusType */ 
