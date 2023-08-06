// Videojuego Jum

// - sección declarativa
char estadoJuego = 'I'; // I: Inicio, P: Juego, O: GameOver
int colorFondo = 200;

// Funciones para dibujar las pantallas
void dibujarPantallaInicio(){
  int uX = width / 9;
  int uY = height / 5;
  noStroke();
  fill(255,0,0);
  rect(1*uX, 1*uY, 5*uX, 1*uY); // franja superior
  fill(255,255,0);
  rect(2*uX, 2*uY, 5*uX, 1*uY); // franja media
  fill(255,0,0);
  rect(3*uX, 3*uY, 5*uX, 1*uY); // franja inferior
  //Menú de Inicio
  textSize(100);
  textAlign(CENTER,CENTER);  
  text("DINO-RUN",4.5*uX,2.33*uY);
  fill(255,255,0);
  textSize(50);
  text("press 'g' for begin...",(3.5+5/2)*uX,3.4*uY);
  text("Víctor's",(1.5+5/2)*uX,1.33*uY);
}

void dibujarNube(float x, float y){
  int uX = width /15;
  int uY = height /10;  
  fill (255);
  rect(2*uX+x,uY+y,uX,uY);
  rect(3*uX+x,1.5*uY+y,2*uX/3,uY/2);
  rect(1.5*uX+x,1.35*uY+y,uX/2,1.3*uY/2);
  rect(1*uX+x,1.55*uY+y,uX/2,0.9*uY/2);
}

void dibujarPantallaJuego(){
  // Dibuja suelo
  int uX = width /15;
  int uY = height /10;  
  int suelo = 9*uY; 
  fill(100);
  rect(0,suelo, width, uY);
  // Dibuja cielo
  dibujarNube(0, 0);
  dibujarNube(5*uX, 2*uY);
  dibujarNube(12*uX, 0.5*uY);
  // Dibujar menú
  fill(0255,255);
  textSize(30);
  textAlign(LEFT);
  text("Press 'e' for exit...", uX, suelo+1.4*uY/2);
}

void dibujarPantallaGameOver(){
  int uX = width / 9;
  int uY = height / 5;
  fill(255,250,0);
  beginShape();
    vertex(1*uX,1*uY);
    vertex(3*uX,1*uY);
    vertex(5*uX,4*uY);
    vertex(3*uX,4*uY);
  endShape();
  fill(250, 0,0);
  beginShape();
    vertex(4*uX,1*uY);
    vertex(6*uX,1*uY);
    vertex(8*uX,4*uY);
    vertex(6*uX,4*uY);
  endShape();
  fill(0,0,255);
  textSize(170);
  textAlign(CENTER,CENTER);
  text("GAMEOVER!", width/2,0.9*height/2);
  textSize(50);
  text("press 'r' for restart", width/2,1.5*height/2);
}

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
      if (estadoJuego == 'I') estadoJuego = 'P';
      break;
    case 'E':
    case 'e':
      if (estadoJuego == 'P') estadoJuego = 'O';
      break;
    case 'R':
    case 'r':
      if (estadoJuego == 'O') estadoJuego = 'I';
      break;
  }
}
