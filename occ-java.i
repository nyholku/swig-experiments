
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
// #include all the files the C++ wrapper needs
%{
#include <type_traits>
#include "Standard_Std.hxx"
#include "Standard_Address.hxx"
#include "Standard_math.hxx"
#include "Standard_TypeDef.hxx"
#include "Standard_Type.hxx"
#include "Standard_Handle.hxx"
#include "NCollection_List.hxx"
#include "TopTools_ListOfShape.hxx"
%}

//-----------------------------------------------------------------------------
// Propagate all OCC exceptions to Java
%exception  {
    try {
        $action
    } catch (Standard_Failure ex) {
       std::cerr << ex.GetMessageString() << std::endl;
        SWIG_JavaThrowException(jenv, SWIG_JavaRuntimeException, Standard_Failure::Caught()->DynamicType()->Name());
    }
}

//-----------------------------------------------------------------------------
//
%include <occ_handle.i>

%occ_handle(Standard_Type)

%include "Standard_Address.hxx"
%include "Standard_math.hxx"
%include "Standard_TypeDef.hxx"
%include "Standard_Macro.hxx"
%include "Standard_DefineAlloc.hxx"
%include "Standard.hxx"
%include "Standard_PrimitiveTypes.hxx"


%include "Standard.i"
%include "TopoDS.i"

OCC_TRANSIENT(Standard_Transient)
OCC_TRANSIENT(Patched_Standard_Handle)

%include "Standard_Type.hxx"

//-----------------------------------------------------------------------------
//
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



OCC_ROOT(TopAbs)
OCC_ROOT(TopAbs_ShapeEnum)
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


%include "NCollection_List.hxx"
%include "TopTools_ListOfShape.hxx"
%template(TopTools_ListOfShape) NCollection_List<TopoDS_Shape>;

OCC_TRANSIENT(TopoDS_TShape)
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


//-----------------------------------------------------------------------------
//
%typemap(javaout) opencascade::handle<Geom_Surface>, opencascade::handle<Geom_Surface>* {
    long cPtr = $jnicall;
    return (Geom_Surface)Standard_Transient.downcastHandle(cPtr, Geom_Surface.class);
}

//-----------------------------------------------------------------------------



OCC_ROOT(GC_Root)
OCC_ROOT(GCE2d_Root)
OCC_ROOT(GC_MakeArcOfCircle)
OCC_ROOT(GC_MakeSegment)
OCC_ROOT(GCE2d_MakeSegment)

OCC_ROOT(BRepBuilderAPI_Command)
OCC_ROOT(BRepBuilderAPI_MakeShape)
OCC_ROOT(BOPAlgo_Options)
OCC_ROOT(BRepAlgoAPI_Algo)
OCC_ROOT(BRepAlgoAPI_BuilderAlgo)
OCC_ROOT(BRepAlgoAPI_BooleanOperation)
OCC_ROOT(BRepBuilderAPI_ModifyShape)
OCC_ROOT(BRepBuilderAPI_MakeEdge)
OCC_ROOT(BRepBuilderAPI_MakeWire)
OCC_ROOT(BRepBuilderAPI_Transform)
OCC_ROOT(BRepBuilderAPI_MakeFace)

OCC_ROOT(BRepPrim_GWedge)
OCC_ROOT(BRepPrimAPI_MakeBox)
OCC_ROOT(BRepPrimAPI_MakeSweep)
OCC_ROOT(BRepPrimAPI_MakePrism)
OCC_ROOT(BRepPrimAPI_MakeOneAxis)
OCC_ROOT(BRepPrimAPI_MakeCylinder)
OCC_ROOT(BRepAlgoAPI_Fuse)
OCC_ROOT(BRepOffsetAPI_MakeOffsetShape)
OCC_ROOT(BRepOffsetAPI_MakeThickSolid)
OCC_ROOT(BRepOffsetAPI_ThruSections)
OCC_ROOT(BRepFilletAPI_LocalOperation)
OCC_ROOT(BRepFilletAPI_MakeFillet)

OCC_ROOT(BRep_Tool)
OCC_ROOT(BRepLib)
OCC_ROOT(BRepTools)

OCC_ROOT(TopoDS_Builder)
OCC_ROOT(BRep_Builder)

OCC_ROOT(XSControl_Reader)
OCC_ROOT(STEPControl_Reader)
OCC_ROOT(STEPControl_StepModelType)
OCC_ROOT(STEPControl_Writer)
OCC_ROOT(IGESControl_Reader)

//-----------------------------------------------------------------------------
// Insert Java code to load the native library
%pragma(java) jniclasscode=%{
	static
	{
		System.load("/Users/nyholku/swig-experiments/bin/libOccJava.dylib");
	}
%}
