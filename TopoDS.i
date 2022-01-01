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
 * (C) Copyright 2005, by EADS CRC
 * (C) Copyright 2009, by EADS France
 */

//%{
//#include <TopoDS_CompSolid.hxx>
//#include <TopoDS_Solid.hxx>
//#include <TopoDS_Shell.hxx>
//#include <TopoDS_Compound.hxx>
//#include <TopoDS_Wire.hxx>
//#include <TopoDS_Iterator.hxx>
//%}

/**
 * TopoDS_Shape
 */
// Ensure that the Java class will always be the good one, so we can use
// instanceof operator.
// Problem: Returning a shape require 2 initialisation (the TopoDS_Shape
// and after the real TopoDS_XXXXX. It may reduce performance comparing
// to libOccJava.

%typemap(out) TopoDS_Shape
{
	if($1.IsNull())
	{
		$result=0L; //NULL
	}
	else
	{
		TopoDS_Shape * tsp=new TopoDS_Shape();
		tsp->TShape($1.TShape());
		tsp->Location($1.Location());
		tsp->Orientation($1.Orientation());
		$result=(jlong)tsp;
	}
}

%typemap(out) const TopoDS_Shape &, const TopoDS_Compound &
{
	if($1->IsNull())
	{
		$result=0L; //NULL
	}
	else
	{
		$1_basetype * tsp=new $1_basetype();
		tsp->TShape($1->TShape());
		tsp->Location($1->Location());
		tsp->Orientation($1->Orientation());
		$result=(jlong)tsp;
	}
}

%typemap(javaout) TopoDS_Shape*, TopoDS_Shape, const TopoDS_Shape&, const TopoDS_Compound &
{
    long cPtr = $jnicall;
    return ($javaclassname)TopoDS_Shape.create(cPtr);
}

%typemap(javacode) TopoDS_Shape
%{
	protected static TopoDS_Shape downcast(TopoDS_Shape in)
	{
		TopoDS_Shape toReturn = create(getCPtr(in));
		in.swigCMemOwn=false;
		return toReturn;
	}

	protected static TopoDS_Shape create(long in)
	{
		if(in==0)
			return null;
		//second argument is not use in swig
		TopAbs_ShapeEnum type = TopAbs_ShapeEnum.swigToEnum(OccJavaJNI.TopoDS_Shape_ShapeType(in, null));
		return create(in, type);
	}

	protected static TopoDS_Shape create(long in, TopAbs_ShapeEnum type)
	{
		TopoDS_Shape toReturn=null;
		if(in==0)
		return null;
		if (type==TopAbs_ShapeEnum.TopAbs_COMPOUND)
			toReturn=new TopoDS_Compound(in, true);
		if (type==TopAbs_ShapeEnum.TopAbs_COMPSOLID)
			toReturn=new TopoDS_CompSolid(in, true);
		if (type==TopAbs_ShapeEnum.TopAbs_SOLID)
			toReturn=new TopoDS_Solid(in, true);
		if (type==TopAbs_ShapeEnum.TopAbs_SHELL)
			toReturn=new TopoDS_Shell(in, true);
		if (type==TopAbs_ShapeEnum.TopAbs_FACE)
			toReturn=new TopoDS_Face(in, true);
		if (type==TopAbs_ShapeEnum.TopAbs_WIRE)
			toReturn=new TopoDS_Wire(in, true);
		if (type==TopAbs_ShapeEnum.TopAbs_EDGE)
			toReturn=new TopoDS_Edge(in, true);
		if (type==TopAbs_ShapeEnum.TopAbs_VERTEX)
			toReturn=new TopoDS_Vertex(in, true);
		return toReturn;
    }

    /**
     * Alias on the isSame method for an easy use of this class in java
     * collections
     */
    public boolean equals(Object o)
    {
        if (o instanceof TopoDS_Shape)
        {
            return IsSame((TopoDS_Shape)o);
        }
        else return false;
    }

	public int hashCode()
	{
		return HashCode(Integer.MAX_VALUE);
	}

	protected static TopoDS_Shape[] cArrayWrap(long[] ptrs)
	{
		TopoDS_Shape[] toReturn = new TopoDS_Shape[ptrs.length/2];
		long ptr;
		int type;
		for (int i=0, j=0; i<toReturn.length; i++)
		{
			ptr = ptrs[j++];
			type = (int)ptrs[j++];
			toReturn[i] = create(ptr, TopAbs_ShapeEnum.swigToEnum(type));
		}
		return toReturn;
	}

	protected static long[] cArrayUnwrap(TopoDS_Shape[] arrayWrapper)
	{
		long[] cArray = new long[arrayWrapper.length];
		for (int i=0; i<arrayWrapper.length; i++)
		cArray[i] = TopoDS_Shape.getCPtr(arrayWrapper[i]);
		return cArray;
	}
%}
