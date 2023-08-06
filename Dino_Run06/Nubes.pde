class Nube{
  float x;
  float y;
  float t=0;
  float tInicio;
  void setup(){
    tInicio = millis();
  }
  
  Nube(float X, float Y){
    x = X;
    y = Y;
  }
  
  void display(float X){
    fill (255);
    rect(X+x+  0,y-20,30,20);
    rect(X+x+ 30,y-30,20,30);
    rect(X+x+ 50,y-40,50,40);
    rect(X+x+100,y-20,30,20);
  }
}

void inicializaNubes(){
  // coloca las coordenadas de las nubes en el cielo 
  Nubes.add(new Nube(100,200));
  Nubes.add(new Nube(500,300));
  Nubes.add(new Nube(800,150));
}

void dibujarNubes(float x){
  for (int i = 0; i < Nubes.size();i++){
    Nubes.get(i).dibujar(x);
    if (x+Nubes.get(i).x +130 < 0) {
      Nubes.get(i).x = width - x;
    }
  }  
}
