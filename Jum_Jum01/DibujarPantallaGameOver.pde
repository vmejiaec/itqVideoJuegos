void dibujarPantallaGameOver(){
  fill(255,250,0);
  beginShape();
    vertex(110,110);
    vertex(330,110);
    vertex(550,440);
    vertex(330,440);
  endShape();
  fill(250, 0,0);
  beginShape();
    vertex(440,110);
    vertex(660,110);
    vertex(880,440);
    vertex(660,440);
  endShape();
  fill(0,0,255);
  textSize(170);
  textAlign(CENTER,CENTER);
  text("GAMEOVER!", 500, 250);
  textSize(50);
  text("press 'r' for restart", 500,520);
}
