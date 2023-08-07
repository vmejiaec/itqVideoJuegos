void keyPressed(){
  switch(key){
    case 'A':
    case 'a':
      empujePersonaje('a');
      break;
    case 'D':
    case 'd':
      empujePersonaje('d');
      break;
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
        setupEnemigos();
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
