Class Digit0 {
      name: String <- "0";
};

Class Digit1 {
      name: String <- "1";
};

Class Digit2 {
      name: String <- "2";
};

Class Digit3 {
      name: String <- "3";
};

Class Digit4 {
      name: String <- "4";
};

Class Digit5 {
      name: String <- "5";
};

Class Digit6 {
      name: String <- "6";
};

Class Digit7 {
      name: String <- "7";
};

Class Digit8 {
      name: String <- "8";
};


Class Digit9 {
      name: String <- "9";
};

Class TestCase {
      isDigit(str: String): Bool {
        case str of
	  d0: Digit0 => true;
	  d1: Digit1 => true;
	  d2: Digit2 => true;
	  d3: Digit3 => true;
	  d4: Digit4 => true;
	  d5: Digit5 => true;
	  d6: Digit6 => true;
	  d7: Digit7 => true;
	  d8: Digit8 => true;
	  d9: Digit9 => true;
	  o: Object => false;
	esac
      }
};