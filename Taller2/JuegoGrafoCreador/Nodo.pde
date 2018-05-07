abstract class Nodo {
  //attributos
  PVector posicion;
  float radio=20;
  Nodo(int x, int y) {
    posicion=new PVector(x, y);
  }
  abstract void display();

  boolean pick(int uno, int dos) {
    return sqrt(sq(uno-posicion.x) + (sq(dos-posicion.y)))<= radio/2;
  }

  void seleccionarNodo() {
    if (click==0) {
      lapiz[0]=posicion.x;
      lapiz[1]=posicion.y;
    } else {
      lapiz[2]=posicion.x;
      lapiz[3]=posicion.y;
    }
  }
}
