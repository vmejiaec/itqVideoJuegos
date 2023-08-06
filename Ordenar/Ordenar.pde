// Crea el arreglo para almacenar la
// lista de cinco números

int [] lista = new int [5];
void setup(){
  size(800,600);
  textSize(30);
  fill(255,0,255);
  // Ingreso los cinco números al arreglo
  lista[0]= 26;
  lista[1]= 41;
  lista[2]= 28;
  lista[3]= 17;
  lista[4]= 14;
  // Presenta la lista antes de ordenar
  text("Antes de ordenar", 10, 100);
  for (int i = 0; i< 5;i++){
    text(i + " : "+lista[i], 0,50*i+70+100);
  }
  // Algoritmo para ordenar la lista
  int menor;
  int iMenor;
  int aux;
  boolean menorEncontrado;
  for (int i = 0; i< 5; i++){
    // tomo al primero como posible menor
    menor = lista[i]; //<>//
    iMenor = i;
    // busco un valor menor
    menorEncontrado = false;
    for (int j = i +1; j<5 ; j++){
      if(menor < lista[j]){
        // siguiente
      } else {
        // cambio el menor
        menor = lista[j];
        iMenor =j;
        menorEncontrado = true;
      }
    }
    // si encontramos un valor menor
    // intercambio el menor por el primero
    if (menorEncontrado){
      aux = lista[i];
      lista[i] = lista[iMenor];
      lista[iMenor] = aux;
    }
    // Publico los resultados intermedios
    for (int k = 0; k< 5;k++){
      text(k + ": "+lista[k], 140*i+140,50*k+70+100);
      fill(155,50,(k+i)*25+50);
    }
  }
  // Presenta la lista después de ordenar
  text("Después de ordenar", 500, 100);
}
