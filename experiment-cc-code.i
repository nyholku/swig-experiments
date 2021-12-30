
%module experimentModule

%include <occ_handle.i>

%occ_handle(Standard_Transient)
%occ_handle(Base)
%occ_handle(Derived)
//%shared_ptr(BRepPrimAPI_MakeBox)


%include "Standard_Macro.hxx"
%include "Standard_DefineAlloc.hxx"
%include "Standard.hxx"
%include "Standard_PrimitiveTypes.hxx"
%include "Standard_Transient.hxx"

//%include "BRepPrimAPI_MakeBox.hxx"

%include "experiment-cc-code.hxx"


%{
#include "experiment-cc-code.hxx"
%}

// load the native library
%pragma(java) jniclasscode=%{
	static
	{
		System.load("/Users/nyholku/swig-experiments/out/experiment.dylib");
	}
%}
