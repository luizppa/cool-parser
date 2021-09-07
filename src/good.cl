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
