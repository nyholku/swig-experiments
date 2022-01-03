# Minimal makefile to just check that everything from SWIG to C++ to wrappers to Java compiles and runs
# As is, this is not portable at all to a different machine let alone different OS
#
java_home = /Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home
jni_headers =$(java_home)/include
jni_darwin_headers = $(java_home)/include/darwin
occ_headers = /usr/local/Cellar/opencascade/7.6.0/include/opencascade
typetraits = /Library/Developer/CommandLineTools/usr/include/c++/v1/
swigout = swigout
output = bin
all:
	rm -r -f ./$(swigout)
	mkdir $(swigout)
	mkdir $(swigout)/occjava
	rm -r -f ./$(output)
	mkdir $(output)
	swig \
		-java \
		-package occjava \
		-I$(typetraits) \
		-cpperraswarn \
		-I$(occ_headers) \
		-outdir $(swigout)/occjava  \
		-c++ -java \
		occ-java.i \
		2>&1 \
		| grep -v "delete ignored" \
		| grep -v "delete\[\] ignored" \
		| grep -v "new ignored" \
		| grep -v "new\[\] ignored"

	gcc -Wno-deprecated-declarations -std=c++11 \
		-undefined dynamic_lookup \
		-o $(output)/libOccJava.dylib -shared -I. \
		-I$(occ_headers) -I$(jni_headers) \
		-I$(jni_darwin_headers) \
		occ-java_wrap.cxx \
		-L/usr/local/Cellar/opencascade/7.6.0/lib/ -Wl,-rpath,/usr/local/Cellar/opencascade/7.6.0/lib/ \
		-lTKernel \
		-lTKPrim \
		-lTKSTEP \
		-lTKIGES \
		-lTKFillet \
		-lTKOffset \
		-lTKBO \
		-lTKTopAlgo \
			-lTKBO\
			-lTKBRep\
			-lTKBin\
			-lTKBinL\
			-lTKBinTObj\
			-lTKBinXCAF\
			-lTKBool\
			-lTKCAF\
			-lTKCDF\
			-lTKDCAF\
			-lTKDraw\
			-lTKFeat\
			-lTKFillet\
			-lTKG2d\
			-lTKG3d\
			-lTKGeomAlgo\
			-lTKGeomBase\
			-lTKHLR\
			-lTKIGES\
			-lTKLCAF\
			-lTKMath\
			-lTKMesh\
			-lTKMeshVS\
			-lTKOffset\
			-lTKOpenGl\
			-lTKPrim\
			-lTKQADraw\
			-lTKRWMesh\
			-lTKSTEP\
			-lTKSTEP209\
			-lTKSTEPAttr\
			-lTKSTEPBase\
			-lTKSTL\
			-lTKService\
			-lTKShHealing\
			-lTKStd\
			-lTKStdL\
			-lTKTObj\
			-lTKTObjDRAW\
			-lTKTopAlgo\
			-lTKTopTest\
			-lTKV3d\
			-lTKVCAF\
			-lTKVRML\
			-lTKViewerTest\
			-lTKXCAF\
			-lTKXDEDRAW\
			-lTKXDEIGES\
			-lTKXDESTEP\
			-lTKXMesh\
			-lTKXSBase\
			-lTKXSDRAW\
			-lTKXml\
			-lTKXmlL\
			-lTKXmlTObj\
			-lTKXmlXCAF\
			-lTKernel\


	javac -d $(output) -sourcepath $(swigout) $(swigout)/occjava/*.java

java:
	javac -d $(swigout) out/*.java
	javac -d $(swigout) -classpath ./out *.java
	java -XX:+PrintGCDetails -XX:+PrintGC -cp out Experiment
