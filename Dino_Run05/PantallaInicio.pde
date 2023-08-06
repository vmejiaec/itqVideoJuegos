char estadoAnimacionPantallaInicio = 'F'; // I inicio,  F fin
int TiempoInicioPantallaInicio = 0; 

// Dibuja la pantalla de inicio del juego
void dibujarPantallaInicio(){
  
  int uX = width / 9;
  int uY = height / 5;
  
  noStroke();
  if (estadoAnimacionPantallaInicio == 'F') {
    estadoAnimacionPantallaInicio = 'I';
    TiempoInicioPantallaInicio = millis();
  } 
  
  float Vp = 0.5;
  float tiempo = millis() - TiempoInicioPantallaInicio;
  float xsup = tiempo * Vp - 5*uX;
  float xinf = -tiempo * Vp + 5*uX;
  
  fill(255,0,0);
  rect(1*uX + xsup, 1*uY, 5*uX, 1*uY); // franja superior
  fill(255,255,0);
  rect(2*uX, 2*uY, 5*uX, 1*uY); // franja media
  fill(255,0,0);
  rect(3*uX+xinf, 3*uY, 5*uX, 1*uY); // franja inferior
  
  if (xsup >= 0.9*width) {
     estadoAnimacionPantallaInicio = 'F';
  }
  
  //Menú de Inicio
  textSize(100);
  textAlign(CENTER,CENTER);  
  text("DINO-RUN",4.5*uX,2.33*uY);
  fill(255,255,0);
  textSize(50);
  text("press 'g' for begin...",(3.5+5/2)*uX,3.4*uY);
  text("Víctor's",(1.5+5/2)*uX,1.33*uY);
}
