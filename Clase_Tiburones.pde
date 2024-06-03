// Clase de los tiburones para la caza de los peces

class tiburon {

  // Atributos
  // Vectores
  PVector posicion_tiburon; // Posición de los tiburones
  PVector velocidad_tiburon; // Velocidad de los tiburones
  PVector aceleracion_tiburon; // Aceleración de los tiburones

  color color_tiburon; // Color de los tiburones

  float masa_tiburon; // Masa de los peces
  float tamanyo_tiburon; // Tamaño de los peces

  boolean lider; // Booleano para saber si ese tiburón es el líder o no

  // Constantes
  float constante_objetivo; // Constante del objetivo
  float constante_lider; // Constante del líder
  float constante_friccion; // Constante de fricción
  

  // Constructor
  tiburon(boolean leader, PVector posicion, PVector velocidad, float masa, float tamanyo, float const_objetivo, float const_leader, float const_friccion, color c) {
    posicion_tiburon = new PVector (0.0, 0.0, 0.0); // Posición de los tiburones
    velocidad_tiburon = new PVector (0.0, 0.0, 0.0); // Velocidad de los tiburones
    aceleracion_tiburon = new PVector (0.0, 0.0, 0.0); // Aceleración de los tiburones

    posicion_tiburon.set(posicion); // posición
    velocidad_tiburon.set(velocidad); // Velocidad

    color_tiburon = c; // Color de los tiburones

    masa_tiburon = masa; // Masa del tiburón
    tamanyo_tiburon = tamanyo;

    constante_objetivo = const_objetivo;
    constante_lider = const_leader;
    constante_friccion = const_friccion;

    lider = leader;
  }

  // Métodos
  void calcula_tiburon() {
    PVector acumulador_fuerza;
    PVector vector_usable;

    acumulador_fuerza = new PVector (0.0, 0.0, 0.0);
    vector_usable = new PVector (0.0, 0.0, 0.0);

    objetivoTiburones = new PVector (pezLider.posicion_pez.x, pezLider.posicion_pez.y, pezLider.posicion_pez.z);

    vector_usable.x = objetivoTiburones.x - posicion_tiburon.x;
    vector_usable.y = objetivoTiburones.y - posicion_tiburon.y;
    vector_usable.z = objetivoTiburones.z - posicion_tiburon.z;

    float modulo = sqrt(vector_usable.x * vector_usable.x + vector_usable.y * vector_usable.y + vector_usable.z * vector_usable.z);

    vector_usable.x /= modulo;
    vector_usable.y /= modulo;
    vector_usable.z /= modulo;

    vector_usable.x *= constante_objetivo;
    vector_usable.y *= constante_objetivo;
    vector_usable.z *= constante_objetivo;

    acumulador_fuerza.x = vector_usable.x;
    acumulador_fuerza.y = vector_usable.y;
    acumulador_fuerza.z = vector_usable.z;

    if (lider == false) {
      vector_usable.x = tiburonLider.posicion_tiburon.x - posicion_tiburon.x;
      vector_usable.y = tiburonLider.posicion_tiburon.y - posicion_tiburon.y;
      vector_usable.z = tiburonLider.posicion_tiburon.z - posicion_tiburon.z;

      modulo = sqrt(vector_usable.x * vector_usable.x + vector_usable.y * vector_usable.y + vector_usable.z * vector_usable.z);

      vector_usable.x /= modulo;
      vector_usable.y /= modulo;
      vector_usable.z /= modulo;

      vector_usable.x *= constante_lider;
      vector_usable.y *= constante_lider;
      vector_usable.z *= constante_lider;

      acumulador_fuerza.x += vector_usable.x;
      acumulador_fuerza.y += vector_usable.y;
      acumulador_fuerza.z += vector_usable.z;
    }
    // -------------------------------------------------------------------------------
    PVector min_obstaculo = new PVector(0.0, 0.0, 0.0);
    PVector max_obstaculo = new PVector(0.0, 0.0, 0.0);

    min_obstaculo.x = obstaculo1.posicion_obstaculo.x - 0.5 * obstaculo1.anchura_obstaculo;
    min_obstaculo.y = obstaculo1.posicion_obstaculo.y - 0.5 * obstaculo1.altura_obstaculo;
    min_obstaculo.z = obstaculo1.posicion_obstaculo.z - 0.5 * obstaculo1.profundidad_obstaculo;

    max_obstaculo.x = obstaculo1.posicion_obstaculo.x + 0.5 * obstaculo1.anchura_obstaculo;
    max_obstaculo.y = obstaculo1.posicion_obstaculo.y + 0.5 * obstaculo1.altura_obstaculo;
    max_obstaculo.z = obstaculo1.posicion_obstaculo.z + 0.5 * obstaculo1.profundidad_obstaculo;

    if ((posicion_tiburon.x > min_obstaculo.x) && (posicion_tiburon.x < max_obstaculo.x)
      && (posicion_tiburon.y > min_obstaculo.y) && (posicion_tiburon.y < max_obstaculo.y)
      && (posicion_tiburon.z > min_obstaculo.z) && (posicion_tiburon.z < max_obstaculo.z)) {
      // Som dins del voxel
      acumulador_fuerza.x += obstaculo1.fuerza_obstaculo.x;
      acumulador_fuerza.y += obstaculo1.fuerza_obstaculo.y;
      acumulador_fuerza.z += obstaculo1.fuerza_obstaculo.z;
    }

    // -------------------------------------------------------------------------------

    acumulador_fuerza.x += -1.0 * constante_friccion * velocidad_tiburon.x;
    acumulador_fuerza.y += -1.0 * constante_friccion * velocidad_tiburon.y;
    acumulador_fuerza.z += -1.0 * constante_friccion * velocidad_tiburon.z;

    aceleracion_tiburon.x = acumulador_fuerza.x / masa_tiburon;
    aceleracion_tiburon.y = acumulador_fuerza.y / masa_tiburon;
    aceleracion_tiburon.z = acumulador_fuerza.z / masa_tiburon;

    velocidad_tiburon.x = velocidad_tiburon.x + aceleracion_tiburon.x * incremento_tiempo;
    velocidad_tiburon.y = velocidad_tiburon.y + aceleracion_tiburon.y * incremento_tiempo;
    velocidad_tiburon.z = velocidad_tiburon.z + aceleracion_tiburon.z * incremento_tiempo;

    posicion_tiburon.x = posicion_tiburon.x + velocidad_tiburon.x * incremento_tiempo;
    posicion_tiburon.y = posicion_tiburon.y + velocidad_tiburon.y * incremento_tiempo;
    posicion_tiburon.z = posicion_tiburon.z + velocidad_tiburon.z * incremento_tiempo;
  }

  void pinta_tiburones() {
    pushMatrix();
    translate(this.posicion_tiburon.x, this.posicion_tiburon.y, this.posicion_tiburon.z);
    fill(color_tiburon);
    sphereDetail(100);
    noStroke();
    lights();
    sphere(tamanyo_tiburon);
    popMatrix();
  }
}
