float xi= 100;
float yi = 100;
float x= 100;
float y = 100;
float Vxi = 1;
float Vyi = 0.08;
float Ayi = 0.002;
float t = 0;
float r = 10;

boolean cae = false;
int plano = 1;

void setup(){
  size(800,600);
}

void draw(){
  background(255);
  // Dibujar plano inclinado
  line(100,110,400,134);
  line(100,134+100,400,110+100);
  line(100,110+200,400,134+200);
  line(100,134+300,400,110+300);
  // Conteo del tiempo
  t=t+1;
  // cálculos
  if (t <= 300) {
    x  = xi + Vxi*t;
    y  = yi + Vyi*t;
  } else {
    cae = ! cae;
    y = yi-80 +Vyi*t+0.5*Ayi*t*t;
    if (y>100*plano+100) {
      if (cae == true){
        t = 0;
        xi = x;
        yi = y;
        Vxi = -Vxi;        
        cae = false;
        plano = plano +1;
      }
    }
  }
  // dibujar
  circle(x,y,2*r);
  publicar(y);
}

void publicar(float y){
  textSize(20);
  fill(0);
  text("y: "+y,10,100);
  fill(255);
}
