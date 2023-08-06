// Esqueleto de los estados
char estado = 'r';  // Estados: g, r, e

void setup(){
  size(900,700);
  setupPersonaje();
  CargarImagenesPersonaje();
}

void draw(){
  background(100);
  switch(estado){
    case 'r':
      dibujarPantallaInicio();
      break;
    case 'e':
      dibujarPantallaGameOver();
      break;
    case 'g':
      dibujarPantallaGame();
      break;
  }
}
