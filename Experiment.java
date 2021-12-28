public class Experiment {
	public static void main(String...args) {
		Base base=new Base();
		Derived derived=new Derived();
		base = base.foobar(base); // Using Base in Java while the actual C++ class uses smart_ptr (ie handle)
		base.foobar(derived.return_Derived()); // We can also pass derived class in Java
                base = derived.return_Derived(); // Implicit upcast
                derived = (Derived)base; // Explicit downcast
        }
}
