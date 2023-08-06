float tNube = 0;          // el tiempo de la animación de las nubes
float VxNube = -1;        // la velocidad de la animación de las nubes
float xInicioNube = 500;  // posición inicial de la primera nube
float xNube;              // posición de la primera nube

float alturaPersonaje = 100;
float anchoPersonaje = 50;
boolean estaSaltando = false;

float yPersonaje;         // posición vertical del personaje
float yiPersonaje= 0;     // posición vertical inicial del personaje
float VyiPersonaje = 0;   // velocidad vertical inicial del personaje 
float AyPersonaje = 0;    // aceleración vertical del personaje
float tPersonaje =0;      // tiempo de la animación del personaj

float txPersonaje = 0;
float xiPersonaje = 0;
float xPersonaje = 0;
float VxiPersonaje = 0;
boolean esEmpujado = false;

void setupPersonaje(){
  yiPersonaje = height - 40 - alturaPersonaje;
  yPersonaje = yiPersonaje;  
}

void empujePersonaje(){
  if (esEmpujado == false) {
    esEmpujado = true;
    VxiPersonaje = 5;
    txPersonaje = 0;
    
  }  
}

void saltarPersonaje(){
  if (estaSaltando == false){
    estaSaltando = true;
    AyPersonaje = 0.03;
    VyiPersonaje = -4;
    tPersonaje =0 ;
  }
}

void dibujarPantallaGame(){
  background(255);
  textSize(30);  
  // dibujar suelo
  rect(0,height-40,width, 40);
  // dibujar la nube
  PImage nube;  
  nube = loadImage("img/Nube1.png");  
  tNube = tNube + 1;
  xNube = xInicioNube + VxNube * tNube;  
  image(nube,xNube,100);  
  // Cálculos para la animación del salto
  if (estaSaltando == true){
    // Cálculo del tiempo para animar el salto
    tPersonaje = tPersonaje + 1;
    // Cálculo de la posición vertical durante el salto
    yPersonaje = yiPersonaje + VyiPersonaje * tPersonaje + 0.5*AyPersonaje*tPersonaje*tPersonaje;
    // Controla cuando el personaje vuelve al suelo y termina el salto
    if (yPersonaje > height -40-alturaPersonaje) {
      estaSaltando = false;
      yPersonaje = height -40-alturaPersonaje;
      tPersonaje = 0;
      VyiPersonaje = 0;
      AyPersonaje = 0;
      VxiPersonaje = 0;
      esEmpujado = false;
      xiPersonaje = xPersonaje;
    }
  }
  
  if (esEmpujado == true) {
    txPersonaje = txPersonaje + 1;
  }
  
  // cálculos para el movimiento horizontal
  xPersonaje = xiPersonaje + VxiPersonaje * txPersonaje;
  
  // Control de choque con la pared izquierda
  if (xPersonaje + anchoPersonaje > width){
    VxiPersonaje = - VxiPersonaje;
    VyiPersonaje = VyiPersonaje +  0.1 * VyiPersonaje;
    xiPersonaje = width - anchoPersonaje;
    txPersonaje = 0;
  }
  // Control de choque con la pared derecha
  if (xPersonaje < 0){
    VxiPersonaje = - VxiPersonaje;
    VyiPersonaje = VyiPersonaje +  0.1 * VyiPersonaje;
    xiPersonaje = 0;
    txPersonaje = 0;
  }
  
  // Dibujar el personaje
  rect(xPersonaje, yPersonaje, anchoPersonaje, alturaPersonaje);
  
  text("Pulsar la tecla 'e' para salir del videojuego",100,100);
}
