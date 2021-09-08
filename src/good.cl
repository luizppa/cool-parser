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

class BaseCounter {
  id: Int;
  counter: Int <- 0;
  value(): Int { counter };

  init(initialValue: Int): SELF_TYPE {
    {
      if (isvoid id) then {
        id <- 0;
        counter <- initialValue;
        self;
      }
      else self fi;
    }
  };

  count_up(): SELF_TYPE {
    {
      counter <- counter + 1;
      self;
    }
  };

  count_down(): SELF_TYPE {
    {
      counter <- counter - 1;
      self;
    }
  };
};

class ExtendedCounter inherits BaseCounter {
  count_n_up(n: INT): SELF_TYPE {
    {
      counter <- counter + n;
      self;
    }
  };

  count_n_down(n: INT): SELF_TYPE {
    {
      counter <- counter - n;
      self;
    }
  };
};

class Main {
  basicCounter: BaseCounter <- (new BaseCounter).init(50);
  advancedCounter: ExtendedCounter <- new ExtendedCounter;
  success: Bool <- false;

  init(): SELF_TYPE {
    {
      while ((advancedCounter).value() < (basicCounter).value()) loop {
        basicCounter.count_up();
        advancedCounter.count_n_up(3);
      } pool;

      if(advancedCounter.value() = basicCounter.value()) then {
        success <- true;
        self;
      } else self fi;
    }
  };
};

Class TestLet {
      v0: Int <- 0;
      v3: Int <- let v1: Int <- v0 + 1, v2: Int <- v0 + v1 + 1 in v0 + v1 + v2 + 1;
};

Class OpTests {
      (* Unary *)
      isTest : Bool <- true;
      isNotTest : Bool <- ~ isTest;
      isNotTest2 : Bool <- not isTest;
      isThisVoid : Bool <- isvoid 0;
      
      (* Binary *)
      x : Int <- 40;
      y : Int <- 60;
      z : Int <- x + y;
      a : Int <- x - y;
      b : Int <- x * y;
      c : Int <- x / y;
      xlty : Bool <- x < y;
      yleqc : Bool <- y <= c;
      ceqb : Bool <- c = b;
};
