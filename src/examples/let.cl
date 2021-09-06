Class TestLet {
      v0: Int <- 0;
      v3: Int <- let v1: Int <- v0 + 1, v2: Int <- v0 + v1 + 1 in v0 + v1 + v2 + 1;
};
