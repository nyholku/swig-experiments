# swig-experiments

The goal of these experiments is to create Java bindings for OpenCascade 7.5.0 using SWIG

Following commit / tag:

https://github.com/nyholku/swig-experiments/releases/tag/v0.0

refers to the first experiment version that is able to use some OCC classes as-is
with very little boiler plate and in which SWIG, Java and C++ compiles, links,
runs and does not crash in a trivial test.

While reaching  this miles stone is a very small step I hope it is in the right direction.

The general approach is to take advantage of SWIG 'smartptr' feature now that OCC has
abandoned their separate handle hierarchy that mirrored the object class hierarchy.

The new (since OCC 7, iirc) `opencascade::handle` is very compatible with std::shared_ptr
so this approach promises to be a good match.

In SWIG the secret sauce that makes shared_ptr to function seems to be in
`std_shared_ptr.i`, `boost_shared_ptr.i` and `shared_ptr.i` files. I've combined them
all into `occ_handle.i` and hacked that to make it work. The actual changes are
very small, mainly renaming stuff.

A lot of work remains to be done, this is just a Proof of Concept.

In addition to exposing as many OCC classes and APIs as possible some of
the very low level types should probably be exposed with more convenient
Java types like has been done in jCAE/occjava project. Lot of that
could probably lifted from that project.

## Running the experiment code

The code as-is is not going to run in any other machine than my development machine
because I have not put any effort into that.

Here are some notes to help anyone to mod the code to work in an other environment.

`System.load()` call has an absolute reference to the `out/experiment.dylib`, this
can be changed in `experiment-cc-code.i`.

The `Makefile` only builds a macOS dylib and  name does not follow the naming convention for shared libraries.

The `Makefile` contains absolute references to JDK, OCC headers.

The way the `.dylib` is built is very rudimentary and the resulting shared library probably has
non portable references to libraries in the build machine.



## Extending the code

The magic that makes OCC accessible from Java is in `experiment-cc-code.i` file.

This file will be renamed to `occ_java.i` in the immediate future but I document it here as it is now.

To expose a new OCC class two lines need to be added, for example to expose BRepPrim_Wedge add

```
%include "BRepPrim_Wedge.hxx"
```

and

```
%{
#include "BRepPrim_Wedge.hxx"
%}
```

taking you cue from the already existing includes. Note that order is important and
more or less should mimic the order in which they are included in the OCC headers.

If the class is accessed via `opencascade::handle` then this needs to be declared
before the header includes like this:

```
%occ_handle(Geom_TrimmedCurve)
```
