class Triangulo extends Nodo {
  Triangulo(int x, int y) {
    super(x, y);
  }
  void display() {
    pushStyle();
    strokeWeight(5);
    stroke(0);
    fill(#986F34);
    if (pick (mouseX, mouseY)) {
      stroke(#986F39);
      fill(0);
    }
    triangle(posicion.x-(radio-10), posicion.y+(radio-10), posicion.x, posicion.y-(radio-10 ), posicion.x+(radio-10), posicion.y+(radio-10));
    popStyle();
  }

  void display(PVector pos) {
    posicion = pos;
    display();
  }

}
