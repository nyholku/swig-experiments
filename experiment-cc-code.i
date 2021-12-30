
%module experimentModule

%include <occ_handle.i>

%shared_ptr(Standard_Transient)
%shared_ptr(Base)
%shared_ptr(Derived)



%include "Standard_Macro.hxx"
%include "Standard_DefineAlloc.hxx"
%include "Standard.hxx"
%include "Standard_PrimitiveTypes.hxx"
%include "Standard_Transient.hxx"

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
