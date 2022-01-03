
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


//-----------------------------------------------------------------------------
//
OCC_GP(XYZ)
OCC_GP(Pln)
OCC_GP(Pnt)
OCC_GP(Dir)
OCC_GP(Vec)
OCC_GP(Ax1)
OCC_GP(Ax2)
OCC_GP(Ax3)
OCC_GP(Ax2d)
OCC_GP(Ax22d)
OCC_GP(Trsf)
OCC_GP(Quaternion)
OCC_GP(Circ)
OCC_GP(Cylinder)
OCC_GP(Cone)
OCC_GP(Elips)
OCC_GP(EulerSequence)
OCC_GP(Hypr)
OCC_GP(Lin)
OCC_GP(Mat)
OCC_GP(Parab)
OCC_GP(Sphere)
OCC_GP(Torus)
OCC_GP(TrsfForm)
OCC_GP(XY)
OCC_GP(Vec2d)
OCC_GP(Circ2d)
OCC_GP(Hypr2d)
OCC_GP(Parab2d)
OCC_GP(Elips2d)
OCC_GP(GTrsf2d)
OCC_GP(Pnt2d)
OCC_GP(Dir2d)
OCC_GP(Lin2d)
OCC_GP(Mat2d)
OCC_GP(Trsf2d)


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



OCC_TRANSIENT(TopoDS_TShape)

OCC_TRANSIENT(Poly_Polygon2D)
OCC_TRANSIENT(Poly_Polygon3D)

OCC_TRANSIENT(Message_Alert)
OCC_TRANSIENT(Message_Report)
OCC_TRANSIENT(Poly_PolygonOnTriangulation)
OCC_TRANSIENT(BRepTools_History)
OCC_TRANSIENT(Message_Messenger)

OCC_TRANSIENT(Poly_Triangulation)
        OCC_TRANSIENT(RWMesh_TriangulationSource)
                OCC_TRANSIENT(RWGltf_GltfLatePrimitiveArray)

// hierarchy checks +++
OCC_TRANSIENT(Geom_Geometry)
        OCC_TRANSIENT(Geom_Curve)
                OCC_TRANSIENT(Geom_BoundedCurve)
                        OCC_TRANSIENT(Geom_BSplineCurve)
                        OCC_TRANSIENT(Geom_BezierCurve)
                        OCC_TRANSIENT(Geom_TrimmedCurve)
                OCC_TRANSIENT(Geom_Conic)
                        OCC_TRANSIENT(Geom_Circle)
                        OCC_TRANSIENT(Geom_Ellipse)
                        OCC_TRANSIENT(Geom_Hyperbola)
                        OCC_TRANSIENT(Geom_Parabola)
                OCC_TRANSIENT(Geom_Line)
                OCC_TRANSIENT(Geom_OffsetCurve)
                OCC_TRANSIENT(ShapeExtend_ComplexCurve)
        OCC_TRANSIENT(Geom_Surface)
                OCC_TRANSIENT(Geom_ElementarySurface)
                        OCC_TRANSIENT(Geom_ConicalSurface)
                        OCC_TRANSIENT(Geom_CylindricalSurface)
                        OCC_TRANSIENT(Geom_Plane)
                        OCC_TRANSIENT(Geom_SphericalSurface)
                        OCC_TRANSIENT(Geom_ToroidalSurface)
                OCC_TRANSIENT(Geom_BoundedSurface)
                        OCC_TRANSIENT(Geom_BSplineSurface)
                        OCC_TRANSIENT(Geom_BezierSurface)
                        OCC_TRANSIENT(Geom_RectangularTrimmedSurface)
OCC_TRANSIENT(Geom2d_Geometry)
        OCC_TRANSIENT(Geom2d_AxisPlacement)
        OCC_TRANSIENT(Geom2d_Point)
                OCC_TRANSIENT(Geom2d_CartesianPoint)
        OCC_TRANSIENT(Geom2d_Curve)
                 OCC_TRANSIENT(Geom2d_BoundedCurve)
                         OCC_TRANSIENT(Geom2d_BSplineCurve)
                         OCC_TRANSIENT(Geom2d_BezierCurve)
                         OCC_TRANSIENT(Geom2d_TrimmedCurve)
               OCC_TRANSIENT(Bisector_Curve)
                        OCC_TRANSIENT(Bisector_BisecAna)
                        OCC_TRANSIENT(Bisector_BisecCC)
                        OCC_TRANSIENT(Bisector_BisecPC)
                OCC_TRANSIENT(Geom2d_Conic)
                        OCC_TRANSIENT(Geom2d_Circle)
                        OCC_TRANSIENT(Geom2d_Ellipse)
                        OCC_TRANSIENT(Geom2d_Hyperbola)
                        OCC_TRANSIENT(Geom2d_Parabola)
                OCC_TRANSIENT(Geom2d_Line)
                OCC_TRANSIENT(Geom2d_OffsetCurve)
        OCC_TRANSIENT(Geom2d_Vector)
                OCC_TRANSIENT(Geom2d_Direction)
                OCC_TRANSIENT(Geom2d_VectorWithMagnitude)

// +++ NOT IN OCC 7.6.0
//OCC_TRANSIENT(Adaptor3d_HCurve)
//        OCC_TRANSIENT(Adaptor3d_HCurveOnSurface)
//                OCC_TRANSIENT(Adaptor3d_HCurveOnSurface)
//                OCC_TRANSIENT(Adaptor3d_HIsoCurve)
//                OCC_TRANSIENT(BiTgte_HCurveOnEdge)
//                OCC_TRANSIENT(BiTgte_HCurveOnVertex)
//                OCC_TRANSIENT(BRepAdaptor_HCompCurve)
//                OCC_TRANSIENT(BRepAdaptor_HCurve)
//                OCC_TRANSIENT(ChFiDS_HElSpine)
//                OCC_TRANSIENT(GeomAdaptor_GHCurve)
//                        OCC_TRANSIENT(GeomAdaptor_HCurve)

//OCC_TRANSIENT(MMgt_TShared)
//        OCC_TRANSIENT(Adaptor3d_HSurface)
//                OCC_TRANSIENT(BRepAdaptor_HSurface)
//                OCC_TRANSIENT(GeomAdaptor_GHSurface)
//                        OCC_TRANSIENT(GeomAdaptor_HSurface)
//                OCC_TRANSIENT(GeomAdaptor_HSurfaceOfLinearExtrusion)
//                OCC_TRANSIENT(GeomAdaptor_HSurfaceOfRevolution)
//        OCC_TRANSIENT(ChFiDS_SecHArray1)

//OCC_TRANSIENT(Adaptor2d_HCurve2d)
//        OCC_TRANSIENT(Adaptor2d_HLine2d)
//        OCC_TRANSIENT(Adaptor2d_HOffsetCurve)
//        OCC_TRANSIENT(BRepAdaptor_HCurve2d)
//        OCC_TRANSIENT(Geom2dAdaptor_GHCurve)
//                OCC_TRANSIENT(Geom2dAdaptor_HCurve)
//        OCC_TRANSIENT(ProjLib_HCompProjectedCurve)
//        OCC_TRANSIENT(ProjLib_HProjectedCurve)

// --- NOT IN OCC 7.6.0

//OCC_TRANSIENT(Adaptor3d_Curve)
//        OCC_TRANSIENT(Adaptor3d_CurveOnSurface)
//        OCC_TRANSIENT(Adaptor3d_IsoCurve)
//        OCC_TRANSIENT(Adaptor3d_Surface)
//        OCC_TRANSIENT(Adaptor3d_HVertex)
//        OCC_TRANSIENT(Adaptor3d_TopolTool)

//        OCC_TRANSIENT(BRepAdaptor_CompCurve)
//        OCC_TRANSIENT(BRepAdaptor_Curve)
//        OCC_TRANSIENT(BiTgte_CurveOnEdge)
//        OCC_TRANSIENT(BiTgte_CurveOnVertex)
//        OCC_TRANSIENT(ChFiDS_ElSpine)
//        OCC_TRANSIENT(GeomAdaptor_Curve)
 //       OCC_ROOT(GeomFill_SngliFunc)
//        OCC_TRANSIENT(ProjLib_ProjectOnPlane)


OCC_TRANSIENT(Adaptor2d_Curve2d)
        OCC_TRANSIENT(Adaptor2d_Line2d)
        OCC_TRANSIENT(Adaptor2d_OffsetCurve)
        OCC_TRANSIENT(Geom2dAdaptor_Curve)
                OCC_TRANSIENT(BRepAdaptor_Curve2d)
        OCC_TRANSIENT(ProjLib_CompProjectedCurve)
        OCC_TRANSIENT(ProjLib_ProjectedCurve)

OCC_ROOT(Adaptor3d_HSurfaceTool)

//-----------------------------------------------------------------------------
//
%typemap(javaout) opencascade::handle<Geom_Surface>, opencascade::handle<Geom_Surface>* {
    long cPtr = $jnicall;
    return (Geom_Surface)Standard_Transient.downcastHandle(cPtr, Geom_Surface.class);
}

//-----------------------------------------------------------------------------

OCC_ROOT(Adaptor3d_HSurfaceTool)
OCC_ROOT(math_Function)
        OCC_ROOT(math_FunctionWithDerivative)
                OCC_ROOT(Adaptor3d_InterFunc)

OCC_ROOT(Bisector_PolyBis)
OCC_ROOT(ChFiDS_CircSection)

OCC_ROOT(GC_Root)
OCC_ROOT(GCE2d_Root)
OCC_ROOT(GC_MakeArcOfCircle)
OCC_ROOT(GC_MakeSegment)
OCC_ROOT(GCE2d_MakeSegment)


OCC_ROOT(BRepBuilderAPI_EdgeError)
OCC_ROOT(BRepBuilderAPI_FaceError)
OCC_ROOT(BRepBuilderAPI_WireError)

OCC_ROOT(BRepBuilderAPI_Command)
OCC_ROOT(BRepBuilderAPI_MakeShape)
OCC_ROOT(BOPAlgo_Options)
OCC_ROOT(BOPAlgo_GlueEnum)
OCC_ROOT(BOPAlgo_Operation)
//OCC_ROOT(BOPAlgo_PaveFiller)
OCC_ROOT(BOPAlgo_PBuilder)
//OCC_ROOT(BOPAlgo_PPaveFiller)
OCC_ROOT(BRepAlgoAPI_Algo)
OCC_ROOT(BRepAlgoAPI_BuilderAlgo)
OCC_ROOT(BRepAlgoAPI_BooleanOperation)
OCC_ROOT(BRepBuilderAPI_ModifyShape)
OCC_ROOT(BRepBuilderAPI_MakeEdge)
OCC_ROOT(BRepBuilderAPI_MakeWire)
OCC_ROOT(BRepBuilderAPI_Transform)
OCC_ROOT(BRepBuilderAPI_MakeFace)


OCC_ROOT(BRepPrim_Builder)
//OCC_ROOT(BRepPrim_Builder.lxx

OCC_ROOT(BRepPrim_OneAxis)
        OCC_ROOT(BRepPrim_Revolution)
                OCC_ROOT(BRepPrim_Torus)
                OCC_ROOT(BRepPrim_Cone)
                OCC_ROOT(BRepPrim_Cylinder)
                OCC_ROOT(BRepPrim_Sphere)

OCC_ROOT(BRepPrim_FaceBuilder)

OCC_ROOT(BRepPrim_GWedge)
        OCC_ROOT(BRepPrim_Wedge)

OCC_ROOT(BRepBuilderAPI_Command)
        OCC_ROOT(BRepBuilderAPI_MakeShape)
                OCC_ROOT(BRepPrimAPI_MakeOneAxis)
                        OCC_ROOT(BRepPrimAPI_MakeCone)
                        OCC_ROOT(BRepPrimAPI_MakeCylinder)
                        OCC_ROOT(BRepPrimAPI_MakeSphere)
                        OCC_ROOT(BRepPrimAPI_MakeTorus)
                        OCC_ROOT(BRepPrimAPI_MakeRevolution)
        OCC_ROOT(BRepPrimAPI_MakeHalfSpace)
        OCC_ROOT(BRepPrimAPI_MakeSweep)
                OCC_ROOT(BRepPrimAPI_MakeRevol)
                OCC_ROOT(BRepPrimAPI_MakeBox)
                OCC_ROOT(BRepPrimAPI_MakePrism)
        OCC_ROOT(BRepPrimAPI_MakeWedge)

OCC_ROOT(BRepPrimAPI_MakeBox)
OCC_ROOT(BRepPrimAPI_MakeSweep)
OCC_ROOT(BRepPrimAPI_MakePrism)
OCC_ROOT(BRepPrimAPI_MakeOneAxis)
OCC_ROOT(BRepPrimAPI_MakeCylinder)
OCC_ROOT(BRepAlgoAPI_Fuse)
//OCC_ROOT(BRepOffset_MakeOffset)
OCC_ROOT(BRepOffsetAPI_MakeOffsetShape)
OCC_ROOT(BRepOffsetAPI_MakeThickSolid)
OCC_ROOT(BRepOffsetAPI_ThruSections)
OCC_ROOT(BRepFilletAPI_LocalOperation)
OCC_ROOT(BRepFilletAPI_MakeFillet)

OCC_ROOT(BRepSweep_Prism)
OCC_ROOT(BRepSweep_Revol)

OCC_ROOT(BRep_Tool)
OCC_ROOT(BRepLib)
OCC_ROOT(BRepTools)
OCC_TRANSIENT(BRepTools_ReShape)

OCC_ROOT(TopoDS_Builder)
OCC_ROOT(BRep_Builder)

OCC_ROOT(XSControl_Reader)
OCC_ROOT(STEPControl_Reader)
OCC_ROOT(STEPControl_StepModelType)
OCC_ROOT(STEPControl_Writer)
OCC_ROOT(IGESControl_Reader)

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
