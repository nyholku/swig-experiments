
%module OccJava
// %rename("%(firstuppercase)s") ""; // foo_bar -> fooBar; FooBar -> fooBar

//-----------------------------------------------------------------------------
%define OCC_TRANSIENT(classname)

%occ_handle(classname)

%{
#include "classname.hxx"
%}

%include "classname.hxx"

%enddef

//-----------------------------------------------------------------------------
%define OCC_CLASS(classname)

%{
#include "classname.hxx"
%}

%include "classname.hxx"

%enddef

//-----------------------------------------------------------------------------
%define OCC_GP_AUX(classname , filename)

%{
#include #filename
%}

%rename(GP_ ## classname) gp_ ## classname;

%include #filename

%enddef
//-----------------------------------------------------------------------------
%define OCC_GP(classname)

OCC_GP_AUX(classname, gp_ ## classname ## .hxx )

%enddef

//-----------------------------------------------------------------------------
%define OCC_MATH(classname)

%enddef

//-----------------------------------------------------------------------------
// #include all the files the C++ wrapper needs
%{
#include <type_traits>
#include "Standard_Std.hxx"
#include "Standard_Address.hxx"
#include "Standard_math.hxx"
#include "Standard_TypeDef.hxx"
#include "Standard_Type.hxx"
#include "NCollection_List.hxx"
//#include "NCollection_DefineHArray1.hxx"
#include "TopTools_ListOfShape.hxx"
%}

//-----------------------------------------------------------------------------
//
%include "occ_handle.i"
%include "Standard.i"
%include "TopoDS.i"

//-----------------------------------------------------------------------------
//
%occ_handle(Patched_Standard_Handle)
%occ_handle(Standard_Transient)
%occ_handle(Standard_Type)

%include "Standard_TypeDef.hxx"
%include "Standard_Macro.hxx"
%include "Standard_DefineAlloc.hxx"

%include "Patched_Standard_Handle.hxx"
%include "Standard_Transient.hxx"
%include "Standard_Type.hxx"

//-----------------------------------------------------------------------------
// Simple header only types/enums

%include "GeomAbs_BSplKnotDistribution.hxx"
//%include "GeomAbs_CurveForm.hxx"
%include "GeomAbs_CurveType.hxx"
%include "GeomAbs_IsoType.hxx"
%include "GeomAbs_JoinType.hxx"
%include "GeomAbs_Shape.hxx"
//%include "GeomAbs_SurfaceForm.hxx"
%include "GeomAbs_SurfaceType.hxx"
//%include "GeomAbs_UVSense.hxx"
%include "BRepPrim_Direction.hxx"

//%include "NCollection_DefineHArray1.hxx"
%include "NCollection_List.hxx"
%include "TopTools_ListOfShape.hxx"
%template(TopTools_ListOfShape) NCollection_List<TopoDS_Shape>;

%include "occ-classes.i"

//-----------------------------------------------------------------------------
// Propagate all OCC exceptions to Java
%exception  {
    try {
        $action
    } catch (Standard_Failure ex) {
       std::cerr << ex.GetMessageString() << std::endl;
       // SWIG_JavaThrowException(jenv, SWIG_JavaRuntimeException, Standard_Failure::Caught()->DynamicType()->Name());
    }
}

//-----------------------------------------------------------------------------
// Insert Java code to load the native library
%pragma(java) jniclasscode=%{
	static
	{
		System.load("/Users/nyholku/swig-experiments/bin/libOccJava.dylib");
	}
%}
