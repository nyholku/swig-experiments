
%module OccJava

//-----------------------------------------------------------------------------
%define OCC_TRANSIENT(classname)

%occ_handle(classname)

%{
#include "classname.hxx"
%}

%include "classname.hxx"

%enddef
//-----------------------------------------------------------------------------

%define OCC_ROOT(classname)

%{
#include "classname.hxx"
%}

%include "classname.hxx"

%enddef
//-----------------------------------------------------------------------------

%{ // #include all the files the C++ wrapper needs
#include <type_traits>
#include "Standard_Std.hxx"
#include "Standard_Address.hxx"
#include "Standard_math.hxx"
#include "Standard_TypeDef.hxx"
#include "Standard_Handle.hxx"
#include "Standard_Type.hxx"
#include "gp_XYZ.hxx"
#include "gp_Pln.hxx"
#include "gp_Pnt.hxx"
#include "gp_Dir.hxx"
#include "gp_Pnt2d.hxx"
#include "gp_Dir2d.hxx"
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
#include "gp_Cylinder.hxx"
#include "gp_Elips2d.hxx"

#include "Standard_Handle.hxx"
#include "NCollection_List.hxx"
#include "TopTools_ListOfShape.hxx"
#include "TopAbs.hxx"
#include "TopAbs_ShapeEnum.hxx"
#include "TopoDS_TShape.hxx"
#include "TopoDS_Shape.hxx"
#include "TopoDS_Face.hxx"
#include "TopoDS_Shell.hxx"
#include "TopoDS_Edge.hxx"
#include "TopoDS_Vertex.hxx"
#include "TopoDS_Wire.hxx"
#include "TopLoc_Location.hxx"
#include "TopoDS_Iterator.hxx"
#include "TopExp_Explorer.hxx"
#include "TopoDS_Compound.hxx"
#include "TopoDS_Builder.hxx"

#include "TopAbs.hxx"
#include "TopAbs_ShapeEnum.hxx"
#include "TopoDS_ListOfShape.hxx"
#include "TopoDS_TShape.hxx"
#include "TopLoc_Location.hxx"

#include "GC_MakeArcOfCircle.hxx"
#include "GC_MakeSegment.hxx"
#include "GCE2d_Root.hxx"
#include "GCE2d_MakeSegment.hxx"

#include "XSControl_Reader.hxx"
#include "STEPControl_Reader.hxx"
#include "STEPControl_StepModelType.hxx"
#include "STEPControl_Writer.hxx"
#include "IGESControl_Reader.hxx"

%}

%exception  {
    try {
        $action
    } catch (Standard_Failure ex) {
       std::cerr << ex.GetMessageString() << std::endl;
        SWIG_JavaThrowException(jenv, SWIG_JavaRuntimeException, Standard_Failure::Caught()->DynamicType()->Name());
    }
}

%include <occ_handle.i>

%occ_handle(Standard_Transient)
%occ_handle(Geom_Geometry)
%occ_handle(Geom_Surface)
%occ_handle(Geom_ElementarySurface)
%occ_handle(Geom_CylindricalSurface)
%occ_handle(Geom_Plane)
%occ_handle(TopoDS_TShape)
%occ_handle(Standard_Type)
%occ_handle(Geom_Curve)
%occ_handle(Geom_BoundedCurve)
%occ_handle(Geom_TrimmedCurve)
%occ_handle(Geom2d_Geometry)
%occ_handle(Geom2d_Curve)
%occ_handle(Geom2d_Conic)
%occ_handle(Geom2d_Ellipse)
%occ_handle(Geom2d_BoundedCurve)
%occ_handle(Geom2d_TrimmedCurve)
%occ_handle(NCollection_BaseAllocator)

//%occ_handle(BRepPrim_Wedge)
//%occ_handle(BRepPrimAPI_MakeBox)

%rename(GP_XYZ) gp_XYZ;
%rename(GP_Pln) gp_Pln;
%rename(GP_Pnt) gp_Pnt;
%rename(GP_Dir) gp_Dir;
%rename(GP_Pnt2d) gp_Pnt2d;
%rename(GP_Dir2d) gp_Dir2d;
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
%rename(GP_Cylinder) gp_Cylinder;
%rename(GP_Elips2d) gp_Elips2d;

%include "Standard_Address.hxx"
%include "Standard_math.hxx"
%include "Standard_TypeDef.hxx"
%include "Standard_Macro.hxx"

%include "Standard_DefineAlloc.hxx"
%include "Standard.hxx"
%include "Standard_PrimitiveTypes.hxx"

%include "gp_XYZ.hxx"
%include "gp_Pln.hxx"
%include "gp_Pnt.hxx"
%include "gp_Dir.hxx"
%include "gp_Pnt2d.hxx"
%include "gp_Dir2d.hxx"
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
%include "gp_Cylinder.hxx"
%include "gp_Elips2d.hxx"

%include "Standard.i"

class Geom_Surface;

%typemap(javaout) opencascade::handle<Geom_Surface>,opencascade::handle<Geom_Surface>* {
    long cPtr = $jnicall;
    return (Geom_Surface)Standard_Transient.downcastHandle(cPtr, Geom_Surface.class);
}

%include "TopoDS.i"
OCC_TRANSIENT(Standard_Transient)
OCC_TRANSIENT(Patched_Standard_Handle)

%include "Standard_Type.hxx"

%include "TopoDS_Shape.hxx"
%include "TopAbs.hxx"
%include "TopAbs_ShapeEnum.hxx"
%include "TopoDS_TShape.hxx"
%include "TopoDS_Shape.hxx"
%include "TopoDS_Solid.hxx"
%include "TopoDS_CompSolid.hxx"
%include "TopoDS_Face.hxx"
%include "TopoDS_Shell.hxx"
%include "TopoDS_Edge.hxx"
%include "TopoDS_Vertex.hxx"
%include "TopoDS_Wire.hxx"
%include "TopLoc_Location.hxx"
%include "TopoDS_Iterator.hxx"
%include "TopExp_Explorer.hxx"
%include "TopoDS_Compound.hxx"
%include "TopoDS_Builder.hxx"


%include "NCollection_List.hxx"
%include "TopTools_ListOfShape.hxx"
%template(TopTools_ListOfShape) NCollection_List<TopoDS_Shape>;





%rename(getShape) BRepBuilderAPI_MakeShape::operator TopoDS_Shape();

%include "Standard_Real.hxx"
%rename(getShell) BRepPrimAPI_MakeBox::operator TopoDS_Shell();
%rename(getSolid) BRepPrimAPI_MakeBox::operator TopoDS_Solid();
%rename(getEdge) BRepBuilderAPI_MakeEdge::operator TopoDS_Edge();
%rename(getWire) BRepBuilderAPI_MakeWire::operator TopoDS_Wire();
%rename(getFace) BRepBuilderAPI_MakeFace::operator TopoDS_Face();


%rename(getShell) BRepPrimAPI_MakeOneAxis::operator TopoDS_Shell();
%rename(getFace) BRepPrimAPI_MakeOneAxis::operator TopoDS_Face();
%rename(getSolid) BRepPrimAPI_MakeOneAxis::operator TopoDS_Solid();

%include "NCollection_BaseAllocator.hxx"
%include "Standard_Integer.hxx"
%include "Standard_Boolean.hxx"

OCC_ROOT(BRepBuilderAPI_Command)
OCC_ROOT(BRepBuilderAPI_MakeShape)

OCC_ROOT(BRepPrim_GWedge)
OCC_ROOT(BRepPrimAPI_MakeSweep)
OCC_ROOT(BRepPrimAPI_MakeOneAxis)
OCC_ROOT(BRepAlgoAPI_Algo)
OCC_ROOT(BRepAlgoAPI_BuilderAlgo)
OCC_ROOT(BRepAlgoAPI_BooleanOperation)
OCC_ROOT(BRepBuilderAPI_ModifyShape)
OCC_ROOT(BRepFilletAPI_LocalOperation)
OCC_ROOT(BRepBuilderAPI_MakeEdge)
OCC_ROOT(BRepBuilderAPI_MakeWire)
OCC_ROOT(BRepBuilderAPI_Transform)
OCC_ROOT(BRepBuilderAPI_MakeFace)
OCC_ROOT(BRepPrimAPI_MakeBox)
OCC_ROOT(BRepPrimAPI_MakePrism)
OCC_ROOT(BRepPrimAPI_MakeCylinder)
OCC_ROOT(BRepAlgoAPI_Fuse)
OCC_ROOT(BRepOffsetAPI_MakeOffsetShape)
OCC_ROOT(BRepOffsetAPI_MakeThickSolid)
OCC_ROOT(BRepOffsetAPI_ThruSections)
OCC_ROOT(BRepPrim_Wedge)
OCC_ROOT(BRep_Builder)
OCC_ROOT(BRepFilletAPI_MakeFillet)
OCC_ROOT(BRepLib)
OCC_ROOT(BRepTools)
OCC_ROOT(BRep_Tool)



OCC_TRANSIENT(Geom_Geometry)
OCC_TRANSIENT(Geom_Surface)
OCC_TRANSIENT(Geom_ElementarySurface)
OCC_TRANSIENT(Geom_CylindricalSurface)
OCC_TRANSIENT(Geom_Plane)
OCC_TRANSIENT(Geom_Curve)
OCC_TRANSIENT(Geom_BoundedCurve)
OCC_TRANSIENT(Geom_TrimmedCurve)
OCC_TRANSIENT(Geom2d_Geometry)
OCC_TRANSIENT(Geom2d_Curve)
OCC_TRANSIENT(Geom2d_Conic)
OCC_TRANSIENT(Geom2d_Ellipse)
OCC_TRANSIENT(Geom2d_BoundedCurve)
OCC_TRANSIENT(Geom2d_TrimmedCurve)

%include "GC_MakeArcOfCircle.hxx"
%include "GC_MakeSegment.hxx"
%include "GCE2d_Root.hxx"
%include "GCE2d_MakeSegment.hxx"

%include "XSControl_Reader.hxx"
%include "STEPControl_Reader.hxx"
%include "STEPControl_StepModelType.hxx"
%include "STEPControl_Writer.hxx"
%include "IGESControl_Reader.hxx"
%include "BRepLib.hxx"
%include "BRepTools.hxx"


// load the native library
%pragma(java) jniclasscode=%{
	static
	{
		System.load("/Users/nyholku/swig-experiments/bin/libOccJava.dylib");
	}
%}
