
%module experimentModule
%include <occhandle.i>

%shared_ptr(Standard_Transient)
%shared_ptr(Base)
%shared_ptr(Derived)



 // Base to  SWIGTYPE_p_opencascade__handleT_Base_t


%typemap(in) CONST TYPE ($&1_type argp = 0) %{
  argp = (*(opencascade::handle< CONST TYPE > **)&$input) ? (*(occ::opencascade< CONST TYPE > **)&$input)->get() : 0;
  if (!argp) {
    SWIG_JavaThrowException(jenv, SWIG_JavaNullPointerException, "Attempt to dereference null $1_type");
    return $null;
  }
  $1 = *argp;
%}

%typemap(out) CONST TYPE
%{ *(opencascade::handle< CONST TYPE > **)&$result = new opencascade::handle< CONST TYPE >(new $1_ltype(($1_ltype &)$1));
%}


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
                System.out.println("Hello World");
		System.load("/Users/nyholku/swig-experiments/out/experiment.dylib");
	}
%}
