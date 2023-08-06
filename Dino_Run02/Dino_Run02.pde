// Videojuego Dino-Run

// - sección declarativa
char estadoJuego = 'I'; // I: Inicio, P: Juego, O: GameOver
int colorFondo = 200;

void setup(){
  size(1000,600);
}

void draw(){
  background(colorFondo);
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
    case 'G':
    case 'g':
      if (estadoJuego == 'I'){ 
        estadoJuego = 'P';      
        estadoAnimacionPantallaInicio = 'F';        
      }
      break;
    case 'E':
    case 'e':
      if (estadoJuego == 'P'){ 
        estadoJuego = 'O';
        estadoAnimacionPantallaJuego = 'F';
      }
      break;
    case 'R':
    case 'r':
      if (estadoJuego == 'O') estadoJuego = 'I';
      break;
  }
}
