//vectores necesarios
Grafo[]grafos;
Interfaz[]fondos;
String[]archivo= {"level1.csv", "level2.csv", "level3.csv", "level4.csv", "level5.csv"};
String []imagenes= {"fondo1.jpg", "fondo2.jpg", "fondo3.jpg", "fondo4.jpg", "fondo5.jpg", "fondo6.jpg", "fondo7.jpg"};
float []lapiz = new  float [4];


//variables auxiliares
int nivelActual, nodoActual, fondoActual, click, perder, estado;
double contador;




void setup() {
  size(1000, 600);
  grafos=new Grafo[archivo.length];
  for (int i=0; i<grafos.length; i++) {
    grafos[i]=new Grafo(archivo[i]);
  }
  fondos= new Interfaz[imagenes.length];
  for (int i=0; i<fondos.length; i++) {
    fondos[i]=new Interfaz(imagenes[i]);
  }
}



void draw() {

  if (estado==0) { 
    fondos[fondoActual].display(fondoActual);
    fondos[fondoActual].displayTexto();
    grafos[nivelActual].displayLinea();


    estado++;
  } else if (estado ==1) {   
    grafos[nivelActual].displayNodo(nodoActual);
    grafos[nivelActual].comparar();
  }
}

void keyPressed() {
  if (key=='n'|| key== 'N') {
    estado=0;
    contador=0;
    click=0;
    perder=0;
    if (nodoActual<2)
      nodoActual++;
    else
      nodoActual=0;
  }
  if (key=='s'|| key== 'S') {
    estado=0;
    contador=0;
    click=0;
    perder=0;
    if (nivelActual<archivo.length-1)
      nivelActual++;
    else
      nivelActual=0;
  }
  if (key=='r'|| key== 'R') {
    estado=0;
    contador=0;
    click=0;
    perder=0;
  }
  if (key=='f'||key=='F') {
    estado=0;
    contador=0;
    click=0;
    perder=0;
    if (fondoActual<imagenes.length-3)
      fondoActual++;
    else
      fondoActual=0;
  }
  if (key == 'q'|| key== 'Q')
    exit();
}

void mouseClicked() {

  grafos[nivelActual].jugar();
}
