
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
%define OCC_ROOT(classname)

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

%{ // #include all the files the C++ wrapper needs
#include <type_traits>
#include "Standard_Std.hxx"
#include "Standard_Address.hxx"
#include "Standard_math.hxx"
#include "Standard_TypeDef.hxx"
#include "Standard_Handle.hxx"
#include "Standard_Type.hxx"


#include "Standard_Handle.hxx"
#include "NCollection_List.hxx"
#include "TopTools_ListOfShape.hxx"

#include "TopoDS_ListOfShape.hxx"
%}

//-----------------------------------------------------------------------------
%exception  {
    try {
        $action
    } catch (Standard_Failure ex) {
       std::cerr << ex.GetMessageString() << std::endl;
        SWIG_JavaThrowException(jenv, SWIG_JavaRuntimeException, Standard_Failure::Caught()->DynamicType()->Name());
    }
}

//-----------------------------------------------------------------------------
%include <occ_handle.i>

%occ_handle(Standard_Transient)
%occ_handle(Geom_Geometry)
%occ_handle(Geom_Surface)
%occ_handle(Geom_ElementarySurface)
%occ_handle(Geom_CylindricalSurface)
%occ_handle(Geom_Plane)
%occ_handle(TopoDS_TShape)
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

%occ_handle(Standard_Type)

%include "Standard_Address.hxx"
%include "Standard_math.hxx"
%include "Standard_TypeDef.hxx"
%include "Standard_Macro.hxx"

%include "Standard_DefineAlloc.hxx"
%include "Standard.hxx"
%include "Standard_PrimitiveTypes.hxx"

OCC_GP(XYZ)
OCC_GP(Pln)
OCC_GP(Pnt)
OCC_GP(Dir)
OCC_GP(Pnt2d)
OCC_GP(Dir2d)
OCC_GP(Vec)
OCC_GP(Ax1)
OCC_GP(Ax2)
OCC_GP(Ax3)
OCC_GP(Ax2d)
OCC_GP(Ax22d)
OCC_GP(Trsf)
OCC_GP(Quaternion)
OCC_GP(Circ)
OCC_GP(GTrsf2d)
OCC_GP(Cylinder)
OCC_GP(Elips2d)

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

OCC_ROOT(TopAbs)
OCC_ROOT(TopAbs_ShapeEnum)
OCC_ROOT(TopoDS_TShape)
OCC_ROOT(TopoDS_Shape)
OCC_ROOT(TopoDS_Solid)
OCC_ROOT(TopoDS_CompSolid)
OCC_ROOT(TopoDS_Face)
OCC_ROOT(TopoDS_Shell)
OCC_ROOT(TopoDS_Edge)
OCC_ROOT(TopoDS_Vertex)
OCC_ROOT(TopoDS_Wire)
OCC_ROOT(TopLoc_Location)
OCC_ROOT(TopoDS_Iterator)
OCC_ROOT(TopExp_Explorer)
OCC_ROOT(TopoDS_Compound)
OCC_ROOT(TopoDS_Builder)


%include "NCollection_List.hxx"
%include "TopTools_ListOfShape.hxx"
%template(TopTools_ListOfShape) NCollection_List<TopoDS_Shape>;

%rename(getShape) BRepBuilderAPI_MakeShape::operator TopoDS_Shape();
%rename(getShell) BRepPrimAPI_MakeBox::operator TopoDS_Shell();
%rename(getSolid) BRepPrimAPI_MakeBox::operator TopoDS_Solid();
%rename(getEdge) BRepBuilderAPI_MakeEdge::operator TopoDS_Edge();
%rename(getWire) BRepBuilderAPI_MakeWire::operator TopoDS_Wire();
%rename(getFace) BRepBuilderAPI_MakeFace::operator TopoDS_Face();
%rename(getShell) BRepPrimAPI_MakeOneAxis::operator TopoDS_Shell();
%rename(getFace) BRepPrimAPI_MakeOneAxis::operator TopoDS_Face();
%rename(getSolid) BRepPrimAPI_MakeOneAxis::operator TopoDS_Solid();


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

OCC_ROOT(GC_MakeArcOfCircle)
OCC_ROOT(GC_MakeSegment)
OCC_ROOT(GCE2d_Root)
OCC_ROOT(GCE2d_MakeSegment)
OCC_ROOT(XSControl_Reader)
OCC_ROOT(STEPControl_Reader)
OCC_ROOT(STEPControl_StepModelType)
OCC_ROOT(STEPControl_Writer)
OCC_ROOT(IGESControl_Reader)
OCC_ROOT(BRepLib)
OCC_ROOT(BRepTools)


// load the native library
%pragma(java) jniclasscode=%{
	static
	{
		System.load("/Users/nyholku/swig-experiments/bin/libOccJava.dylib");
	}
%}
