import occjava.*;

public class MakeBottle {

	public static void main(String... args) {
		TopoDS_Shape shape=new TopoDS_Face();
		makeBottle(50, 70, 30);
	}

	// http://www.algotopia.com/contents/opencascade/opencascade_basic
	// https://github.com/eryar/occQt/blob/master/occQt.cpp
	// https://occtutorials.wordpress.com/page/2/
	// http://www.pythonocc.org/wp-content/uploads/2010/03/pythonocc_parametric_modeling_tutorial.pdf
	static void makeBottle(double myWidth, double myHeight, double myThickness) {
		BRepPrimAPI_MakeBox makeBox = new BRepPrimAPI_MakeBox(new GP_Pnt(0, 0, 0), new GP_Pnt(1, 1, 1));
		Geom_Surface s = BRep_Tool.Surface(Utilities.getFace(makeBox.Shell(), 0));

		GP_Pnt aPnt1 = new GP_Pnt(-myWidth / 2., 0, 0);
		GP_Pnt aPnt2 = new GP_Pnt(-myWidth / 2., -myThickness / 4., 0);
		GP_Pnt aPnt3 = new GP_Pnt(0, -myThickness / 2., 0);
		GP_Pnt aPnt4 = new GP_Pnt(myWidth / 2., -myThickness / 4., 0);
		GP_Pnt aPnt5 = new GP_Pnt(myWidth / 2., 0, 0);

		// Profile : Define the Geometry
		Geom_TrimmedCurve anArcOfCircle = new GC_MakeArcOfCircle(aPnt2, aPnt3, aPnt4).Value();
		Geom_TrimmedCurve aSegment1 = new GC_MakeSegment(aPnt1, aPnt2).Value();
		Geom_TrimmedCurve aSegment2 = new GC_MakeSegment(aPnt4, aPnt5).Value();
		// Profile : Define the Topology
		TopoDS_Edge anEdge1 = (TopoDS_Edge) (new BRepBuilderAPI_MakeEdge(aSegment1).Shape());
		TopoDS_Edge anEdge2 = (TopoDS_Edge) (new BRepBuilderAPI_MakeEdge(anArcOfCircle).Shape());
		TopoDS_Edge anEdge3 = (TopoDS_Edge) (new BRepBuilderAPI_MakeEdge(aSegment2).Shape());
		TopoDS_Wire aWire = (TopoDS_Wire) (new BRepBuilderAPI_MakeWire(anEdge1, anEdge2, anEdge3).Shape());

		// Complete Profile
		GP_Ax1 xAxis = new GP_Ax1(new GP_Pnt(0, 0, 0), new GP_Dir(1, 0, 0));
		GP_Trsf aTrsf = new GP_Trsf();
		aTrsf.SetMirror(xAxis);
		BRepBuilderAPI_Transform aBRepTrsf = new BRepBuilderAPI_Transform(aWire, aTrsf);
		TopoDS_Shape aMirroredShape = aBRepTrsf.Shape();
		TopoDS_Wire aMirroredWire = (TopoDS_Wire) aMirroredShape;
		BRepBuilderAPI_MakeWire mkWire = new BRepBuilderAPI_MakeWire();
		mkWire.Add(aWire);
		mkWire.Add(aMirroredWire);
		TopoDS_Wire myWireProfile = mkWire.Wire();
		// Body : Prism the Profile
		TopoDS_Face myFaceProfile = (TopoDS_Face) (new BRepBuilderAPI_MakeFace(myWireProfile).Shape());
		GP_Vec aPrismVec = new GP_Vec(0, 0, myHeight);
		TopoDS_Shape myBody = (TopoDS_Shape) (new BRepPrimAPI_MakePrism(myFaceProfile, aPrismVec).Shape()); 
		// Body : Apply Fillets
		BRepFilletAPI_MakeFillet mkFillet = new BRepFilletAPI_MakeFillet(myBody);
		TopExp_Explorer anEdgeExplorer = new TopExp_Explorer(myBody, TopAbs_ShapeEnum.TopAbs_EDGE);
		while (anEdgeExplorer.More()) {
			TopoDS_Edge anEdge = (TopoDS_Edge) anEdgeExplorer.Current();
			//Add edge to fillet algorithm
			mkFillet.Add(myThickness / 12., anEdge);
			anEdgeExplorer.Next();
		}
		myBody = mkFillet.Shape();
		// Body : Add the Neck
		GP_Ax2 neckAx2 = new GP_Ax2(new GP_Pnt(0, 0, myHeight),new GP_Dir(0,0,1));
		GP_Ax3 neckAx3 = new GP_Ax3(new GP_Pnt(0, 0, myHeight),new GP_Dir(0,0,1));
		double myNeckRadius = myThickness / 4.;
		double myNeckHeight = myHeight / 10.;
		BRepPrimAPI_MakeCylinder MKCylinder = new BRepPrimAPI_MakeCylinder(neckAx2, myNeckRadius, myNeckHeight);
		TopoDS_Shape myNeck = MKCylinder.Shape();
		myBody = new BRepAlgoAPI_Fuse(myBody, myNeck). Shape();
		// Body : Create a Hol	lowed Solid
		TopoDS_Face faceToRemove = null;
		double zMax = -1;
		for (TopExp_Explorer aFaceExplorer = new TopExp_Explorer(myBody, TopAbs_ShapeEnum.TopAbs_FACE); aFaceExplorer.More(); aFaceExplorer.Next()) {
			TopoDS_Face aFace = (TopoDS_Face) aFaceExplorer.Current();
			// Check if <aFace> is the top face of the bottle's neck 
			Geom_Surface aSurface = BRep_Tool.Surface(aFace);
			System.out.println(">>> "+aSurface.DynamicType().Name());
			if (aSurface instanceof Geom_Plane) { 
				Geom_Plane aPlane = (Geom_Plane)aSurface;
				GP_Pnt aPnt = aPlane.Location();
				double aZ = aPnt.Z();
				if (aZ > zMax) {
					zMax = aZ;
					faceToRemove = aFace;
				}
			}
		}
		TopTools_ListOfShape facesToRemove=new TopTools_ListOfShape();
		facesToRemove.Append(faceToRemove);

		BRepOffsetAPI_MakeThickSolid t = new BRepOffsetAPI_MakeThickSolid();
		t.MakeThickSolidByJoin(myBody, facesToRemove, -myThickness / 50, 1.e-3);
		myBody=t.Shape();
		//	    // Threading : Create Surfaces
		Geom_CylindricalSurface aCyl1 = new Geom_CylindricalSurface(neckAx3, myNeckRadius * 0.99); // FIXME was neckAx3
		Geom_CylindricalSurface aCyl2 = new Geom_CylindricalSurface(neckAx3, myNeckRadius * 1.05); // FIXME was neckAx3
		//	    // Threading : Define 2D Curves
		GP_Ax22d anAx2d = new GP_Ax22d(new GP_Pnt2d(2. * Math.PI, myNeckHeight / 2.),new GP_Dir2d(2. * Math.PI, myNeckHeight / 4. ));
		
		
		double aMajor = 2. * Math.PI;
		double aMinor = myNeckHeight / 10;
		Geom2d_Ellipse anEllipse1 = new Geom2d_Ellipse(anAx2d, aMajor, aMinor); 
		Geom2d_Ellipse anEllipse2 = new Geom2d_Ellipse(anAx2d, aMajor, aMinor / 4);
		Geom2d_TrimmedCurve anArc1 = new Geom2d_TrimmedCurve(anEllipse1, 0, Math.PI); 
		Geom2d_TrimmedCurve anArc2 = new Geom2d_TrimmedCurve(anEllipse2, 0, Math.PI);
		GP_Pnt2d anEllipsePnt1 = anEllipse1.Value(0.0); 
		GP_Pnt2d anEllipsePnt2 = anEllipse1.Value(Math.PI);
		Geom2d_TrimmedCurve aSegment = new GCE2d_MakeSegment(anEllipsePnt1, anEllipsePnt2).Value();
		//	    // Threading : Build Edges and Wires
		TopoDS_Edge anEdge1OnSurf1 = new BRepBuilderAPI_MakeEdge(anArc1, aCyl1).Edge();
		TopoDS_Edge anEdge2OnSurf1 = new BRepBuilderAPI_MakeEdge(aSegment, aCyl1).Edge();
		TopoDS_Edge anEdge1OnSurf2 = new BRepBuilderAPI_MakeEdge(anArc2, aCyl2).Edge();
		TopoDS_Edge anEdge2OnSurf2 = new BRepBuilderAPI_MakeEdge(aSegment, aCyl2).Edge();
		TopoDS_Wire threadingWire1 = new BRepBuilderAPI_MakeWire(anEdge1OnSurf1, anEdge2OnSurf1).Wire();
		TopoDS_Wire threadingWire2 = new BRepBuilderAPI_MakeWire(anEdge1OnSurf2, anEdge2OnSurf2).Wire();
		BRepLib.BuildCurves3d(threadingWire1);
		BRepLib.BuildCurves3d(threadingWire2);
		// Create Threading 
		BRepOffsetAPI_ThruSections aTool = new BRepOffsetAPI_ThruSections(true);
		aTool.AddWire(threadingWire1);
		aTool.AddWire(threadingWire2);
		aTool.CheckCompatibility(false);
		TopoDS_Shape myThreading = aTool.Shape();
		// Building the Resulting Compound 
		TopoDS_Compound aRes = new TopoDS_Compound();
		BRep_Builder aBuilder = new BRep_Builder();
		aBuilder.MakeCompound(aRes);
		aBuilder.Add(aRes, myBody);
		aBuilder.Add(aRes, myThreading);
		try {
			BRepTools.Write(aRes, "bottle.brep");
		
			STEPControl_Writer swriter = new STEPControl_Writer();
			swriter.Transfer(aRes, STEPControl_StepModelType.STEPControl_AsIs);
			swriter.Write("bottle.step");
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
