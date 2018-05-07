class Interfaz {
  //Atributos
  PImage [] fondos;
  String [] textos;

  //Constructor
  Interfaz (String imagen) {
    fondos = new PImage[imagenes.length];
    for (int i=0; i<fondos.length; i++)
      fondos[i]= loadImage(imagen);
  }

  //metodos

  void display(int actual) { 
    background(fondos[actual]);
  }

  void displayTexto() {
    if (juego==0) {
      background(0);
      pushStyle();
      textAlign(CENTER, CENTER);
      textSize(25);
      fill(255);
      text("escoge un modo de juego", width/2, height/2);
      text("1. Para jugar niveles ya creados", width/2, height/2 +50);
      text("2. Para crear un nivel", width/2, height/2 +100);
      popStyle();
    }
    if (juego==1) {
      pushStyle();
      textSize(15);
      stroke(0);
      fill(0);
      textAlign(CENTER, CENTER);
      text("Para jugar presione click en un punto y luego click en el siguiente, hasta terminar la figura, siga las lineas y no repita ninguna.", width/2, 15);
      text("Presione: R para reiniciar.    Q para salir.    F para cambiar el fondo.    N para cambiar la forma de los nodos", width/2, 40);
      textSize(50);
      text("NIVEL: ", width/2, 550);
      text(nivelActual+1, width/2 +90, 550);
      popStyle();
    }
    if (juego==2) {
      pushStyle();
      background(0);
      textAlign(LEFT);
      textSize(10);
      fill(255);
      text("bienvenido al modo creador", 10, 10);
      text(" condiciones de cración:", 10, 30);
      text(" _Haga click sobre la pantalla para dibujar los nodos.", 10, 50);
      text(" _Presione s para dibujar las lineas.", 10, 70);
      text(" _Presione l al terminar de dibujar las lineas.", 10, 90);
      popStyle();
    }
  }
}
