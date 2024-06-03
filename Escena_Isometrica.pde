// Escena en isométrica

void escenaIsometrica() {
  rotateX(radians(335));
  rotateY(radians(320));
  translate(-215.0, 125.0, -500);


  pushMatrix();
  // Posicionamiento de los ejes
  translate(width / 2.0, height / 2.0, 0.0);

  // Grueso ejes
  strokeWeight(1.0);
  // Eje X
  stroke(255, 0, 0);
  line(0.0, 0.0, 0.0, 200.0, 0.0, 0.0);
  // Eje Y
  stroke(0, 255, 0);
  line(0.0, 0.0, 0.0, 0.0, 200.0, 0.0);
  // Eje Z
  stroke(0, 0, 255);
  line(0.0, 0.0, 0.0, 0.0, 0.0, 200.0);
  popMatrix();
}
