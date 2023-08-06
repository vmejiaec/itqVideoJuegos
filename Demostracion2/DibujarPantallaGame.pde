float tNube = 0;          // el tiempo de la animación de las nubes
float VxNube = -1;        // la velocidad de la animación de las nubes
float xInicioNube = 500;  // posición inicial de la primera nube
float xNube;              // posición de la primera nube

float alturaPersonaje = 100;
float anchoPersonaje = 50;
boolean estaSaltando = false;

float yPersonaje;         // posición vertical del personaje
float yiPersonaje= 0;     // posición vertical inicial del personaje
float VyPersonaje= 0;
float VyiPersonaje = 0;   // velocidad vertical inicial del personaje 
float AyPersonaje = 0;    // aceleración vertical del personaje
float tPersonaje =0;      // tiempo de la animación del personaj

float txPersonaje = 0;
float xiPersonaje = 0;
float xPersonaje = 0;
float VxPersonaje = 0;
float VxiPersonaje = 5;
boolean esEmpujado = false;

PImage[] imgPer = new PImage[5];

void CargarImagenesPersonaje(){
  imgPer[0] = loadImage("./img/Aper01.png");
  imgPer[1] = loadImage("./img/Aper02CamIzq.png");
  imgPer[2] = loadImage("./img/Aper03CamIzq.png");
  imgPer[3] = loadImage("./img/Aper04SaltarSube.png");
  imgPer[4] = loadImage("./img/Aper04SaltarBaja.png");
}

void setupPersonaje(){
  yiPersonaje = height - 40 - alturaPersonaje;
  yPersonaje = yiPersonaje;  
}

void empujePersonaje(char sentido){
  if (esEmpujado == false) {
    esEmpujado = true;
    if (sentido == 'd') {
      VxPersonaje = VxiPersonaje;      
    } else {
      VxPersonaje = -VxiPersonaje;
    }    
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
    VyPersonaje = VyiPersonaje + AyPersonaje*tPersonaje;
    yPersonaje = yiPersonaje + VyiPersonaje * tPersonaje + 0.5*AyPersonaje*tPersonaje*tPersonaje;
    // Controla cuando el personaje vuelve al suelo y termina el salto
    if (yPersonaje > height -40-alturaPersonaje) {
      estaSaltando = false;
      yPersonaje = height -40-alturaPersonaje;
      tPersonaje = 0;
      VyiPersonaje = 0;
      AyPersonaje = 0;
      VxPersonaje = 0;
      esEmpujado = false;
      xiPersonaje = xPersonaje;
    }
  }
  
  if (esEmpujado == true) {
    txPersonaje = txPersonaje + 1;
  }
  
  // cálculos para el movimiento horizontal
  xPersonaje = xiPersonaje + VxPersonaje * txPersonaje;
  
  // Control de choque con la pared izquierda
  if (xPersonaje + anchoPersonaje > width){
    // Cambia la dirección horizontal
    VxPersonaje = - VxPersonaje;
    xiPersonaje = width - anchoPersonaje;
    txPersonaje = 0;
    // Aumenta la velocidad vertical
    if (VyPersonaje < 0){
      VyiPersonaje = 1.2*VyiPersonaje;
    }
  }
  // Control de choque con la pared derecha
  if (xPersonaje < 0){
    // cambia la dirección horizontal del personaje
    VxPersonaje = - VxPersonaje;
    xiPersonaje = 0;
    txPersonaje = 0;
    // Aumenta la velocidad vertical
    if (VyPersonaje < 0){
      VyiPersonaje = 1.2*VyiPersonaje;
    }
  }
  
  // Dibujar el personaje
  //rect(xPersonaje, yPersonaje, anchoPersonaje, alturaPersonaje);
  
  char sentido = 'i';  // por defecto a la izquierda
  
  if (VxPersonaje > 0) {
    sentido = 'd';
  } 
   
  if (estaSaltando){
    if (VyPersonaje < 0) {
      //image(imgPer[3],xPersonaje, yPersonaje);
      flipImageH(imgPer[3],xPersonaje, yPersonaje, sentido);
    } else {
      //image(imgPer[4],xPersonaje, yPersonaje);
      flipImageH(imgPer[4],xPersonaje, yPersonaje, sentido);
    }        
  } else{
    if (VxPersonaje == 0) {
      //image(imgPer[0],xPersonaje, yPersonaje);    
      flipImageH(imgPer[0],xPersonaje, yPersonaje, sentido);
    } else {
      if (txPersonaje % 4 == 0){
        //image(imgPer[1],xPersonaje, yPersonaje);
        flipImageH(imgPer[1],xPersonaje, yPersonaje, sentido);
      } else {
        //image(imgPer[2],xPersonaje, yPersonaje);
        flipImageH(imgPer[2],xPersonaje, yPersonaje, sentido);
      }
    }      
  }
    
    scale(1,1);
 
  // Coloca texto en la pantalla
  // Publico las variables del personaje
  fill(0);
  textSize(20);
  text("yP: "+yPersonaje, 100,100);
  text("VyP: "+VyPersonaje, 100,140);
  text("VyiP: "+VyiPersonaje, 100,180);
  // Menú del juego
  fill(155);
  textSize(30);
  text("Pulsar la tecla 'e' para salir del videojuego",width/2-100,height -12);
  fill(255);
}

void flipImageH(PImage img, float X, float Y, int sentido) {
  // sentido = 'd' derecha, sentido = 'i' izquierda
  pushMatrix();
  if (sentido == 'i'){
    image(img, X, Y);
  } else {
    scale(-1, 1);
    image(img, -X- img.width, Y);
  }
  popMatrix();
}
