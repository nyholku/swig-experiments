
%module experimentModule
%include "myshared_ptr.i"
%shared_ptr(Base)
%shared_ptr(Derived)

%{
#include "experiment-cc-code.hxx"
%}


%include "experiment-cc-code.hxx"

// load the native library
%pragma(java) jniclasscode=%{
	static
	{
                System.out.println("Hello World");
		System.load("/Users/nyholku/swig-experiments/out/experiment-cc-code_wrap.jnilib");
	}
%}
