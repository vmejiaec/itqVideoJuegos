class Enemigo{
  float x;
  float y;
  int alto=60;
  Enemigo(float X, float Y){
    x = X;
    y = Y;
  }
  void dibujar(float X){
    fill(255,0,255);
    rect(X+x,y,50,alto);
  }
}

void inicializaEnemigos(float piso){
  Enemigos.add(new Enemigo(width+  0, piso-60));
  Enemigos.add(new Enemigo(width+300, piso-60));
  Enemigos.add(new Enemigo(width+500, piso-60));
  Enemigos.add(new Enemigo(width+800, piso-60));
}

void dibujarEnemigos(float x){
  for (int i=0; i < Enemigos.size(); i++){
    Enemigos.get(i).dibujar(x);
    if (Enemigos.get(i).x +x +50 <= 0){
      Enemigos.get(i).x = width-x;
    }
  }
}
