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
    textSize(15);
    stroke(0);
    fill(0);
    textAlign(CENTER, CENTER);
    text("Para jugar presione click en un punto y luego click en el siguiente, hasta terminar la figura, siga las lineas y no repita ninguna.", width/2, 15);
    text("Presione: R para reiniciar.    Q para salir.    F para cambiar el fondo.    N para cambiar la forma de los nodos", width/2, 40);
    textSize(50);
    text("NIVEL: ", width/2, 550);
    text(nivelActual+1, width/2 +90, 550);
  }
}
