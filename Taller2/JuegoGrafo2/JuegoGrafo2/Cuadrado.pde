class Cuadrado extends Nodo {
  Cuadrado(int x, int y) {
    super(x, y);
  }
  void display() {
    pushStyle();
    strokeWeight(5);
    stroke(0);
    fill(100, 100, 255);
    if (pick (mouseX, mouseY)) {
      stroke(100, 100, 255);
      fill(0);
    }
    rect(posicion.x-(radio/2), posicion.y-(radio/2), radio, radio);
    popStyle();
  }

  void display(PVector pos) {
    posicion = pos;
    display();
  }
}
