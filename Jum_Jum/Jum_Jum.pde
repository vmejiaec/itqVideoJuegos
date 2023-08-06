// Videojuego Jum

// - sección declarativa
char estadoJuego = 'I'; // I: Inicio, P: Juego, O: GameOver

// Funciones para dibujar las pantallas
void dibujarPantallaInicio(){
  noStroke();
  fill(255,0,0);
  rect(110, 110, 550, 110); // franja superior
  fill(255,255,0);
  rect(220, 220, 550, 110); // franja media
  fill(255,0,0);
  rect(330, 330, 550, 110); // franja inferior
  //Menú de Inicio
  textSize(100);
  textAlign(CENTER,CENTER);  
  text("DINO-RUN",4.5*110,2.33*110);
  fill(255,255,0);
  textSize(50);
  text("press 'g' for begin...",630,375);
  text("Víctor's",380,155);
}

void dibujarNube(float x, float y){
  int wNube = 66;
  int hNube = 60;
  PImage imgNube = loadImage("img/Nube1.png","png");
  image(imgNube,x,y);
  //fill (150);
  //rect(x, y, wNube, hNube);
}

void dibujarPantallaJuego(){
  // Dibuja suelo
  int suelo = 550; 
  fill(100);
  rect(0,suelo, width, 50);
  // Dibuja cielo
  dibujarNube(50, 100);
  dibujarNube(350, 200);
  dibujarNube(800, 60);
  // Dibujar menú
  fill(0255,255);
  textSize(30);
  textAlign(LEFT);
  text("Press 'e' for exit...", 50, suelo+32);
}

void dibujarPantallaGameOver(){
  fill(255,250,0); //<>//
  beginShape();
    vertex(110,110);
    vertex(330,110);
    vertex(550,440);
    vertex(330,440);
  endShape();
  fill(250, 0,0);
  beginShape();
    vertex(440,110);
    vertex(660,110);
    vertex(880,440);
    vertex(660,440);
  endShape();
  fill(0,0,255);
  textSize(170);
  textAlign(CENTER,CENTER);
  text("GAMEOVER!", 500, 250);
  textSize(50);
  text("press 'r' for restart", 500,520);
}

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
      if (estadoJuego == 'I') estadoJuego = 'P';
      break;
    case 'e':
      if (estadoJuego == 'P') estadoJuego = 'O';
      break;
    case 'r':
      if (estadoJuego == 'O') estadoJuego = 'I';
      break;
  }
}
