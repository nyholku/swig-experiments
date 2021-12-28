# Minimal makefile to just check that everything from SWIG to C++ to wrappers to Java compiles
java_home = /Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home
jni_headers =$(java_home)/include
jni_darwin_headers = $(java_home)/include/darwin
out_dir = out
all:
	rm -f ./$(out_dir)/*.java
	cc -std=c++11 -c -I/usr/local/include/opencascade -o $(out_dir)/experiment-cc-code.so experiment-cc-code.cxx
	cd $(out_dir) && swig -outcurrentdir -c++ -java ../experiment-cc-code.i
	cc -std=c++11 -c -I. -I$(jni_headers) -I$(jni_darwin_headers) -o $(out_dir)/experiment-cc-code_wrap.so $(out_dir)/experiment-cc-code_wrap.cxx
#	cc -dynamiclib -o $(out_dir)/experiment.dylib $(out_dir)/experiment-cc-code_wrap.so $(out_dir)/experiment-cc-code.so
#	cc -bundle -l$(out_dir)/experiment.dylib -o experiment.jnilib myJNILib.o
	javac -d $(out_dir) out/*.java
	javac -d $(out_dir) -classpath ./out *.java
#	java -cp out Experiment


#	cc -dynamiclib -o $(out_dir)/experiment.dylib $(out_dir)/experiment-cc-code_wrap.so $(out_dir)/experiment-cc-code.so
#	cc -bundle -l$(out_dir)/experiment.dylib -o experiment.jnilib myJNILib.o
#
