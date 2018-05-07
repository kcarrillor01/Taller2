class Grafo { //<>//
  Table nivel;
  Nodo[]generales;
  Nodo[]circulos;
  Nodo[]cuadrados;
  Nodo[]triangulos;
  Linea[]rayas;
  //algunas auxiliares 
  int  num_rayas, opuesto, aux;


  Grafo (String archivo) { 
    nivel= loadTable(archivo);
    generales = new Nodo[nivel.getColumnCount()];
    circulos = new Nodo[nivel.getColumnCount()];
    cuadrados = new Nodo[nivel.getColumnCount()];
    triangulos = new Nodo[nivel.getColumnCount()];




    //asi se sabe cuantas rayas necesita cada grafo para ganar
    for (int i=2; i<nivel.getRowCount(); i++) 
      for (int j=0; j<nivel.getColumnCount(); j++) 
        if (nivel.getInt(i, j)==1) 
          num_rayas++;
    //    rayas= rayas/2;

    //creo los objetos de Nodo
    for (int i=0; i < circulos.length; i++) {
      generales[i]= new Circulo(nivel.getInt (0, i), nivel.getInt( 1, i));
      circulos[i]= new Circulo(nivel.getInt (0, i), nivel.getInt( 1, i));
      cuadrados[i]=new Cuadrado (nivel.getInt(0, i), nivel.getInt(1, i));
      triangulos[i]=new Triangulo (nivel.getInt(0, i), nivel.getInt(1, i));
    }


    //crear los objetos de linea
    rayas=new Linea[num_rayas];

    for (int i=2; i<nivel.getRowCount(); i++) {
      for (int j=0; j<nivel.getColumnCount(); j++) {

        if (nivel.getInt(i, j)==1) {
          rayas[aux]=new  Raya(generales[i-2], generales[j]);
          aux++;
        }
      }
    }
    aux=0;
  }



  void displayNodo(int NodoActual) {
    switch(NodoActual) {
    case 0:
      for (int i=0; i<circulos.length; i++) {
        circulos[i].display();
      }
      break;
    case 1:
      for (int i=0; i<triangulos.length; i++) {
        triangulos[i].display();
      }
      break;
    case 2:
      for (int i=0; i<cuadrados.length; i++) {
        cuadrados[i].display();
      }
      break;
    }
  }

  void displayLinea() {
    for (int i=0; i<rayas.length; i++) 
      rayas[i].display();
  }

  //JUGABILIDAD

  void jugar() {
    if (mousePressed==true)
      switch(click) {
      case 0:
        for (int i=0; i<generales.length; i++) 
          if (generales[i].pick(mouseX, mouseY)) {
            lapiz[0]=generales[i].posicion.x;
            lapiz[1]=generales[i].posicion.y;
            opuesto=i;
          }
        click++;
        break; 

      case 1:
        for (int i=0; i<generales.length; i++) 
          if (generales[i].pick(mouseX, mouseY)) {
            lapiz[2]=generales[i].posicion.x;
            lapiz[3]=generales[i].posicion.y;


            switch(nivel.getInt(i+2, opuesto)) {
            case 0:
              println("ud no pude dibujar aqui");
              break;
            case 1:
              //Dibujar la linea      
              for (int a=0; a<rayas.length; a++) 
                if (((lapiz[0]==rayas[a].origen.posicion.x)&&(lapiz[1]==rayas[a].origen.posicion.y)&&(lapiz[2]==rayas[a].destino.posicion.x)&&(lapiz[3]==rayas[a].destino.posicion.y))||((lapiz[0]==rayas[a].destino.posicion.x)&&(lapiz[1]==rayas[a].destino.posicion.y)&&(lapiz[2]==rayas[a].origen.posicion.x)&&(lapiz[3]==rayas[a].origen.posicion.y))) {

                  pushStyle();
                  strokeWeight(5);
                  stroke(255, 0, 0);
                  line(lapiz[0], lapiz[1], lapiz[2], lapiz[3]);
                  contador++;
                  popStyle();
                }

              //cambiar valores sobre la tabla
              nivel.setInt(i+2, opuesto, 3);
              nivel.setInt(opuesto+2, i, 3);
              opuesto=i;

              click++;
              break;
            case 3:
              println("perdio papu");
              perder=1;
              break;
            }
          }
        // println(lapiz[2], lapiz[3]);
        break;   


      case 2:
        lapiz[0]=lapiz[2];
        lapiz[1]=lapiz[3];
        click--;
        break;
      }
  }
  //GANAR-PERDER

  void comparar() {

    println(num_rayas, "  Vs  ", contador);
    if (contador==num_rayas) {
      fondos[6].display(6);
    }

    if (perder==1) {
      fondos[5].display(5);
    }
  }
  //CREADOR
  void crear() {
  }
}
