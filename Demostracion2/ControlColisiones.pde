boolean colision(
  float x1, float y1, float w1, float h1,
  float x2, float y2, float w2, float h2
){
  boolean choque = true;
  if (x1+w1<x2) {
    choque = false;
  } else {
    if (y1+h1<y2){
      choque = false;
    } else {
      if (x2+w2<x1){
        choque = false;
      } else {
        if (y2+h2<y1){
          choque = false;
        }
      }
    }
  }
  return choque;
}
