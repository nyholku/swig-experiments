public class Experiment {
	public static void main(String...args) {
                for (int i=0; i<100; i++) {
                System.out.println("*** "+i);
		Base base=new Base();
                base.foba();
                base.foobar(base);
                Derived derived=new Derived();
                derived.foba();
                base = derived.return_Derived(); // Implicit upcast
                derived = (Derived)base; // Explicit downcast
		derived.foobar(derived.return_Derived()); // We can also pass derived class in Java
}
/*
                base.foba();
		base.foobar(base); // Using Base in Java while the actual C++ class uses smart_ptr (ie handle)
		base.foobar(derived.return_Derived()); // We can also pass derived class in Java
                base = derived.return_Derived(); // Implicit upcast
                derived = (Derived)base; // Explicit downcast
*/
        }
}
