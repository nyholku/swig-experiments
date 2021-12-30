
%module experimentModule

%include <occ_handle.i>
//%include <gp.i>





//%rename(double) Standard_Real;

%occ_handle(Standard_Transient)
%occ_handle(Base)
%occ_handle(Derived)
//%occ_handle(BRepPrim_Wedge)
//%occ_handle(BRepPrimAPI_MakeBox)

%rename(GP_XYZ) gp_XYZ;
%rename(GP_Pnt) gp_Pnt;
%rename(GP_Trsf) gp_Trsf;
%rename(GP_Quaternion) gp_Quaternion;
%rename(GP_Circ) gp_Circ;

%include "Standard_math.hxx"
%include "Standard_TypeDef.hxx"
%include "Standard_Macro.hxx"
%include "Standard_DefineAlloc.hxx"
%include "Standard.hxx"
%include "Standard_PrimitiveTypes.hxx"
%include "gp_XYZ.hxx"
%include "gp_Pnt.hxx"
%include "gp_Trsf.hxx"
%include "gp_Circ.hxx"
%include "Standard_Transient.hxx"
%include "gp_Quaternion.hxx"


%include "BRepPrim_Wedge.hxx"
%include "BRepBuilderAPI_MakeShape.hxx"
%include "Standard_Real.hxx"
%include "BRepPrimAPI_MakeBox.hxx"

%include "experiment-cc-code.hxx"


%{
#include "Standard_math.hxx"
#include "Standard_TypeDef.hxx"
#include "gp_XYZ.hxx"
#include "gp_Pnt.hxx"
#include "gp_Trsf.hxx"
#include "gp_Quaternion.hxx"
#include "gp_Circ.hxx"
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
