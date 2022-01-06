/*
 * Project Info:  http://jcae.sourceforge.net
 * 
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software Foundation, Inc.,
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307, USA.
 *
 * (C) Copyright 2008,2009, by EADS France
 */

import java.io.PrintStream;
import java.util.Arrays;
import occjava.*;

/**
 * Useful toolbox.
 * Note that this methods are not Open CASCADE binding and should probably
 * not be used outside of the jCAE project, as compatibility between versions
 * won't be warranted.
 */
public class Utilities {
	private static final int TAB = 2;

	/** Dump the topology of a shape (for debugging) */
	public static void dumpTopology(TopoDS_Shape shape) {
		dumpTopology(shape, System.out);
	}

	/** Dump the topology of a shape (for debugging) */
	public static void dumpTopology(TopoDS_Shape shape, PrintStream out) {
		dumpTopology(shape, out, 0);
	}

	private static void dumpTopology(TopoDS_Shape shape, PrintStream out, int level) {
		TopoDS_Iterator it = new TopoDS_Iterator(shape);
		char[] dots = new char[level * TAB];
		Arrays.fill(dots, '-');
		String dotss = new String(dots);
		String label = shape.toString().substring("org.jcae.opencascade.jni.TopoDS_".length());
		System.out.print("+" + dotss + label);
		if (shape.ShapeType() == TopAbs_ShapeEnum.TopAbs_FACE)
			out.print(" " + BRep_Tool.Tolerance((TopoDS_Face) shape));
		if (shape.ShapeType() == TopAbs_ShapeEnum.TopAbs_EDGE)
			out.print(" " + BRep_Tool.Tolerance((TopoDS_Edge) shape));
		if (shape.ShapeType() == TopAbs_ShapeEnum.TopAbs_VERTEX)
			out.print(" " + BRep_Tool.Tolerance((TopoDS_Vertex) shape));

		out.print(" " + shape.Orientation());
		out.println();
		while (it.More()) {
			dumpTopology(it.Value(), out, level + 1);
			it.Next();
		}
	}

	/** Return the number of shapes in one shape */
	public static int numberOfShape(TopoDS_Shape shape, TopAbs_ShapeEnum type) {
		int n = 0;
		for (TopExp_Explorer exp = new TopExp_Explorer(shape, type); exp.More(); exp.Next())
			n++;
		return n;
	}

	/** Test if a shape is part of another one  */
	public static boolean isShapeInShape(TopoDS_Shape parent, TopoDS_Shape child) {
		for (TopExp_Explorer exp = new TopExp_Explorer(parent, child.ShapeType()); exp.More(); exp.Next()) {
			if (exp.Current().equals(child))
				return true;
		}
		return false;
	}

	/**
	 * Read a file guessing the format with the file extension
	 * Only .step, .igs and .brep are supported.
	 */
	public static TopoDS_Shape readFile(String fileName) {
		if (fileName.endsWith(".stp") || fileName.endsWith(".STP") || fileName.endsWith(".step") || fileName.endsWith(".STEP")) {
			STEPControl_Reader aReader = new STEPControl_Reader();
			aReader.ReadFile(fileName);
			aReader.NbRootsForTransfer();
			aReader.TransferRoots();
			return aReader.OneShape();
		}

		if (fileName.endsWith(".igs") || fileName.endsWith(".IGS") || fileName.endsWith(".iges") || fileName.endsWith(".IGES")) {
			IGESControl_Reader aReader = new IGESControl_Reader();
			aReader.ReadFile(fileName);
			aReader.NbRootsForTransfer();
			aReader.TransferRoots();
			return aReader.OneShape();
		}

		BRepTools.Read(null, fileName, new BRep_Builder()); // FIXME first parameter cannot be null
		return null;
	}

	/**
	 * Return the face whose order is id in the given shape
	 */
	public static TopoDS_Face getFace(TopoDS_Shell shape, int id) {
		TopExp_Explorer exp = new TopExp_Explorer(shape, TopAbs_ShapeEnum.TopAbs_FACE);
		int i = 0;
		while (exp.More()) {
			if (id == i)
				return (TopoDS_Face) exp.Current();
			exp.Next();
			i++;
		}
		throw new IndexOutOfBoundsException("Face " + id + " not found");
	}

	/**
	 * Return the vertex whose order is id in the given shape
	 */
	public static TopoDS_Vertex getVertex(TopoDS_Shape shape, int id) {
		TopExp_Explorer exp = new TopExp_Explorer(shape, TopAbs_ShapeEnum.TopAbs_VERTEX);
		int i = 0;
		while (exp.More()) {
			if (id == i)
				return (TopoDS_Vertex) exp.Current();
			exp.Next();
			i++;
		}
		throw new IndexOutOfBoundsException("Vertex " + id + " not found");
	}

	/**
	 * Compute the tolerance of shapes by selecting the highest
	 * tolerance of the give child shapes
	 */
	public static double tolerance(TopoDS_Shape shape) {
		double toReturn = 0;
		if (shape instanceof TopoDS_Face) {
			toReturn = BRep_Tool.Tolerance((TopoDS_Face) shape);
		} else if (shape instanceof TopoDS_Edge) {
			toReturn = BRep_Tool.Tolerance((TopoDS_Edge) shape);
		} else if (shape instanceof TopoDS_Vertex)
			return BRep_Tool.Tolerance((TopoDS_Vertex) shape);

		TopoDS_Iterator it = new TopoDS_Iterator(shape);
		while (it.More()) {
			TopoDS_Shape s = it.Value();
			double t = tolerance(s);
			if (t > toReturn)
				toReturn = t;
			it.Next();
		}
		return toReturn;
	}
}
