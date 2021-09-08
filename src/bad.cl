
(*
 *  execute "coolc bad.cl" to see the error messages that the coolc parser
 *  generates
 *
 *  execute "myparser bad.cl" to see the error messages that your parser
 *  generates
 *)

(* no error *)
class A {
};

(* error:  b is not a type identifier *)
Class b inherits A {
};

(* error:  a is not a type identifier *)
Class C inherits a {
};

(* error:  keyword inherits is misspelled *)
Class D inherts A {
};

(* error:  closing brace is missing *)
Class E inherits A {
;

(* error:  misplaced comma after parameter list *)
class F {
  foo(param1: Int, param2: Int): String { "Hello world" };
  bar(): String { foo(1, 2,) };
};

(* error:  double semicolom after expression *)
class G {
  foo(): String {
    {
      "Hello, world!";;
    }
  };
};

class H {
  missingPar(: Int {
    0 
  }  
};

class I {
  0to10(): Int {
    let i: Int <- 0 in
      {
        while i < 10 loop i <- i + 1 pool;
	i
      }
  }
};
