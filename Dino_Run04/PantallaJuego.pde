char estadoAnimacionPantallaJuego = 'F'; // I inicio,  F fin
int tiempoInicioPantallaJuego = 0; 

ArrayList<Nube> Nubes = new ArrayList<Nube>();
ArrayList<Enemigo> Enemigos = new ArrayList<Enemigo>();
Dino dino = new Dino(0,0);
 //<>//
void dibujarPantallaJuego(){
  int hSuelo = 40; 
  int ySuelo = height - hSuelo; 
  
  // Inicializa las variables de la pantalla de juego
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
  // Dibuja enemigos //<>//
  dibujarEnemigos(xEnemigos);
  // Dibuja al dino
  dino.display();
 
  // Dibujar menú
  fill(255);
  textSize(30);
  textAlign(LEFT,CENTER);
  text("Press 'e' for exit...", 10, ySuelo+10);
}
