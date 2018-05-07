class Raya extends Linea {

  //constructor 
  Raya(Nodo nodo1, Nodo nodo2) {
    super(nodo1, nodo2);
  }

  void display() {
    pushStyle();
    strokeWeight(5);
    stroke(0);
    line(origen.posicion.x, origen.posicion.y, destino.posicion.x, destino.posicion.y);
    popStyle();
    
    //strokeWeight(5);//dibuja lineas guias
    //stroke(255, 0, 0, 1);
    //line(origen.posicion.x, origen.posicion.y, destino.posicion.x, destino.posicion.y);
  }

}
