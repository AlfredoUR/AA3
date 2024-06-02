// Controles

void escenaControles() {
  strokeWeight(2.5);
  stroke(125);
  stroke(225);
  line(2.5, 2.5, 400.0, 2.5);
  line(400.0, 2.5, 400.0, height - 50.0);
  line(2.5, height - 50.0, 2.5, 2.5);
  String textUno = "Mantén pulsado '+' para aumentar la fuerza de fricción de las distintas entidades.";
  fill(200);
  textSize(22.5);
  text(textUno, 35, 35, 330, height - 85);
  String textDos = "Mantén pulsado '-' para disminuir la fuerza de fricción de las distintas entidades.";
  text(textDos, 35, 150 + 35, 330, height - 85);
  String textTres = "Para cambiar el destino general de las entidades, mantén pulsado '1' (acercar) o '2' (alejar).";
  text(textTres, 35, 300 + 35, 330, height - 85);
}