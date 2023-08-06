void keyPressed(){
  switch(key){
    case 'W':
    case 'w':
      saltarPersonaje();
      break;
    case  'R':
    case  'r':
      if(estado == 'e') {
        estado = 'r';
      }
      break;
    case  'G':
    case  'g':
      if(estado == 'r') {
        estado = 'g';
      }
      break;
    case  'E':
    case  'e':
      if(estado == 'g') {
        estado = 'e';
      }
      break;
  }
}
