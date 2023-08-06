char estadoAnimacionPantallaJuego = 'F'; // I inicio,  F fin
int tiempoInicioPantallaJuego = 0; 

ArrayList<Nube> Nubes = new ArrayList<Nube>();
ArrayList<Enemigo> Enemigos = new ArrayList<Enemigo>();
Dino dino = new Dino(0,0);

boolean colision (
  float xa, float ya, float wa, float ha,
  float xb, float yb, float wb, float hb
){
  if (xa + wa < xb ) return false;
  if (ya + ha < yb ) return false;
  if (xb + wb < xa ) return false;
  if (yb + hb < ya ) return false;
  return true;
}
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
  float tiempo = millis() - tiempoInicioPantallaJuego; //<>//
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
 
  // Confirma que no existan coliciones de dino y sus enemigos
  for (int i =0; i<Enemigos.size(); i++){
    float x1 = Enemigos.get(i).x;
    float y1 = Enemigos.get(i).y;
    float w1 = Enemigos.get(i).ancho;
    float h1 = Enemigos.get(i).alto;
    float x2 = dino.x;
    float y2 = dino.y;
    float w2 = dino.w;
    float h2 = dino.h;
    
    if (colision(x1,y1,w1,h1,x1,y1,w1,h1)){
      noLoop();
    }
  }
 
  // Dibujar menú
  fill(255);
  textSize(30);
  textAlign(LEFT,CENTER);
  text("Press 'e' for exit...", 10, ySuelo+10);
}
