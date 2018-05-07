abstract class Linea {
  //Atributos
  Nodo origen, destino;

  //constructor
  Linea(Nodo nodo1, Nodo nodo2) {
    origen= nodo1;
    destino = nodo2;
  } 

  //posibles metodos
  abstract void display();

  //metodos que todas las  lineas usaran
  void jugar() {
    line(origen.posicion.x, origen.posicion.y, destino.posicion.x, destino.posicion.y);
  }
}
