int xFondo = 0;
int VxFondo = 2;
float xKong = 200;
float yKong = 350;
PImage imgFondo;
PImage barril;
PImage imgKong;
PImage df;
PImage banana;
int monoX = 100; // Posición en X del mono
int monoY = 350; // Posición en Y del mono
float monoVelY = 0; // Velocidad vertical del mono
float monoVelX = 3; // Velocidad horizontal del mono (puedes ajustarla)
float gravedad = 0.6; // Valor de la gravedad para simular el salto
boolean enElAire = false; // Variable para controlar si el mono está en el aire
int vidas = 3; // Número de vidas del jugador
PImage gameover;
// Variables para almacenar las imágenes para la animación de la caminata de kong
PImage kongCamina1;
PImage kongCamina2;

// Variable para alternar los pasos de kong
boolean camina1 = true;
int tiempo = 0;

void setup() {
  size(1000, 500);
  textAlign(CENTER, CENTER);
  df = loadImage("./img/df.jpg");
  imgFondo = loadImage("./img/esce1.png");
  imgKong = loadImage("./img/mono.png");
  banana = loadImage("./img/banana.png");
  barril = loadImage("./img/barril.png");
  gameover = loadImage("./img/gameover.jpg");
  // Cargar imagenes para animar el caminar de kong
  kongCamina1 = loadImage("./img/per1.png");
  kongCamina2 = loadImage("./img/per2.png");
  //
  camina1 = true;
  tiempo = 0;
}

char juegoEstado = 'i'; // 'i' para pantalla de inicio, 'p' para pantalla jugando, 'o' para pantalla Game Over
int bananaX = 700;
int score = 0;
int barrilX= 700;
//int barrilY=380;
void draw() {
  //Estados de la pantalla videojuego
  switch (juegoEstado) {
    case 'i': // Pantalla de inicio
      dibujaInicio();
      break;
    case 'p': // Pantalla jugando
      dibujaJugando();
      break;
    case 'o': // Pantalla Game Over
      dibujaGameOver();
      break;
  }
}

void dibujaInicio() {
  image(df, 0, 0);
}

void dibujaJugando() {
  // Mueve la "banana" hacia la (izquierda)
  bananaX -= 2; // valor para modificar la velocidad de banana//
  barrilX -=3;
  // Colisión entre "banana" y "imgKong"
  if (dist(bananaX, 200, monoX, monoY) < 50) {
    score++; // Incrementa el contador de puntos
    bananaX = width + 100; // Restablece la posición de "banana"
  }
  
  // Generación aleatoria de bananas
  if (bananaX <= -100) {
    bananaX = width + int(random(100, 500)); // Posición aleatoria en X
  }
  

  // cálculos del movimiento del fondo
  xFondo = xFondo + VxFondo;

  // Procedimiento para mover el fondo
  int imgFondoH = imgFondo.height;
  int imgFondoW = imgFondo.width;
  color[] px = imgFondo.pixels;
  loadPixels();
  imgFondo.loadPixels();
  for (int i = 0, y = 0; y < height; ++y) {
    int yimgFondo = Math.floorMod(y, imgFondoH);
    for (int x = 0; x < width; ++x, ++i) {
      int ximgFondo = Math.floorMod(x + xFondo, imgFondoW);
      int iimgFondo = ximgFondo + yimgFondo * imgFondoW;
      pixels[i] = px[iimgFondo];
    }
  }
  updatePixels();

  // Simulación de salto del mono
  if (enElAire) {
    monoVelY += gravedad;
    monoY += monoVelY;
    if (monoY >= 350) {
      monoY = 350;
      monoVelY = 0;
      enElAire = false;
    }
  }

  pushMatrix();
  image(banana, bananaX, 200);
  
  // Alterna los pasos
  tiempo = tiempo + 1;
  if (tiempo % 12 == 0) {
    if (camina1 == true) {
      camina1 = false;
      imgKong = kongCamina1;
    } else {
      camina1 = true;
      imgKong = kongCamina2;
    }
  }
  
  image(imgKong, monoX, monoY);
  
  //
  image(barril,barrilX,390);
  fill(125, 200, 0);
  textSize(40);
  text("Score: " + score, 60, 100);
  text("Vidas: " + vidas, 900, 100);
  popMatrix();

  // Restablece la posición de banana cuando sale
  if (bananaX <= -100) {
    bananaX = 1000;
  }
    if (barrilX <= -100) {
    barrilX = 1000;
  }
  // Detectar colisión entre jugador y barriles
  if (dist(monoX, monoY, barrilX, 390) < 50) {
    vidas--; // Restar una vida
     barrilX = width + int(random(100, 500)); // Posición aleatoria en X
    if (vidas <= 0) {
      juegoEstado = 'o'; // Cambiar a pantalla de Game Over si no quedan vidas
    }
  }
}



void dibujaGameOver() {
image(gameover,0,0);
}
// Asignación de teclas para los estados de pantalla del juego
void keyPressed() {
  if (juegoEstado == 'i' && key == 'p') {
    juegoEstado = 'p'; // Inicia el juego si se presiona "p"
    score = 0; // Reinicia el contador de puntos
    vidas = 3; // Reinicia el número de vidas
  } else if (juegoEstado == 'o' && key == 'r') {
    juegoEstado = 'i'; // Reinicia el juego si se presiona "r"
  }

  // Movimiento del mono
  if (juegoEstado == 'p') {
    if (key == 'w' || key == 'W') {
      if (!enElAire) {
        monoVelY = -15; // Velocidad inicial del salto (puedes ajustarla)
        enElAire = true;
      }
    }
  }
}
