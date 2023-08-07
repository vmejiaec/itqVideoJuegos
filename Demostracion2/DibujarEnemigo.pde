// Dimensiones del personaje
float altoEnemigo = 50;
float anchoEnemigo = 71;

// Movimiento del personaje
final int noEnemigos = 3;
float[] tEnemigo = new float[noEnemigos];
float[] xiEnemigo = new float[noEnemigos];
float[] yiEnemigo = new float[noEnemigos];
float[] VxiEnemigo = new float[noEnemigos];
float[] xEnemigo = new float[noEnemigos];
float[] yEnemigo = new float[noEnemigos];
float[] VxEnemigo = new float[noEnemigos];
PImage[] imgEnemigo = new PImage[3];

// Imágenes del enemigo
PImage imgEnemigoMedio;
PImage imgEnemigoAlto;
PImage imgEnemigoBajo;
// Alternación de vuelo
int alternarVuelo = 0;

void cargarImagenesEnemigo(){
  // Imagenes para cada paso
  imgEnemigoMedio = loadImage("./img/Dragon01.png");
  imgEnemigoAlto = loadImage("./img/Dragon02.png");
  imgEnemigoBajo = loadImage("./img/Dragon03.png");
  // imagenes iniciales de  cada enemigo
  imgEnemigo[0] = imgEnemigoMedio;
  imgEnemigo[1] = imgEnemigoMedio;
  imgEnemigo[2] = imgEnemigoMedio;
}

void setupEnemigos(){
  // Arranca los tiempos de cada enemigo
  tEnemigo[0] = 0;
  tEnemigo[1] = 0;
  tEnemigo[2] = 0;
  // Coloca a los enemigos al inicio del juego
  xiEnemigo[0] = 100;
  yiEnemigo[0] = 130;
  xiEnemigo[1] = 400;
  yiEnemigo[1] = 130;
  xiEnemigo[2] = 600;
  yiEnemigo[2] = 130;
  // Coloca las velocidades
  VxiEnemigo[0] = 1.5;
  VxiEnemigo[1] = 1.5;
  VxiEnemigo[2] = 1.5;
}

void dibujarEnemigos(){
 // Para cada enemigo 
 for (int i=0; i < tEnemigo.length; i++){
   // Conteo de tiempo
   ++tEnemigo[i];
   // Cálculos
   xEnemigo[i] = xiEnemigo[i] + VxiEnemigo[i] * tEnemigo[i];
   yEnemigo[i] = yiEnemigo[i];
   // Control si sale de la pantalla por la derecha
   if (xEnemigo[i]>width){
     xiEnemigo[i] = 0.0-anchoEnemigo;
     tEnemigo[i] = 0;
   }
   // Cálculo de la alternación
   if (tEnemigo[i] % 36 == 0){
    alternarVuelo++;
    alternarVuelo = alternarVuelo % 2;
   }
   // Control de colisiones
   boolean choque=false;
   choque = colision(
     xEnemigo[i], yEnemigo[i], anchoEnemigo, altoEnemigo,
     xPersonaje, yPersonaje, anchoPersonaje, alturaPersonaje
   );
   if (choque) {
     alternarVuelo = 2; //<>//
   }
   // dibuja la animación del enemigo
   dibujaEnemigo(xEnemigo[i], yEnemigo[i], alternarVuelo);
 }
}

void dibujaEnemigo(float x, float y, int vuelo){
  switch(vuelo){
    case 0: 
      image(imgEnemigoMedio, x, y);
      break;
    case 1: 
      image(imgEnemigoAlto, x, y);
      break;
    case 2: 
      image(imgEnemigoBajo, x, y);
      break;
  }  
}
