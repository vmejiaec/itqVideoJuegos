class Enemigo{
  float x;
  float y;
  float ancho = 50;
  float alto = 120;
  Enemigo(float X, float Y){
    x = X;
    y = Y;
  }
  void dibujar(float X){
    fill(255,0,255);
    rect(X+x,y,ancho,alto);
  }
}

void inicializaEnemigos(float piso){
  float alto = 120;
  Enemigos.add(new Enemigo(width+ 100, piso-alto));
  Enemigos.add(new Enemigo(width+ 300, piso-alto));
  Enemigos.add(new Enemigo(width+ 500, piso-alto-80));
  Enemigos.add(new Enemigo(width+ 800, piso-alto));
  Enemigos.add(new Enemigo(width+1000, piso-alto-80));
}

void dibujarEnemigos(float x){
  for (int i=0; i < Enemigos.size(); i++){
    Enemigos.get(i).dibujar(x);
    if (Enemigos.get(i).x +x + Enemigos.get(i).ancho <= 0){
      Enemigos.get(i).x = width-x;
    }
  }
}
