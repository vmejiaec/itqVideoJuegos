class Dino{
  float x;
  float y;
  float ancho = 50;
  float alto = 90;
  float w = ancho;
  float h = alto;
  float ay = 0.0;
  float vy = 0.0;
  float aySalto = 0.0031;
  float vySalto = -1.3;
  boolean estaSaltando;
  float tiempoSaltoInicio;
  float t = 0;  
  float suelo;  
  float piso ;
  boolean estaAgachado = false;
  
  Dino(float X, float Y){
    x = X;
    y = Y;
  }
  
  void display(){
    if ( estaSaltando) {
      // calculo del tiemmpo
      t = millis() - tiempoSaltoInicio;    
      // movimiento    
      y = suelo + vy * t + 0.5 * ay * t * t;
      // controla que haya tocado el suelo
      if ( y >  suelo) {
        estaSaltando = false;
        ay = 0.0;
        vy = 0.0;
        y = suelo;
      }
    } else {
      if (estaAgachado) {
        y = piso - h;
        w = ancho * 2;
        h = alto / 2;
      } else {
        y = suelo;
        w = ancho ;
        h = alto ;
      }
    }
    // dibuja a dino
    fill(0,0,255);
    rect(x,y,w,h);    
  }

  // Inicializa a Dimo
  void setup(float Piso){
    piso = Piso;
    suelo = piso-h;
    x = 100;
    y = suelo;    
  }

  void salta(){
    if ( ! estaSaltando ){
      estaSaltando = true;
      tiempoSaltoInicio = millis();
      ay = aySalto;
      vy = vySalto;
    }
  }
}
