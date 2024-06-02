

class obstaculos {
  PVector fuerza_obstaculo;
  PVector posicion_obstaculo;

  float anchura_obstaculo;
  float altura_obstaculo;
  float profundidad_obstaculo;

  color color_obstaculo;

  obstaculos(PVector fuerza, PVector pos, float anchura, float altura, float profundidad, color c) {
    fuerza_obstaculo = new PVector(0.0, 0.0, 0.0);
    fuerza_obstaculo = fuerza;

    posicion_obstaculo = new PVector(0.0, 0.0, 0.0);
    posicion_obstaculo = pos;

    anchura_obstaculo = anchura;
    altura_obstaculo = altura;
    profundidad_obstaculo = profundidad;

    color_obstaculo = c;
  }
  void pinta_obstaculo() {
    pushMatrix();
    translate(this.posicion_obstaculo.x, this.posicion_obstaculo.y, this.posicion_obstaculo.z);
    fill(color_obstaculo);
    sphereDetail(100);
    noStroke();
    lights();
    box(anchura_obstaculo, altura_obstaculo, profundidad_obstaculo);
    popMatrix();
  }
}
