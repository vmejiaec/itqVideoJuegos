// Funciones para dibujar las pantallas
void dibujarPantallaInicio(){
  noStroke();
  fill(255,0,0);
  rect(110, 110, 550, 110); // franja superior
  fill(255,255,0);
  rect(220, 220, 550, 110); // franja media
  fill(255,0,0);
  rect(330, 330, 550, 110); // franja inferior
  //Menú de Inicio
  textSize(100);
  textAlign(CENTER,CENTER);  
  text("DINO-RUN",4.5*110,2.33*110);
  fill(255,255,0);
  textSize(50);
  text("press 'g' for begin...",630,375);
  text("Víctor's",380,155);
}
