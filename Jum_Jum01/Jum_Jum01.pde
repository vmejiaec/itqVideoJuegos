// Videojuego Jum
// - sección declarativa
char estadoJuego = 'I'; // I: Inicio, P: Juego, O: GameOver
int suelo = 550; 
  
void dibujarPantallaJuego(){
  // Dibuja suelo
  fill(100);
  rect(0,suelo, width, 50);
  // Dibuja las nubes
  dibujarNubes();
  // Dibuja las cajas
  dibujarCajas();
  // Dibuja el personaje
  dibujarJum();
  // Control de colisiones
  controlColisiones();
  // Dibujar menú
  fill(0255,255);
  textSize(30);
  textAlign(LEFT);
  text("Press 'e' for exit...", 50, suelo+32);
}
 //<>//
void setup(){
  size(1000,600);
}

void draw(){
  background(255);
  // Control del estado del juego
  switch(estadoJuego){
    case 'I':
      dibujarPantallaInicio();
      break;
    case 'P':
      dibujarPantallaJuego();
      break;
    case 'O':
      dibujarPantallaGameOver();
      break;
  }
}

void keyPressed(){
  switch(key){
    case 'g':
      if (estadoJuego == 'I'){
        // Si el estado es I, paso a P
        estadoJuego = 'P';
        setupNubes();
        setupCajas();
        setupJum();
      }
      break;
    case 'e':
      if (estadoJuego == 'P') {
        estadoJuego = 'O';
      }
      break;
    case 'r':
      if (estadoJuego == 'O') {
        estadoJuego = 'I';
      }
      break;
    // Control de salto y caerse
    case 'w':
      if ( ! jumEstaSaltando ) {
        saltaJum();
      }
      break;
    case 's':
      caeJum();
      break;
  }
}
