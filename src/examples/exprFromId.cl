Class DummyClass {
      att : Int <- 10;
};

Class TestFromId {
      y : Int <- 0;
      x : Int <- y;
      innClass : DummyClass <- new DummyClass;
};