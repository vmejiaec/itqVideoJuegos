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

void setupPersonaje(){
  yiPersonaje= height -40-alturaPersonaje;
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
  background(0,255,0);
  textSize(30);
  
  // dibujar suelo
  rect(0,height-40,width, 40);
  
  PImage nube;
  
  nube = loadImage("img/Nube1.png");
  
  t = t + 1;
  xNube = xInicioNube + VxNube * t;
  
  image(nube,xNube,100);
  
  // Cálculos
  if (estaSaltando == true){
    tPersonaje = tPersonaje + 1;
  }
  
  yPersonaje = yiPersonaje + VyiPersonaje * tPersonaje + 0.5*AyPersonaje*tPersonaje*tPersonaje;
  
  if (yPersonaje > height -40-alturaPersonaje) {
    estaSaltando = false;
    yPersonaje = height -40-alturaPersonaje;
    tPersonaje = 0;
    VyiPersonaje = 0;
    AyPersonaje = 0;
  }
  

  // Dibujar el personaje
  rect(100, yPersonaje, anchoPersonaje, alturaPersonaje);
  
  text("Pulsar la tecla 'e' para salir del videojuego",100,100);
}
