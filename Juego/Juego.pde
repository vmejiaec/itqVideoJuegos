int ScreenBackColor = 150;
int TextColor = 255;
int TextSize = 55;

float  x = 0 ;
float Vx = 0 ;
float  y = 0 ;
float Vy = 0 ;
float Ay = 0 ;

void SetTopMessage(){
  textSize(TextSize);
  fill(TextColor);
  String mensaje = "Ancho "+width + " alto "+ height ;
  textAlign(CENTER);
  text(mensaje, width/2, 50 );
  fill(ScreenBackColor);
}

void cat(float x, float y, int direction){
  //Cuerpo
  triangle(75,60,50,250,100,250);  
  // Cabeza
  rect(50,50,50,80);
  switch(direction){
    case 0:
      // Ojos
      rect(55,60,10,40);
      rect(85,60,10,40);
      // Pupilas
      fill(0);
      rect (88,60,4,40); 
      rect (58,60,4,40);
      fill(255);
      break;
    case 1:
      // Ojos
      rect(85,60,10,40);
      // Pupilas
      fill(0);
      rect (93,60,4,40);
      fill(255);
      break;
    case -1:
      // Ojos
      rect(55,60,10,40);
      // Pupilas
      fill(0);
      rect (54,60,4,40);
      fill(255);      
      break;
  }
}

void setup(){
   size(1200,600);
   fill(ScreenBackColor);
}

void draw (){
  SetTopMessage();
  int direction = 1;
  cat(direction);
}
