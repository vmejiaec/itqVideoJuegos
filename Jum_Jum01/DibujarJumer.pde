  float xJum;
  float yJum;
  float yInicioJum;
  float AyJum = 0.0;
  float VyJum = 0.0;
  float AySaltoJum = 0.0005;
  float AyCaidaJum = 0.0007;
  float VySaltoJum = -0.6;
  float tInicioJum;
  float tJum = 0;
  
  float wInicioJum = 50;
  float hInicioJum = 90;
  float wJum = 0;
  float hJum = 0;
  
  boolean jumEstaSaltando = false;  
  boolean jumEstaCayendo = false;
   
  void dibujarJum(){
    if ( jumEstaSaltando) {
      // calculo del tiemmpo
      tJum = millis() - tInicioJum;    
      // movimiento    
      yJum = yInicioJum + VyJum * tJum + 0.5 * AyJum * tJum * tJum;
      // controla que haya tocado el suelo
      if ( yJum >  suelo-hJum) {
        jumEstaSaltando = false;
        jumEstaCayendo = false;
        AyJum = 0.0;
        VyJum = 0.0;
        yJum = suelo-hJum;
      }
    }
    // dibuja a dino
    fill(0,0,255);    
    rect(xJum,yJum,wJum,hJum);
  }
  
  void setupJum(){
    jumEstaSaltando = false;
    jumEstaCayendo = false;
    xJum = 50;
    wJum = wInicioJum;
    hJum = hInicioJum;
    yInicioJum = suelo-hJum;
    yJum = yInicioJum;
  }

  void saltaJum(){
    if ( ! jumEstaSaltando ){ //<>//
      jumEstaSaltando = true;
      tInicioJum = millis();
      AyJum = AySaltoJum;
      VyJum = VySaltoJum;
    }
  }
  
  void caeJum(){
    if (jumEstaSaltando){
      if (!jumEstaCayendo) {
        if (VyJum + AyJum * tJum > 0){
          jumEstaCayendo = true;
          VyJum = VySaltoJum*.6;
        }        
      }
    }
  }
