Class A {
      myZero : Int <- 0;
      foo() : Int { self.myZero; }
};

Class TestSD inherits A {
       foo() : Int { 1 }
       bar() : Int { (new TestSD)@A.foo() }
};

Class TestDD inherits A {
      foo() : Int { 2 }
      bar() : Int { self.foo() }
};