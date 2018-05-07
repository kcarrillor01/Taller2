//vectores necesarios
Grafo[]grafos;
Interfaz[]fondos;
String[]archivo= {"level1.csv", "level2.csv", "level3.csv", "level4.csv", "level5.csv", "levelcreated.csv"};
String []imagenes= {"fondo1.jpg", "fondo2.jpg", "fondo3.jpg", "fondo4.jpg", "fondo5.jpg", "fondo6.jpg", "fondo7.jpg"};
float []lapiz = new  float [4];
float[]lapizc = new float[4];
Table nivelc;

//variables auxiliares
int nivelActual, nodoActual, fondoActual, click, perder, estado, juego, columnasc, creacionc=0, asistente=0;
double contador;




void setup() {
  size(1000, 600);
  nivelc= new Table();
  grafos=new Grafo[archivo.length];
  for (int i=0; i<grafos.length; i++) {
    grafos[i]=new Grafo(archivo[i]);
  }
  fondos= new Interfaz[imagenes.length];
  for (int i=0; i<fondos.length; i++) {
    fondos[i]=new Interfaz(imagenes[i]);
  }
  //Menu previo al juego
  fondos[0].displayTexto();
}



void draw() {
  if (juego==1)
    if (estado==1) { 
      fondos[fondoActual].display(fondoActual);
      fondos[fondoActual].displayTexto();
      grafos[nivelActual].displayLinea();
      estado++;
    } else if (estado ==2) {   
      grafos[nivelActual].displayNodo(nodoActual);
      grafos[nivelActual].comparar();
      grafos[nivelActual].jugar();
    }
  if (juego==2) { 
    switch(asistente) {
    case 0:
      fondos[0].displayTexto();
      asistente++;
      break;
    case 1: 
      if (keyPressed==true&&key=='s') {
        creacionc++;
        for (int i=0; i<nivelc.getColumnCount(); i++) {
          println(nivelc.getFloat(0, i));
          println(nivelc.getFloat(2, i));
        }
        for (int i=0; i<=nivelc.getColumnCount(); i++) {
          nivelc.addRow();
        }

        delay(1000);
      }
      if (keyPressed==true&&key=='l') {

        creacionc=7;//totearla
        for (int f=2; f<nivelc.getRowCount(); f++) {
          for (int c=0; c<nivelc.getColumnCount(); c++) {
            if (nivelc.getFloat(f, c)!=1) {
              nivelc.setFloat(f, c, 0);
            }
          }
        }
        saveTable(nivelc, "data/levelcreated.csv");
        juego=1;
        break;
      }
    }
  }
}
