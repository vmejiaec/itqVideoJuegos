PImage[] imgCajas = new PImage[5];
float[] xCajas = new float[5];
float[] xInicioCajas = new float[5];
float[] yInicioCaja = new float[5]; 
float[] tCajas = new float[5];
float[] tInicioCajas = new float[5];
float VxCajas = -0.15;

void dibujarCajas(){
  for (int i = 0; i< 5; i++){
    // Tomar el tiempo
    tCajas[i] = millis() - tInicioCajas[i];
    xCajas[i] = xInicioCajas[i] + VxCajas * tCajas[i]; 
    // Si la caja llega al final, la pongo al inicio
    if (xCajas[i]+imgCajas[i].width < 0){
      xInicioCajas[i] = width;
      tInicioCajas[i] = millis();
    }
    // dibujo la caja
    dibujarCaja(i);
  }
}

void dibujarCaja(int i){
  // dibuja la caja
  image(imgCajas[i], xCajas[i], yInicioCaja[i]);
}

void setupCajas(){
  // Tomar los tiempos iniciales
  for (int i = 0; i<5;i++){
    tInicioCajas[i] = millis();
  }
  // Cargar imágenes de cajas
  imgCajas[0] = loadImage("img/Caja03.png","png"); 
  imgCajas[1] = loadImage("img/Caja04.png","png");
  imgCajas[2] = loadImage("img/Caja01.png","png");
  imgCajas[3] = loadImage("img/Caja04.png","png");
  imgCajas[4] = loadImage("img/Caja02.png","png");
  // Posición de las cajas
  xInicioCajas[0] = width;
  xInicioCajas[1] = 200+ xInicioCajas[0]+imgCajas[0].width;
  xInicioCajas[2] = 200+xInicioCajas[1]+imgCajas[1].width;
  xInicioCajas[3] = 100+xInicioCajas[2]+imgCajas[2].width;
  xInicioCajas[4] = 100+xInicioCajas[3]+imgCajas[3].width;
  //height - 50;
  yInicioCaja[0] = height - 50-imgCajas[0].height;
  yInicioCaja[1] = height - 50-imgCajas[1].height;
  yInicioCaja[2] = height - 50-imgCajas[2].height;
  yInicioCaja[3] = height - 50-imgCajas[3].height;
  yInicioCaja[4] = height - 50-imgCajas[4].height;
}
