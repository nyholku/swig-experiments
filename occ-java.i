
%module OccJava

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

#include "GC_Root.hxx"
#include "BRepPrim_GWedge.hxx"
#include "BRepPrimAPI_MakeSweep.hxx"
#include "BRepPrimAPI_MakeOneAxis.hxx"
#include "BRepAlgoAPI_Algo.hxx"
#include "BRepAlgoAPI_BuilderAlgo.hxx"
#include "BRepAlgoAPI_BooleanOperation.hxx"
#include "BRepOffsetAPI_MakeOffsetShape.hxx"
#include "BRepOffsetAPI_MakeThickSolid.hxx"
#include "BRepOffsetAPI_ThruSections.hxx"


#include "BRepPrim_Wedge.hxx"
#include "BRepBuilderAPI_Command.hxx"
#include "BRepBuilderAPI_MakeShape.hxx"
#include "BRepBuilderAPI_ModifyShape.hxx"
#include "BRepFilletAPI_LocalOperation.hxx"
#include "BRepPrimAPI_MakeBox.hxx"
#include "BRepBuilderAPI_MakeEdge.hxx"
#include "BRepBuilderAPI_MakeWire.hxx"
#include "BRepBuilderAPI_Transform.hxx"
#include "BRepBuilderAPI_MakeFace.hxx"
#include "BRep_Builder.hxx"
#include "BRepFilletAPI_MakeFillet.hxx"
#include "BRepPrimAPI_MakePrism.hxx"
#include "BRepPrimAPI_MakeCylinder.hxx"
#include "BRepAlgoAPI_Fuse.hxx"

#include "TopAbs.hxx"
#include "TopAbs_ShapeEnum.hxx"
#include "TopoDS_ListOfShape.hxx"
#include "TopoDS_TShape.hxx"
#include "TopLoc_Location.hxx"

#include "BRep_Tool.hxx"
#include "Geom_Geometry.hxx"
#include "Geom_Surface.hxx"
#include "Geom_ElementarySurface.hxx"
#include "Geom_CylindricalSurface.hxx"
#include "Geom_Plane.hxx"
#include "Geom_Curve.hxx"
#include "Geom_BoundedCurve.hxx"
#include "Geom_TrimmedCurve.hxx"
#include "GC_MakeArcOfCircle.hxx"
#include "GC_MakeSegment.hxx"
#include "GCE2d_Root.hxx"
#include "GCE2d_MakeSegment.hxx"

#include "Geom2d_Geometry.hxx"
#include "Geom2d_Curve.hxx"
#include "Geom2d_Conic.hxx"
#include "Geom2d_Ellipse.hxx"
#include "Geom2d_BoundedCurve.hxx"
#include "Geom2d_TrimmedCurve.hxx"

#include "XSControl_Reader.hxx"
#include "STEPControl_Reader.hxx"
#include "STEPControl_StepModelType.hxx"
#include "STEPControl_Writer.hxx"
#include "IGESControl_Reader.hxx"
#include "BRepLib.hxx"
#include "BRepTools.hxx"

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

%occ_handle(Base)
%occ_handle(Derived)

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


%include "Standard_Transient.hxx"


%include "Patched_Standard_Handle.hxx" // NOTE! patched!





%include "TopoDS.i"

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

%include "GC_Root.hxx"
%include "BRepPrim_GWedge.hxx"


%include "BRepPrim_Wedge.hxx"
%rename(getShape) BRepBuilderAPI_MakeShape::operator TopoDS_Shape();

%include "BRepBuilderAPI_Command.hxx"
%include "BRepBuilderAPI_MakeShape.hxx"
%include "BRepBuilderAPI_ModifyShape.hxx"
%include "BRepFilletAPI_LocalOperation.hxx"

%include "Standard_Real.hxx"
%rename(getShell) BRepPrimAPI_MakeBox::operator TopoDS_Shell();
%rename(getSolid) BRepPrimAPI_MakeBox::operator TopoDS_Solid();
%include "BRepPrimAPI_MakeBox.hxx"
%rename(getEdge) BRepBuilderAPI_MakeEdge::operator TopoDS_Edge();
%include "BRepBuilderAPI_MakeEdge.hxx"
%rename(getWire) BRepBuilderAPI_MakeWire::operator TopoDS_Wire();
%include "BRepBuilderAPI_MakeWire.hxx"
%rename(getFace) BRepBuilderAPI_MakeFace::operator TopoDS_Face();
%include "BRepBuilderAPI_MakeFace.hxx"
%include "BRep_Builder.hxx"
%include "BRep_Builder.lxx"


%rename(getShell) BRepPrimAPI_MakeOneAxis::operator TopoDS_Shell();
%rename(getFace) BRepPrimAPI_MakeOneAxis::operator TopoDS_Face();
%rename(getSolid) BRepPrimAPI_MakeOneAxis::operator TopoDS_Solid();
%include "BRepPrimAPI_MakeOneAxis.hxx"
%include "BRepPrimAPI_MakeSweep.hxx"


%include "NCollection_BaseAllocator.hxx"
%include "Standard_Integer.hxx"
%include "Standard_Boolean.hxx"
%include "BRepBuilderAPI_MakeShape.hxx"
%include "BOPAlgo_Options.hxx"


%include "BRepAlgoAPI_Algo.hxx"
%include "BRepAlgoAPI_BuilderAlgo.hxx"
%include "BRepAlgoAPI_BooleanOperation.hxx"
%include "BRepOffsetAPI_MakeOffsetShape.hxx"
%include "BRepOffsetAPI_MakeThickSolid.hxx"
%include "BRepOffsetAPI_ThruSections.hxx"

%include "BRepBuilderAPI_Transform.hxx"
%include "BRepFilletAPI_MakeFillet.hxx"
%include "BRepPrimAPI_MakePrism.hxx"

%include "BRepPrimAPI_MakeCylinder.hxx"
%include "BRepAlgoAPI_Fuse.hxx"

%include "BRep_Tool.hxx"


%include "Geom_Geometry.hxx"
%include "Geom_Surface.hxx"
%include "Geom_ElementarySurface.hxx"
%include "Geom_CylindricalSurface.hxx"
%include "Geom_Plane.hxx"
%include "Geom_Curve.hxx"
%include "Geom_BoundedCurve.hxx"
%include "Geom_TrimmedCurve.hxx"
%include "GC_MakeArcOfCircle.hxx"
%include "GC_MakeSegment.hxx"
%include "GCE2d_Root.hxx"
%include "GCE2d_MakeSegment.hxx"

%include "Geom2d_Geometry.hxx"
%include "Geom2d_Curve.hxx"
%include "Geom2d_Conic.hxx"
%include "Geom2d_Ellipse.hxx"
%include "Geom2d_BoundedCurve.hxx"
%include "Geom2d_TrimmedCurve.hxx"

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
