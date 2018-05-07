class Circulo extends Nodo {
  Circulo(int x, int y) {
    super(x, y);
  }
  void display() {
    pushStyle();
    strokeWeight(5);
    stroke(0);
    fill(0, 250, 0);
    if (pick (mouseX, mouseY)) {
      stroke(0, 255, 0);
      fill(255, 0, 0);
    }
    ellipse(posicion.x, posicion.y, radio, radio);
    popStyle();
  }

  void display(PVector pos) {
    posicion = pos;
    display();
  }
}
