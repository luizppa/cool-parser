class A {
  
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
  value: Int <- 0;

  init(initialValue: Int): SELF_TYPE {
    {
      if (isvoid id) then {
        id <- 0;
        value <- initialValue;
        self;
      }
      else self fi;
    }
  };

  count_up(): SELF_TYPE {
    {
      value <- value + 1;
      self;
    }
  };

  count_down(): SELF_TYPE {
    {
      value <- value - 1;
      self;
    }
  };
};

class ExtendedCounter inherits BaseCounter {
  count_n_up(n: INT): SELF_TYPE {
    {
      value <- value + n;
      self;
    }
  };

  count_n_down(n: INT): SELF_TYPE {
    {
      value <- value - n;
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
      while (advancedCounter.value < basicCounter.value) loop {
        basicCounter.count_up();
        advancedCounter.count_n_up(3);
      } pool;
      
      if(advancedCounter.value == basicCounter.value) then {
        success <- true;
        self;
      } else self fi;
    }
  };
};
