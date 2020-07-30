public class Experiment {
	public static void main(String...args) {
		Base base=new Base();
		Derived derived=new Derived();
		//base.foobar(base); // error: incompatible types: Base cannot be converted to SWIGTYPE_p_handleT_Base_t
		//base.foobar(derived.return_Derived()); // error: incompatible types: SWIGTYPE_p_handleT_Derived_t cannot be converted to SWIGTYPE_p_handleT_Base_t
}
}
