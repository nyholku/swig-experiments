
%module experimentModule
%{
#include "experiment-cc-code.hxx"
%}

/*
%typemap(in) Handle_Base {
   $1 = (Base*)($input);
}
*/

%include "experiment-cc-code.hxx"

%rename(Base) Handle_Base;
%rename(Derived) Handle_Derived;

class Handle_Base {

};
class Handle_Derived : public Handle_Base {

};
