void keyPressed() {
  if (juego==0) {
    if (key=='1') {
      juego=1;
      estado++;
    }
    if (key=='2') {
      juego=2;
      estado++;
    }
  }
  if (juego ==1) {
    if (key=='n'|| key== 'N') {
      estado=1;
      contador=0;
      click=0;
      perder=0;
      if (nodoActual<2)
        nodoActual++;
      else
        nodoActual=0;
    }
    if (key=='s'|| key== 'S') {
      estado=1;
      contador=0;
      click=0;
      perder=0;
      if (nivelActual<archivo.length-1)
        nivelActual++;
      else
        nivelActual=0;
    }
    if (key=='r'|| key== 'R') {
      estado=1;
      contador=0;
      click=0;
      perder=0;
    }
    if (key=='f'||key=='F') {
      if (fondoActual<imagenes.length-3)
        fondoActual++;
      else
        fondoActual=0;

      estado=1;
      contador=0;
      click=0;
      perder=0;
    }
    if (key == 'q'|| key== 'Q')
      exit();
  }
}

void mouseClicked() {

  if (juego==2) {
    asignacion_dibujar();
    switch(creacionc) {
    case 1:
      creacionc++;
      break;
    case 2:
      creacionc=1;
      break;
    }
  }
}


void asignacion_dibujar() {
  int nodo1c=0, nodo2c;
  switch(creacionc) {
  case 0:
    nivelc.addColumn();
    fill(0, 0, 255);
    nivelc.setInt (0, columnasc, mouseX);
    nivelc.setInt(2, columnasc, mouseY);
    fill(#FFF529);
    ellipse(nivelc.getInt(0, columnasc), nivelc.getInt(2, columnasc), 30, 30);
    columnasc++;
    break;
  case 1:
    for (int a=0; a<nivelc.getColumnCount(); a++) {
      if ((mouseX>=(nivelc.getInt(0, a)-15))&&(mouseX<=(nivelc.getInt(0, a)+15))&&(mouseY>=(nivelc.getInt(2, a)-15))&&(mouseY<=(nivelc.getInt(2, a)+15))) {
        lapizc[0]=nivelc.getInt(0, a);
        lapizc[1]=nivelc.getInt(2, a);
        nodo1c=a;
      }
    }
    break;
  case 2:
    for (int a=0; a<nivelc.getColumnCount(); a++) {
      if ((mouseX>=(nivelc.getInt(0, a)-15))&&(mouseX<=(nivelc.getInt(0, a)+15))&&(mouseY>=(nivelc.getInt(2, a)-15))&&(mouseY<=(nivelc.getInt(2, a)+15))) {
        lapizc[2]=nivelc.getInt(0, a);
        lapizc[3]=nivelc.getInt(2, a);
        nodo2c=a;
        stroke(255, 0, 0);
        strokeWeight(5);
        line(lapizc[0], lapizc[1], lapizc[2], lapizc[3]);
        nivelc.setInt((nodo1c+4), nodo2c, 1);
        nivelc.setInt((nodo2c+4), nodo1c, 1);
      }
    }
    break;
  }
}
