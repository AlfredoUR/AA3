// Escena en ortográfica superior

void escenaSuperior() {
  rotateX(radians(90));
  translate(0.0, -850.0, -175.0);


  pushMatrix();
  // Posicionamiento de los ejes
  translate(destinoPeces.x, destinoPeces.y, destinoPeces.z);

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
