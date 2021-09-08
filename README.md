# Cool Parser

A parser for the cool language. The program outputs what would be a AST for a given cool code. Further information about this project can be found in [tp3-ingles.pdf](https://github.com/luizppa/cool-parser/blob/main/tp3-ingles.pdf) and [tp4-ingles.pdf](https://github.com/luizppa/cool-parser/blob/main/tp4-ingles.pdf). Documentation about the Cool language is available [here](https://theory.stanford.edu/~aiken/software/cool/cool-manual.pdf).

## Instalation

To build from source, run:

```
$ cd src/
$ ./gen 
```

this will generate the file system specific files into your src folder, including the executable `myparser`. After running the command, your src folder should look like this:

```
Makefile                -> [cool dir]/src/parser/Makefile
README
cool.y                  -> bison file
bad.cl                  -> syntax error examples
good.cl                 -> program examples
cool-tree.handcode.h
cool-tree.cc            -> [cool dir]/src/parser/cool-tree.cc
cool-tree.aps           -> [cool dir]/src/parser/cool-tree.aps
dumptype.cc             -> [cool dir]/src/parser/dumptype.cc
handle_flags.c          -> [cool dir]/src/parser/handle_flags.cc
parser-phase.cc         -> [cool dir]/src/parser/parser-phase.cc
stringtab.cc            -> [cool dir]/src/parser/stringtab.cc
tokens-lex.cc           -> [cool dir]/src/parser/tokens-lex.cc
tree.cc                 -> [cool dir]/src/parser/tree.cc
utilities.cc            -> [cool dir]/src/parser/utilities.cc
*.d                     dependency files
*.*                     other generated files
```

Run `make` on the src folder to rebuild `myparser` after making any changes to the source code.

### Dependencies

In order to build the project, you will need to have the following packages installed in your environment:

* [Make](https://gnu.org/software/make/)
* [GNU Compiler](https://gnu.org/software/gcc/)
* [Bison](https://gnu.org/software/bison/)

as well as some x86 packages that can be installed in debian systems by running:

```
$ sudo dpkg --add-architecture i386
$ sudo apt-get update
$ sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386
```

## Running

To parse a Cool program, simply run:

```
$ ./src/myparser program.cl
```

which will output the AST on the stdout.

### Testing

To run the parser over a set of test inputs execute the script located at `src/run-test`. A set of default tests is available at `src/examples/`. Each file tries to cover one part of cool's grammar as defined in `cool.y`. Nevertheless, you can run the parser over any set of .cl files by running:

```
$ ./src/run-test path/to/example/folder/
```

## Examples

Consider the input:

```
class A {
  name: String <- "Jhon";
};

class BB__ inherits A {

  foo(): String {
    {
      "Helo";
      "World!";
    }
  };
};
```

it will produce the following output:

```
#1
_program
  #1
  _class
    A
    Object
    "good.cl"
    (
    #2
    _attr
      name
      String
      #2
      _assign
        name
        #2
        _string
          "Jhon"
        : _no_type
      : _no_type
    )
  #5
  _class
    BB__
    A
    "good.cl"
    (
    #7
    _method
      foo
      String
      #8
      _block
        #9
        _string
          "Helo"
        : _no_type
        #10
        _string
          "World!"
        : _no_type
      : _no_type
    )

```