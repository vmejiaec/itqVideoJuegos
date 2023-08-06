boolean colision = false;

boolean hayColision(
    float x1,float y1,float w1,float h1,
    float x2,float y2,float w2,float h2, int i)
{
  noFill();
  stroke(50);
  rect(x1,y1,w1,h1);
  rect(x2,y2,w2,h2);
  
  textSize(20);
  text(x1, 10,20);
  text(y1, 10,40);
  text(w1, 10,60);
  text(h1, 10,80);
  
  text(x2, 100+100*i,20);
  text(y2, 100+100*i,40);
  text(w2, 100+100*i,60);
  text(h2, 100+100*i,80);
  fill(0,0,255);
  
  if(x1+w1 < x2) return false; 
  if(y1+h1 < y2) return false;
  if(x2+w2 < x1) return false;
  if(y2+h2 < y2) return false;
  return true;
}

void controlColisiones(){
  for (int i = 0; i<5 ; i++){
    colision = hayColision(
      xJum, yJum, wJum, hJum,
      xCajas[i], yInicioCaja[i], imgCajas[i].width, imgCajas[i].height,
      i
    );
  }
  
  if (colision) noLoop();
}
