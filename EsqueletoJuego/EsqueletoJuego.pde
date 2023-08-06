// Dibujar un patrón de diseño que cubra el plano
// - sección de declaración de variables 
int numeroFilas= 15;
int numeroColumnas = 17;

// - función que dibuja el patrón de fondo
void dibujaPatronDisenio(){
  for (int i = 0; i<numeroFilas; i++ ){
    for (int j = 0; j < numeroColumnas; j++){
      if ((i+j) % 2 == 0 ){ // alterna el diseño
        fill(255,0,255);
        rect(i*30-15,j*30-15,30,30);
      } else {
        fill(255,100,255);
        circle(i*30, j*30, 30);
      }  
    }  
  }
}
// - declaración de la variable para controlar el estado del juego
char estadoJuego = 'I';

// - funciones para dibujar las pantallas del juego
void dibujaPantallaInicio(){
  text("INICIO DEL JUEGO", width/2, height/2);  
}

void dibujaPantallaJuego(){
  dibujaPatronDisenio();
  text("ESTAMOS JUGANDO", width/2, height/2);
}

void dibujaPantallaGameOver(){
  text("GAME OVER", width/2, height/2);
}

void setup(){
  size(800,600);
}
void draw(){
  background(100);
  if (estadoJuego == 'I'){
    dibujaPantallaInicio();
  } else {
    if (estadoJuego == 'P'){
      dibujaPantallaJuego();
    } else {
      if (estadoJuego == 'O'){
        dibujaPantallaGameOver();
      }
    }
  }
}

void keyPressed(){
  if (key == 'A'){
    estadoJuego = 'P';
  }
  if (key == 'S'){
    estadoJuego = 'O';
  }
  if (key == 'R'){
    estadoJuego = 'I';
  }
}
