Class TestMethod {
      name : String <- "Testing methods";
      getName() : String { name };
      getString(str : String) : String { str };
      getLastString(str1 : String, str2 : String) : String { str2 };
      getLastString2(str1 : String, str2 : String) : String {
       	  getLastString(str1, str2)
      };
};