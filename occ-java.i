
%module experimentModule

%include <occ_handle.i>
//%include <gp.i>





//%rename(double) Standard_Real;

%occ_handle(Standard_Transient)
%occ_handle(Base)
%occ_handle(Derived)
%occ_handle(Geom_Geometry)
%occ_handle(Geom_Surface)
%occ_handle(TopoDS_TShape)
%occ_handle(Standard_Type)
//%occ_handle(BRepPrim_Wedge)
//%occ_handle(BRepPrimAPI_MakeBox)

%rename(GP_XYZ) gp_XYZ;
%rename(GP_Pnt) gp_Pnt;
%rename(GP_Trsf) gp_Trsf;
%rename(GP_Quaternion) gp_Quaternion;
%rename(GP_Circ) gp_Circ;
%rename(GP_GTrsf2d) gp_GTrsf2d;

//%include "__config"
//%include "version"
//%include "local_cstddef"
//%include "type_traits"
//%include "Standard_Std.hxx"
%include "Standard_Address.hxx"
%include "Standard_math.hxx"
%include "Standard_TypeDef.hxx"
%include "Standard_Macro.hxx"

%include "Standard_DefineAlloc.hxx"
%include "Standard.hxx"
%include "Standard_PrimitiveTypes.hxx"
%include "gp_XYZ.hxx"
%include "gp_Pnt.hxx"
%include "gp_Trsf.hxx"
%include "gp_Quaternion.hxx"
%include "gp_Circ.hxx"
%include "gp_GTrsf2d.hxx"

%include "Standard_Transient.hxx"


%include "Patched_Standard_Handle.hxx" // NOTE! patched!
%include "Standard_Type.hxx"
%include "TopAbs.hxx"
%include "TopAbs_ShapeEnum.hxx"
%include "TopoDS_ListOfShape.hxx"
%include "TopoDS_TShape.hxx"
%include "TopoDS_Shape.hxx"
%include "TopoDS_Face.hxx"
%include "TopoDS_Edge.hxx"
%include "TopoDS_Vertex.hxx"
%include "TopLoc_Location.hxx"
%include "TopoDS_Iterator.hxx"
%include "TopExp_Explorer.hxx"

%include "BRepPrim_Wedge.hxx"
%include "BRepBuilderAPI_MakeShape.hxx"
%include "Standard_Real.hxx"
%include "BRepPrimAPI_MakeBox.hxx"


%include "Geom_Geometry.hxx"
%include "Geom_Surface.hxx"
%include "BRep_Tool.hxx"

%include "STEPControl_Reader.hxx"

%include "experiment-cc-code.hxx"


%{
#include <type_traits>
#include "Standard_Std.hxx"
#include "Standard_Address.hxx"
#include "Standard_math.hxx"
#include "Standard_TypeDef.hxx"
#include "gp_XYZ.hxx"
#include "gp_Pnt.hxx"
#include "gp_Trsf.hxx"
#include "gp_Quaternion.hxx"
#include "gp_Circ.hxx"
#include "gp_GTrsf2d.hxx"


#include "Standard_Handle.hxx"
#include "Standard_Type.hxx"
#include "TopAbs.hxx"
#include "TopAbs_ShapeEnum.hxx"
#include "TopoDS_ListOfShape.hxx"
#include "TopoDS_TShape.hxx"
#include "TopoDS_Shape.hxx"
#include "TopoDS_Face.hxx"
#include "TopoDS_Edge.hxx"
#include "TopoDS_Vertex.hxx"
#include "TopLoc_Location.hxx"
#include "TopoDS_Iterator.hxx"
#include "TopExp_Explorer.hxx"

#include "BRepPrim_Wedge.hxx"
#include "BRepBuilderAPI_MakeShape.hxx"
#include "BRepPrimAPI_MakeBox.hxx"

#include "Standard_Handle.hxx"
#include "Standard_Type.hxx"
#include "TopAbs.hxx"
#include "TopAbs_ShapeEnum.hxx"
#include "TopoDS_ListOfShape.hxx"
#include "TopoDS_TShape.hxx"
#include "TopoDS_Shape.hxx"
#include "TopoDS_Face.hxx"
#include "TopLoc_Location.hxx"

#include "BRep_Tool.hxx"
#include "Geom_Geometry.hxx"
#include "Geom_Surface.hxx"

#include "STEPControl_Reader.hxx"
#include "experiment-cc-code.hxx"
%}

// load the native library
%pragma(java) jniclasscode=%{
	static
	{
		System.load("/Users/nyholku/swig-experiments/bin/experiment.dylib");
	}
%}
