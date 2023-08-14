PImage portada;
PImage Gameover;
char juegoEstado = 'i';
float y = 0.0;
float Vy = 0.0;
float Ay = 0.0;
float x = 0.0;
float Vx = 0.0;
float Ax = 0.0;
float y_picos_derecha = 0;
float Vy_picos_derecha = 0;
float y_picos_izquierda = 0;
float Vy_picos_izquierda = 0;
int puntaje = 0;
boolean pararJuego = true;
float monedaX;
float monedaY;
float radioMoneda = 22.5;

// variable para almacenar la posición y el tamaño del cubo
float xCubo;
float yCubo;
float wCubo;
float hCubo;

///////////////////////////////////////////Set up/////////////////////////////////////////////////////////////
void setup() {
  size(900, 1000);
  textAlign(CENTER, CENTER);
  portada = loadImage("portada.jpg");
  Gameover = loadImage("gameOver.jpeg");
  Vy_picos_derecha = -2;
  Vy_picos_izquierda = 2;
  respawnMoneda();
}

void draw() {
   if (pararJuego == true){
  background(255, 125, 20);
   

  switch (juegoEstado) {
    case 'i':
      dibujaInicio();
      break;
    case 'p':
      dibujaJugando();
      break;
    case 'o':
      dibujaGameOver();
      break;
  }
  
  textSize (20);
  fill(0);
  text ("x:" +x+450 , 300,300);
  text ("y:" +y+500 , 300,350);
  text ("xmoneda:" + monedaX , 300,400);
  text ("ymoneda:" + monedaY , 300,450);
}
}

////////////////////////////////////////////////////Inicio/////////////////////////////////////////////////////////////
void dibujaInicio() {
  fill (66,111,125);
  image(portada, 0, 0);
  textSize(30);
  text("Presiona 'P' para jugar", width/2, height/2 + 110);
}

//////////////////////////////////////////////////Jugando//////////////////////////////////////////////////////////////
void dibujaJugando() {
  fondo();
  puntajes();
  moneda();
  x = x + Vx;
  y = y + Vy;
 cubito(x, y); 

  Vy = Vy + Ay;
  Vx = Vx + Ax;
  
  //////////////////////////////////////////////Duplicado de picos/////////////////////////////////////////////////////

  y_picos_derecha = y_picos_derecha + Vy_picos_derecha;
  for (int i = 0; i < 100; i++) {
    picos_derecha(y_picos_derecha + i * 400);
  }

  y_picos_izquierda = y_picos_izquierda - Vy_picos_izquierda;
  for (int i = 0; i < 100; i++) {
    picos_izquierda(y_picos_izquierda + i * 400);
  }

  for (int x = 0; x < 15; x++) {
    picos(x * 50);
  }

  for (int x = 0; x < 15; x++) {
    picos_abajo(x * 50);
  }
  
  ///////////////////////////////////////////////////Moneda//////////////////////////////////////////////////////////////////

  if (dist(450 + x, 625 + y, monedaX, monedaY) < 2 * radioMoneda) {
     //pararJuego = false;
    puntaje++;
    respawnMoneda();
  }

/////////////////////////////////////////////////////Juego estado///////////////////////////////////////////////////////////
/*
  if (x < -350 || x > 400 || y > 310 || y < -460) {
    juegoEstado = 'o';
  }
*/
}

/////////////////////////////////////////////////////Game over/////////////////////////////////////////////////////////////////

void dibujaGameOver() {
  fill (255);
  image(Gameover, 0, 0);
  textSize(20);
  text("Presiona 'R' para reiniciar", 450,50);
}


////////////////////////////////////////////////////Keypressed//////////////////////////////////////////////////////////////////

void keyPressed() {
  if (juegoEstado == 'i' && key == 'p') {
    juegoEstado = 'p';
  } else if (juegoEstado == 'o' && key == 'r') {
    juegoEstado = 'i';
    pararJuego = true;
    x = 0.0;
    y = 0.0;
    puntaje = 0;
    Vy = 0.0;
    Vx = 0.0;
    Ax = 0.0;
    y_picos_derecha = 0;
    y_picos_izquierda = 0;
    respawnMoneda();
  }
switch (key) {
    case 'd':
      Vy = -4;
      Ay = 0.20;
      Vx = 4;
      Ax = -0.05;
      break;
    case 'a':
      Vy = -4;
      Ay = 0.20;
      Vx = -4;
      Ax = -0.05;
      break;
  }
}

///////////////////////////////////////////////////////////Personaje////////////////////////////////////////////////////////

void cubito(float x, float y) {
  if (key == 'd') { //derecha
    Vx = 10;
    fill(170, 68, 101);
    rect(425 + x, 600 + y, 50, 50);
    fill(255, 166, 158);
    circle(445 + x, 615 + y, 15);
    circle(465 + x, 615 + y, 15);
    rect(435 + x, 630 + y, 30, 10);
  } else if (key == 'a') { //izquierda
    Vx = -10;
    fill(170, 68, 101);
    rect(425 + x, 600 + y, 50, 50);
    fill(255, 166, 158);
    circle(435 + x, 615 + y, 15);
    circle(455 + x, 615 + y, 15);
    rect(435 + x, 630 + y, 30, 10);
  } else { //quieto
    Vx = 0;
    fill(170, 68, 101);
    rect(425 + x, 600 + y, 50, 50);
    fill(255, 166, 158);
    circle(440 + x, 615 + y, 15);
    circle(460 + x, 615 + y, 15);
    rect(435 + x, 630 + y, 30, 10);
  }
  
    // Coloca las coordenadas del cubo
    xCubo = 425 + x;
    yCubo = 600 + y;
    wCubo = 50;
    hCubo = 50;
}

/////////////////////////////////////////////////////Fondo////////////////////////////////////////////////////////////

void fondo() {
   fill(123, 241, 168);
  rect(0, 0, 1000, 1000);
  fill(193, 251, 164);
  rect(0, 0, 75, 1000);
  rect(825, 0, 100, 1000);
}

/////////////////////////////////////////////////////Moneda////////////////////////////////////////////////////////////

void moneda() {
  fill(239, 184, 16);
  circle(monedaX, monedaY, 45);
  fill(168, 123, 5);
  circle(monedaX, monedaY, 30);
  fill(255, 255, 32);
  circle(monedaX-3, monedaY-4, 15);
}

/////////////////////////////////////////////////////Puntaje////////////////////////////////////////////////////////////

void puntajes() {
 fill(93, 219, 141);
  textSize(450);
  text(puntaje, 450, 400);
}

/////////////////////////////////////////////////////Picos////////////////////////////////////////////////////////////

void picos(float x) {
  fill(144, 241, 239);
  triangle(75 + x, 0, 125 + x, 0, 100 + x, 50);
  if (yCubo < 50) {
     juegoEstado = 'o';
     pararJuego = false;  // Para el juego
   }
}

void picos_derecha(float y) {
   fill(144, 241, 239);
   triangle(75, 0 + y, 75, 50 + y, 125, 25 + y);
   // Colisión 
   float xp = 125;
   float yp = 25 + y;
   boolean choque = true;
   if (xp < xCubo) {
     choque = false;
   } else {
     if (yp < yCubo) {
       choque = false;
     } else {
       if (yp > yCubo + hCubo) {
         choque = false;
       } else {
         choque = true;
       }
     }
   }
   if (choque == true) {
     juegoEstado = 'o';
     pararJuego = false;  // Para el juego
   }
}

void picos_izquierda(float y) {
  fill(144, 241, 239);
  triangle(825, 0 + y, 825, 50 + y, 775, 25 + y);
   // Colisión 
   float xp = 775;
   float yp = 25 + y;
   boolean choque = true;
   if (xCubo + wCubo < xp) {
     choque = false;
   } else {
     if (yp < yCubo) {
       choque = false;
     } else {
       if (yp > yCubo + hCubo) {
         choque = false;
       } else {
         choque = true;
       }
     }
   }
   if (choque == true) {
     juegoEstado = 'o';
     pararJuego = false;  // Para el juego
   }
}

void picos_abajo(float x) {
  fill(144, 241, 239);
  triangle(75 + x, 900, 125 + x, 900, 100 + x, 850);
  if (yCubo > 800) {
     juegoEstado = 'o';
     pararJuego = false;  // Para el juego
   }
}

/////////////////////////////////////////////////////respawnMoneda////////////////////////////////////////////////////////////

void respawnMoneda() {
  monedaX = random(150, width-150);
  monedaY = random(150, height - 150);
}
