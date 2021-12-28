#include <memory>

class Base;
class Derived;

typedef std::shared_ptr<Base> BaseHandle;
typedef std::shared_ptr<Derived> DerivedHandle;

class Base {
	public:
		virtual BaseHandle foobar(BaseHandle x) {return x;};
                void foba();
};

class Derived : public Base {
	public:
		virtual DerivedHandle return_Derived() {return DerivedHandle(this);};
                void bafo();
};
