// Clase de obstáculos (voxels)

class obstaculos {

  // Atributos
  // Vectores:
  PVector fuerza_obstaculo; // Fuerza del obstáculo
  PVector posicion_obstaculo; // Posición del obstáculo

  // Dimensiones:
  float anchura_obstaculo; // Anchura del obstáculo (X)
  float altura_obstaculo; // Altura del obstáculo (Y)
  float profundidad_obstaculo; // Profundidad del obstáculo (Z)

  // Color:
  color color_obstaculo;

  // Constructor
  obstaculos(PVector fuerza, PVector pos, float anchura, float altura, float profundidad, color c) {
    // Fuerza del obstáculo
    fuerza_obstaculo = new PVector(0.0, 0.0, 0.0);
    fuerza_obstaculo = fuerza;

    // Posición del obstáculo
    posicion_obstaculo = new PVector(0.0, 0.0, 0.0);
    posicion_obstaculo = pos;

    anchura_obstaculo = anchura; // Anchura del obstáculo (X)
    altura_obstaculo = altura; // Altura del obstáculo (Y)
    profundidad_obstaculo = profundidad; // Profundidad del obstáculo (Z)

    color_obstaculo = c; // Color
  }
  // Métodos
  // Función para pintar los obstáculos
  void pinta_obstaculo() {
    pushMatrix();
    translate(this.posicion_obstaculo.x, this.posicion_obstaculo.y, this.posicion_obstaculo.z); // Posición
    noFill(); // Transparente
    strokeWeight(2.5); // Tamaño de los márgenes 
    stroke(color_obstaculo); // Color de los márgenes
    lights();
    box(anchura_obstaculo, altura_obstaculo, profundidad_obstaculo); // Tamaño del obstáculo
    popMatrix();
  }
}
