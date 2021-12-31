
%module experimentModule

%include <occ_handle.i>
//%include <gp.i>





//%rename(double) Standard_Real;

%occ_handle(Standard_Transient)
%occ_handle(Base)
%occ_handle(Derived)
%occ_handle(Geom_Surface)
%occ_handle(TopoDS_TShape)
%occ_handle(Standard_Type)
%occ_handle(Geom_Geometry)
%occ_handle(Geom_Curve)
%occ_handle(Geom_BoundedCurve)
%occ_handle(Geom_TrimmedCurve)

//%occ_handle(BRepPrim_Wedge)
//%occ_handle(BRepPrimAPI_MakeBox)

%rename(GP_XYZ) gp_XYZ;
%rename(GP_Pnt) gp_Pnt;
%rename(GP_Dir) gp_Dir;
%rename(GP_Vec) gp_Vec;
%rename(GP_Ax1) gp_Ax1;
%rename(GP_Ax2) gp_Ax2;
%rename(GP_Ax3) gp_Ax3;
%rename(GP_Ax2d) gp_Ax2d;
%rename(GP_Ax22d) gp_Ax22d;
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
%include "gp_Dir.hxx"
%include "gp_Vec.hxx"
%include "gp_Ax1.hxx"
%include "gp_Ax2.hxx"
%include "gp_Ax3.hxx"
%include "gp_Ax2d.hxx"
%include "gp_Ax22d.hxx"
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
%include "TopoDS_Wire.hxx"
%include "TopLoc_Location.hxx"
%include "TopoDS_Iterator.hxx"
%include "TopExp_Explorer.hxx"

%include "BRepPrim_Wedge.hxx"
%include "BRepBuilderAPI_MakeShape.hxx"
%include "Standard_Real.hxx"
%include "BRepPrimAPI_MakeBox.hxx"
%include "BRepBuilderAPI_MakeEdge.hxx"
%include "BRepBuilderAPI_MakeWire.hxx"
%include "BRepBuilderAPI_Transform.hxx"
%include "BRepBuilderAPI_MakeFace.hxx"
%include "BRepFilletAPI_MakeFillet.hxx"
%include "BRepPrimAPI_MakePrism.hxx"

%include "BRep_Tool.hxx"


%include "Geom_Geometry.hxx"
%include "Geom_Surface.hxx"
%include "Geom_Curve.hxx"
%include "Geom_BoundedCurve.hxx"
%include "Geom_TrimmedCurve.hxx"
%include "GC_MakeArcOfCircle.hxx"
%include "GC_MakeSegment.hxx"

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
#include "gp_Dir.hxx"
#include "gp_Vec.hxx"
#include "gp_Ax1.hxx"
#include "gp_Ax2.hxx"
#include "gp_Ax3.hxx"
#include "gp_Ax2d.hxx"
#include "gp_Ax22d.hxx"
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
#include "TopoDS_Wire.hxx"
#include "TopLoc_Location.hxx"
#include "TopoDS_Iterator.hxx"
#include "TopExp_Explorer.hxx"

#include "BRepPrim_Wedge.hxx"
#include "BRepBuilderAPI_MakeShape.hxx"
#include "BRepPrimAPI_MakeBox.hxx"
#include "BRepBuilderAPI_MakeEdge.hxx"
#include "BRepBuilderAPI_MakeWire.hxx"
#include "BRepBuilderAPI_Transform.hxx"
#include "BRepBuilderAPI_MakeFace.hxx"
#include "BRepFilletAPI_MakeFillet.hxx"
#include "BRepPrimAPI_MakePrism.hxx"


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
#include "Geom_Curve.hxx"
#include "Geom_BoundedCurve.hxx"
#include "Geom_TrimmedCurve.hxx"
#include "GC_MakeArcOfCircle.hxx"
#include "GC_MakeSegment.hxx"

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
