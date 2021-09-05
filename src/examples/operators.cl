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