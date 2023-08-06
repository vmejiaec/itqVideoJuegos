char estadoAnimacionPantallaJuego = 'F'; // I inicio,  F fin
int tiempoInicioPantallaJuego = 0; 

ArrayList<Nube> Nubes = new ArrayList<Nube>();
ArrayList<Enemigo> Enemigos = new ArrayList<Enemigo>();

Dino dino = new Dino(0,0);

class Dino{
  float x;
  float y;
  float w = 50;
  float h = 90;
  float ay = 0.0;
  float vy = 0.0;
  float aySalto = 0.0031;
  float vySalto = -1.3;
  boolean estaSaltando;
  float tiempoSaltoInicio;
  float t = 0;  
  float suelo;
  
  Dino(float X, float Y){
    x = X;
    y = Y;
  }
  void display(){
    // calculo del tiemmpo
    t = millis() - tiempoSaltoInicio;    
    // movimiento    
    y = suelo + vy * t + 0.5 * ay * t * t; //<>//
    // controla que haya tocado el suelo
    if ( y >  suelo) {
      estaSaltando = false;
      ay = 0.0;
      vy = 0.0;
      y = suelo;
    }
    // dibuja a dino
    fill(0,0,255);
    rect(x,y,w,h);
  }

  // Inicializa a Dimo
  void setup(float piso){
    suelo = piso-h;
    x = 100;
    y = suelo;    
  }

  void salta(){
    if ( ! estaSaltando ){
      estaSaltando = true;
      tiempoSaltoInicio = millis();
      ay = aySalto;
      vy = vySalto;
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
    dino.setup(ySuelo);
  }

  // Calculo del movimiento
  float tiempo = millis() - tiempoInicioPantallaJuego;
  float vNubes = -0.03;
  float xNubes = vNubes * tiempo ;
  float vEnemigos = -0.2;
  float xEnemigos =  vEnemigos * tiempo ;

  // dibuja el suelo
  fill(100);
  rect(0,ySuelo, width, hSuelo);
  // Dibuja cielo
  dibujarNubes(xNubes);
  // Dibuja enemigos
  dibujarEnemigos(xEnemigos);
  // Dibuja al dino
  dino.display();
 
  // Dibujar menú
  fill(255);
  textSize(30);
  textAlign(LEFT,CENTER);
  text("Press 'e' for exit...", 10, ySuelo+10);
}
