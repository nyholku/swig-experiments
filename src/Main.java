import java.io.*;
import java.util.regex.*;
import java.util.LinkedHashMap;

public class Main {
	static class Class {
		Class m_Base;
		String m_Name;
		boolean m_Output;

		public Class(Class base, String name) {
			m_Base = base;
			m_Name = name;
		}

		public String toString() {
			return "'" + m_Name + "'" + (m_Base == null ? "" : " extends " + m_Base);
		}

		public boolean isStandardTransient() {
			if (m_Base != null)
				return m_Base.isStandardTransient();
			else
				return "Standard_Transient".equals(m_Name);
		}
	}

	static LinkedHashMap<String, Class> m_Classes = new LinkedHashMap();

	static String filter(String className) {
		if (!new File("/usr/local/Cellar/opencascade/7.6.0/include/opencascade/" + className + ".hxx").exists()) {
			return null;
		}
		if (className.equals("Standard_Transient")) {
			return className;
		}
		
		if (className.equals("gp_VectorWithNullMagnitude"))
			return null;
		if (className.equals("Standard_DomainError"))
			return null;
		if (className.equals("StdFail_NotDone"))
			return null;
		if (className.equals("FEmTool_HAssemblyTable"))
			return null;
		if (className.equals("Standard_OutOfRange"))
			return null;
		if (className.equals("Standard_NoSuchObject"))
			return null;
		if (className.equals("(Standard_Dump"))
			return null;
		if (className.equals("Standard_DimensionMismatch"))
			return null;
		if (className.equals("Standard_TypeMismatch"))
			return null;
		if (className.equals("Standard_OutOfMemory"))
			return null;
		if (className.equals("Standard_NotImplemented"))
			return null;
		if (className.equals("Standard_MultiplyDefined"))
			return null;
		if (className.equals("Standard_ImmutableObject"))
			return null;
		if (className.equals("NCollection_ListNode"))
			return null;
		if (className.equals("NCollection_BaseMap"))
			return null;
		if (className.equals("NCollection_BaseList"))
			return null;
		if (className.equals("NCollection_BaseVector"))
			return null;
		if (className.equals("NCollection_Shared"))
			return null;
		if (className.equals("NCollection_UBTree"))
			return null;
		if (className.equals("NCollection_CellFilter"))
			return null;
		if (className.equals("NCollection_UBTreeFiller"))
			return null;
		if (className.equals("Standard_NullObject"))
			return null;
		if (className.equals("NCollection_UBTree"))
			return null;
		if (className.equals("NCollection_EBTree"))
			return null;
		if (className.equals("BRepExtrema_UnCompatibleShape"))
			return null;
		if (className.equals("BVH_Box"))
			return null;
		if (className.equals("Expr_InvalidAssignment"))
			return null;
		if (className.equals("Expr_InvalidFunction"))
			return null;
		
		if (className.equals("GProp_UndefinedAxis"))
			return null;
		if (className.equals("GccAna_NoSolution"))
			return null;
		if (className.equals("GccEnt_BadQualifier"))
			return null;
		
	
		
		
		if (className.endsWith("Error"))
			return null;
		if (className.endsWith("Failure"))
			return null;
		
		

		if (className.startsWith("StdFail_"))
			return null;
		if (className.startsWith("OpenGl"))
			return null;
		if (className.startsWith("AIS_"))
			return null;
		if (className.startsWith("TCol"))
			return null;
		if (className.startsWith("TObj"))
			return null;
		if (className.startsWith("ChFiDS"))
			return null;
		if (className.startsWith("TDataStd"))
			return null;
		if (className.startsWith("XCAFD"))
			return null;
		if (className.startsWith("Standard_"))
			return null;
		if (className.startsWith("Gcc"))
			return null;

		if (className.startsWith("Expr_"))
			return null;

		if (className.indexOf("Array") > 0)
			return null;
		if (className.indexOf("_HArray") > 0)
			return null;
		if (className.indexOf("HSeq") > 0)
			return null;
		if (className.indexOf("Sequence") > 0)
			return null;

		if (className.startsWith("gp_"))
			return className;
		if (className.startsWith("math_"))
			return className;
		if (Character.isUpperCase(className.charAt(0)))
			return className;
		return null;
	}

	public static void main(String[] args) {

		try {
			PrintWriter out = new PrintWriter(new File("occ-classes.i"));
			try (BufferedReader br = new BufferedReader(new FileReader("./grapclass/ast.txt"))) {
				String line;
				String className = null;
				String baseName = null;
				int lineno = 0;
				while ((line = br.readLine()) != null) {
					lineno++;
					int cxxi = line.indexOf("CXXRecordDecl");
					int classi = line.indexOf("class ");
					try {
						if (cxxi >= 0 && classi >= 0 && line.endsWith("definition")) {
							if (className != null) {
								if (m_Classes.containsKey(className))
									System.out.println("DOUBLE DEF " + className);
								else {
									Class baseClass = null;
									if (baseName != null)
										baseClass = m_Classes.get(baseName);
									m_Classes.put(className, new Class(baseClass, className));
								}

							}
							className = line.substring(classi + 6, line.length() - 11);
							className = filter(className);
							baseName = null;
							continue;
						}

						int pubi = line.indexOf("| |-public '");
						if (pubi >= 0) {
							baseName = line.substring(pubi + 12, line.length() - 1);
							//System.out.println("base " + baseName);
							continue;

						}
					} catch (StringIndexOutOfBoundsException ex) {
						System.out.println("LINE " + line);
					}
				}

				out.println("//-------------------------------------------------------");
				for (String name : m_Classes.keySet()) {
					Class clazz = m_Classes.get(name);
					if (!clazz.m_Output && clazz.m_Name.startsWith("math_")) {
						clazz.m_Output = true;
						out.println("OCC_MATH(" + clazz.m_Name + ")");
					}
				}

				out.println("//-------------------------------------------------------");
				for (String name : m_Classes.keySet()) {
					Class clazz = m_Classes.get(name);
					if (!clazz.m_Output && clazz.m_Name.equals("gp") || clazz.m_Name.startsWith("gp_")) {
						clazz.m_Output = true;
						out.println("OCC_GP(" + clazz.m_Name.substring(3) + ")");
					}
				}

				out.println("//-------------------------------------------------------");
				for (String name : m_Classes.keySet()) {
					Class clazz = m_Classes.get(name);
					if (!clazz.m_Output && clazz.isStandardTransient()) {
						clazz.m_Output = true;
						out.println("OCC_TRANSIENT(" + clazz.m_Name + ")");
					}
				}
				out.println("//-------------------------------------------------------");
				for (String name : m_Classes.keySet()) {
					Class clazz = m_Classes.get(name);
					if (!clazz.m_Output && !clazz.isStandardTransient()) {
						clazz.m_Output = true;
						out.println("OCC_CLASS(" + clazz.m_Name + ")");
					}
				}
				out.println("//-------------------------------------------------------");

				out.close();
			}

		} catch (

		Throwable th) {
			th.printStackTrace();
		}

	}

}
