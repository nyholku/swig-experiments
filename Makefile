# Minimal makefile to just check that everything from SWIG to C++ to wrappers to Java compiles and runs
# As is, this is not portable at all to a different machine let alone different OS
java_home = /Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home
jni_headers =$(java_home)/include
jni_darwin_headers = $(java_home)/include/darwin
occ_headers = /usr/local/include/opencascade
out_dir = out
all:
	rm -f ./$(out_dir)/*.java
	gcc -std=c++11 -c -I$(occ_headers) -o $(out_dir)/experiment-cc-code.so experiment-cc-code.cxx
	cd $(out_dir) && swig -I$(occ_headers) -outcurrentdir -c++ -java ../occ-java.i
	gcc -std=c++11 -c -I. -I$(occ_headers) -I$(jni_headers) -I$(jni_darwin_headers) -o $(out_dir)/experiment-cc-code_wrap.so $(out_dir)/experiment-cc-code_wrap.cxx
	gcc -std=c++11 -undefined dynamic_lookup -o $(out_dir)/experiment.dylib -shared -I. -I$(occ_headers) -I$(jni_headers) -I$(jni_darwin_headers) experiment-cc-code.cxx $(out_dir)/experiment-cc-code_wrap.cxx \
	-L/usr/local/lib -Wl,-rpath,/usr/local/lib \
	-lTKernel \
	-lTKPrim \

	javac -d $(out_dir) out/*.java
	javac -d $(out_dir) -classpath ./out *.java
	java -cp out Experiment

java:
	javac -d $(out_dir) out/*.java
	javac -d $(out_dir) -classpath ./out *.java
	java -XX:+PrintGCDetails -XX:+PrintGC -cp out Experiment
