// Controles

void escenaControles() {

  pushMatrix();
  translate(127.75, 74.0, 125); // Posición de la pantalla de controles
  strokeWeight(2.5);
  stroke(125);
  stroke(225);
  line(2.5, 2.5, 400.0, 2.5);
  line(400.0, 2.5, 400.0, height - 189.0);
  line(2.5, height - 189.0, 2.5, 2.5);
  String textUno = "Mantén pulsado '+' para aumentar la fuerza de fricción de las distintas entidades.";
  fill(200);
  textSize(22.5);
  text(textUno, 35, 35, 330, height - 85);
  String textDos = "Mantén pulsado '-' para disminuir la fuerza de fricción de las distintas entidades.";
  text(textDos, 35, 150 + 35, 330, height - 85);
  String textTres = "Para cambiar el destino general de las entidades, pulsa '1' (+X), '2' (+Y), '3' (+Z), '4' (-X), '5' (-Y) o '6' (-Z).";
  text(textTres, 35, 300 + 35, 330, height - 85);
  String textCuatro = "Manten '0' para la vista isométrica.";
  text(textCuatro, 35, 490 + 35, 330, height - 85);
  String textCinco = "Manten '9' para la vista ortográfica superior.";
  text(textCinco, 35, 600 + 35, 330, height - 85);
  popMatrix();
}
