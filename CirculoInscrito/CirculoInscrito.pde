// Declaración de variables
int base = 100;
int altura = 300;
int x = 100;
int y = 600;

void setup(){
  size(900,700);
  // Dibujo el tríangulo rectángulo
  strokeWeight(5);
  triangle(x,y,x+base,y,x,y-altura);
  //calculos
  float hipotenusa = sqrt(base*base+altura*altura);
  float S = base * altura /2;
  float r = 2 * S / (base+altura+hipotenusa);
  // dibuja el círculo
  noFill();
  stroke(0,255,255);
  circle(x+r,y-r, 2 * r);
}
