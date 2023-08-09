int xFondo = 0; 
int VxFondo = 2; 
float xKong = 200; 
float yKong = 350;
PImage imgFondo;
PImage imgKong;

void setup() {
  size(800, 500);
  // Carga imágenes de fondo y Kong
  imgFondo = loadImage("esce1.png");
  imgKong = loadImage("kong.png");
}

void draw() {

  // cálculos del movimiento del fondo
  xFondo = xFondo + VxFondo; //<>//
  
  // Procedimiento para mover el fondo
  int imgFondoH = imgFondo.height;
  int imgFondoW = imgFondo.width;
  color[] px = imgFondo.pixels;
  loadPixels();
  imgFondo.loadPixels();
  for (int i = 0, y = 0; y < height; ++y) {
    int yimgFondo = Math.floorMod(y , imgFondoH);
    for (int x = 0; x < width; ++x, ++i) {
      int ximgFondo = Math.floorMod(x + xFondo, imgFondoW);
      int iimgFondo = ximgFondo + yimgFondo * imgFondoW;
      pixels[i] = px[iimgFondo];
    }
  }
  updatePixels();

  // dibujar a kong
  image(imgKong, xKong, yKong);
}
