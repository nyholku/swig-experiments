template <class T>
  class handle
  	{
  private:
	T* entity;
  public:
    T* operator-> () const ;
	};

#define Handle(clazz) handle<clazz>

#define DEFINE_STANDARD_HANDLE(clazz) class clazz; typedef Handle(clazz) Handle_##clazz;

DEFINE_STANDARD_HANDLE(Base);
DEFINE_STANDARD_HANDLE(Derived);

class Base {
	public:
		virtual Handle_Base foobar(Handle_Base);
};

class Derived : public Base {
	public:
		virtual Handle_Derived return_Derived();
};
