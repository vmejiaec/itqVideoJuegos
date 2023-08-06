// Dibuja la pantalla de fin del juego
void dibujarPantallaGameOver(){
  int uX = width / 9;
  int uY = height / 5;
  fill(255,250,0);
  beginShape();
    vertex(1*uX,1*uY);
    vertex(3*uX,1*uY);
    vertex(5*uX,4*uY);
    vertex(3*uX,4*uY);
  endShape();
  fill(250, 0,0);
  beginShape();
    vertex(4*uX,1*uY);
    vertex(6*uX,1*uY);
    vertex(8*uX,4*uY);
    vertex(6*uX,4*uY);
  endShape();
  fill(0,0,255);
  textSize(170);
  textAlign(CENTER,CENTER);
  text("GAMEOVER!", width/2,0.9*height/2);
  textSize(50);
  text("press 'r' for restart", width/2,1.5*height/2);
}
