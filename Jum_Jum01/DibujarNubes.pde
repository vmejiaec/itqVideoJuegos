float VxNubes = -0.025;
float[] tNubes = new float[3];
float[] tInicioNubes = new float[3];
float[] xNubes = new float[3];
float[] xInicioNubes = new float[3];
float[] yInicioNubes = new float[3];
PImage[] imgNubes = new PImage[3] ;

void dibujarNube(float x, float y, int i){
  image(imgNubes[i],x,y);
}

void setupNubes(){
  // Inicializa el tiempo de cada nube
  tInicioNubes[0] = millis();
  tInicioNubes[1] = millis();
  tInicioNubes[2] = millis();
  // posiciones iniciales de las nubes 
  xInicioNubes[0] = 50;
  xInicioNubes[1] = 450;
  xInicioNubes[2] = 800;
  yInicioNubes[0] = 150;
  yInicioNubes[1] = 50;
  yInicioNubes[2] = 250;  
  //Cargar las imágenes de nubes
  imgNubes[0] = loadImage("img/Nube1.png","png");
  imgNubes[1] = loadImage("img/Nube2.png","png");
  imgNubes[2] = loadImage("img/Nube3.png","png");
}

void dibujarNubes(){
  for (int i = 0; i<3 ; i++){
    tNubes[i] = millis() - tInicioNubes[i];
    xNubes[i] = xInicioNubes[i] + VxNubes * tNubes[i];
    dibujarNube(xNubes[i],yInicioNubes[i],i);
    // Control de salida de la pantalla
    if (xNubes[i]+imgNubes[i].width < 0){
      xInicioNubes[i] = width;
      tInicioNubes[i] = millis();
    }
  }    
}
