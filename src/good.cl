class A {
  
};

class BB__ inherits A {

};

class BaseCounter {
  id: Int;
  counter: Int <- 0;

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
};