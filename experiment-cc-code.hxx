#include <memory>

#include "Standard_Transient.hxx"
#include "Standard_Handle.hxx"

class Base;
class Derived;

namespace opencascade{

template<typename T>
using shared_ptr = std::shared_ptr<T>;


}

typedef opencascade::handle<Base> BaseHandle;
typedef opencascade::handle<Derived> DerivedHandle;

class Base : public Standard_Transient {
	public:
		virtual BaseHandle foobar(BaseHandle x) {return x;};
                void foba();
};

class Derived : public Base {
	public:
		virtual DerivedHandle return_Derived() {return DerivedHandle(this);};
                void bafo();
};
