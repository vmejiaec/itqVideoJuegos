char estadoAnimacionPantallaJuego = 'F'; // I inicio,  F fin
int tiempoInicioPantallaJuego = 0; 

ArrayList<Nube> Nubes = new ArrayList<Nube>();
ArrayList<Enemigo> Enemigos = new ArrayList<Enemigo>();

class Nube{
  float x;
  float y;
  Nube(float X, float Y){
    x = X;
    y = Y;
  }
  void dibujar(float X){
    fill (255);
    rect(X+x+  0,y-20,30,20);
    rect(X+x+ 30,y-30,20,30);
    rect(X+x+ 50,y-40,50,40);
    rect(X+x+100,y-20,30,20);
  }
}

class Enemigo{
  float x;
  float y;
  int alto=60;
  Enemigo(float X, float Y){
    x = X;
    y = Y;
  }
  void dibujar(float X){
    fill(255,255,255);
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

void inicializaNubes(){
  // coloca las coordenadas de las nubes en el cielo 
  Nubes.add(new Nube(100,100));
  Nubes.add(new Nube(500,200));
  Nubes.add(new Nube(800, 50));
}

void dibujarNubes(float x){
  for (int i = 0; i < Nubes.size();i++){
    Nubes.get(i).dibujar(x);
    if (x+Nubes.get(i).x +130 < 0) {
      Nubes.get(i).x = width - x;
    }
  }  
}



void dibujarPantallaJuego(){
  int hSuelo = 40; 
  int ySuelo = height - hSuelo; 
  
  // Movimiento
  if (estadoAnimacionPantallaJuego == 'F'){
    estadoAnimacionPantallaJuego = 'I';
    tiempoInicioPantallaJuego = millis();
    inicializaNubes();
    inicializaEnemigos(ySuelo);
  }

  // Calculo del movimiento
  float tiempo = millis() - tiempoInicioPantallaJuego;
  float vNubes = 0.03;
  float xNubes = 50 - tiempo * vNubes;
  float vEnemigos = 0.2;
  float xEnemigos = - tiempo * vEnemigos;

  // dibuja el suelo
  fill(100);
  rect(0,ySuelo, width, hSuelo);
  // Dibuja cielo
  dibujarNubes(xNubes);
  // Dibuja enemigos
  dibujarEnemigos(xEnemigos);
 
  // Dibujar menú
  fill(255);
  textSize(30);
  textAlign(LEFT,CENTER);
  text("Press 'e' for exit...", 10, ySuelo+10);
}
