
%module experimentModule

%include <occ_handle.i>

%occ_handle(Standard_Transient)
%occ_handle(Base)
%occ_handle(Derived)
//%occ_handle(BRepPrim_Wedge)
//%occ_handle(BRepPrimAPI_MakeBox)

%include "Standard_Macro.hxx"
%include "Standard_DefineAlloc.hxx"
%include "Standard.hxx"
%include "Standard_PrimitiveTypes.hxx"
%include "Standard_Transient.hxx"


%include "BRepPrim_Wedge.hxx"
%include "BRepBuilderAPI_MakeShape.hxx"
%include "Standard_Real.hxx"
%include "BRepPrimAPI_MakeBox.hxx"

%include "experiment-cc-code.hxx"


%{
#include "BRepPrim_Wedge.hxx"
#include "BRepBuilderAPI_MakeShape.hxx"
#include "BRepPrimAPI_MakeBox.hxx"
#include "experiment-cc-code.hxx"
%}

// load the native library
%pragma(java) jniclasscode=%{
	static
	{
		System.load("/Users/nyholku/swig-experiments/out/experiment.dylib");
	}
%}
