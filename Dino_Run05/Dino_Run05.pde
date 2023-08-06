// Videojuego Dino-Run

// - sección declarativa
char estadoJuego = 'I'; // I: Inicio, P: Juego, O: GameOver
int colorFondo = 200;

void setup(){
  size(1200,600);
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
    // Control de cambio de estado del juego
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
    // Controles para manejar a Dino
    case 'W':
    case 'w':
      if ( ! dino.estaSaltando ) { //<>//
        dino.salta();
      }
      dino.estaAgachado = false;
      break;
    case 'S':
    case 's':
      dino.estaAgachado = true;
      break;
  }
}

void keyReleased(){
  switch (key){
    case 'S':
    case 's':
      dino.estaAgachado = false;
      break;
  }
}
