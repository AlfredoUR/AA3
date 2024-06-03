// Clase de los peces para el banco de peces

class peces {

  // Atributos
  // Vectores:
  PVector posicion_pez; // Posición de los peces
  PVector velocidad_pez; // Velocidad de los peces
  PVector aceleracion_pez; // Aceleración de los peces

  color color_pez; // Color de los peces

  float masa_pez; // Masa de los peces
  float tamanyo_pez; // Tamaño de los peces

  boolean lider; // Booleano para saber si ese pez es el líder o no

  // Constantes
  float constante_huir; // Constante de huir de los tiburones (otra entidad)
  float constante_destino; // Constante del destino
  float constante_lider; // Constante del líder
  float constante_friccion; // Constante de fricción


  // Constructor
  peces(boolean leader, PVector posicion, PVector velocidad, float masa, float tamanyo, float const_huir, float const_destino, float const_leader, float const_friccion, color c) {
    posicion_pez = new PVector (0.0, 0.0, 0.0); // Posición de los peces
    velocidad_pez = new PVector (0.0, 0.0, 0.0); // Velocidad de los peces
    aceleracion_pez = new PVector (0.0, 0.0, 0.0); // Aceleración de los peces

    posicion_pez.set(posicion); // Posición
    velocidad_pez.set(velocidad); // Velocidad

    color_pez = c; // Color de los peces

    masa_pez = masa; // Masa de los peces
    tamanyo_pez = tamanyo; // Tamaño de los peces

    lider = leader; // Booleano para saber si ese pez es el líder o no

    constante_huir = const_huir; // Constante de huir de los tiburones (otra entidad)
    constante_destino = const_destino; // Constante del destino
    constante_lider = const_leader; // Constante del líder
    constante_friccion = const_friccion; // Constante de fricción
  }

  // Métodos
  // Función para calcular a los peces
  void calcular_pez() {
    PVector acumulador_fuerza; // Acumulador de fuerza
    PVector vector_usable; // Vector

    acumulador_fuerza = new PVector (0.0, 0.0, 0.0); // Inicialización del acumulador de fuerza
    vector_usable = new PVector (0.0, 0.0, 0.0); // Inicialización del vector


    // Dirección del pez hacia el destino (calculamos la fuerza)
    vector_usable.x = destinoPeces.x - posicion_pez.x;
    vector_usable.y = destinoPeces.y - posicion_pez.y;
    vector_usable.z = destinoPeces.z - posicion_pez.z;

    // Módulo del vector
    float modulo = sqrt(vector_usable.x * vector_usable.x + vector_usable.y * vector_usable.y + vector_usable.z * vector_usable.z);

    // Vector unitario
    vector_usable.x /= modulo;
    vector_usable.y /= modulo;
    vector_usable.z /= modulo;

    // Vector multipplicado por la constante del destino
    vector_usable.x *= constante_destino;
    vector_usable.y *= constante_destino;
    vector_usable.z *= constante_destino;

    // Igualamos el acumulador de fuerza con el vector
    acumulador_fuerza.x = vector_usable.x;
    acumulador_fuerza.y = vector_usable.y;
    acumulador_fuerza.z = vector_usable.z;

    // Peces que no son líder
    // Fuerza hacía el líder
    if (lider == false) {
      // Vector que va del pez al líder
      vector_usable.x = pezLider.posicion_pez.x - posicion_pez.x;
      vector_usable.y = pezLider.posicion_pez.y - posicion_pez.y;
      vector_usable.z = pezLider.posicion_pez.z - posicion_pez.z;

      // Módulo del vector
      modulo = sqrt(vector_usable.x * vector_usable.x + vector_usable.y * vector_usable.y + vector_usable.z * vector_usable.z);

      // Vector unitario
      vector_usable.x /= modulo;
      vector_usable.y /= modulo;
      vector_usable.z /= modulo;

      // Vector multiplicado por la constante de líder
      vector_usable.x *= constante_lider;
      vector_usable.y *= constante_lider;
      vector_usable.z *= constante_lider;

      // Igualamos el acumulador de fuerza con el vector
      acumulador_fuerza.x += vector_usable.x;
      acumulador_fuerza.y += vector_usable.y;
      acumulador_fuerza.z += vector_usable.z;
    }

    // Fuerza de los obstáculos
    // Valores máximos y mínimos de los obstáculos
    PVector min_obstaculo = new PVector(0.0, 0.0, 0.0);
    PVector max_obstaculo = new PVector(0.0, 0.0, 0.0);

    min_obstaculo.x = obstaculo1.posicion_obstaculo.x - 0.5 * obstaculo1.anchura_obstaculo;
    min_obstaculo.y = obstaculo1.posicion_obstaculo.y - 0.5 * obstaculo1.altura_obstaculo;
    min_obstaculo.z = obstaculo1.posicion_obstaculo.z - 0.5 * obstaculo1.profundidad_obstaculo;

    max_obstaculo.x = obstaculo1.posicion_obstaculo.x + 0.5 * obstaculo1.anchura_obstaculo;
    max_obstaculo.y = obstaculo1.posicion_obstaculo.y + 0.5 * obstaculo1.altura_obstaculo;
    max_obstaculo.z = obstaculo1.posicion_obstaculo.z + 0.5 * obstaculo1.profundidad_obstaculo;

    // Mirar si el pez está en el obstáculo
    if ((posicion_pez.x > min_obstaculo.x) && (posicion_pez.x < max_obstaculo.x)
      && (posicion_pez.y > min_obstaculo.y) && (posicion_pez.y < max_obstaculo.y)
      && (posicion_pez.z > min_obstaculo.z) && (posicion_pez.z < max_obstaculo.z)) {
      // Som dins del voxel
      acumulador_fuerza.x += obstaculo1.fuerza_obstaculo.x;
      acumulador_fuerza.y += obstaculo1.fuerza_obstaculo.y;
      acumulador_fuerza.z += obstaculo1.fuerza_obstaculo.z;
    }

    // Fuerza de fricción
    acumulador_fuerza.x += -1.0 * constante_friccion * velocidad_pez.x;
    acumulador_fuerza.y += -1.0 * constante_friccion * velocidad_pez.y;
    acumulador_fuerza.z += -1.0 * constante_friccion * velocidad_pez.z;

    // Aceleración de los peces
    aceleracion_pez.x = acumulador_fuerza.x / masa_pez;
    aceleracion_pez.y = acumulador_fuerza.y / masa_pez;
    aceleracion_pez.z = acumulador_fuerza.z / masa_pez;

    // Velocidad de los peces
    velocidad_pez.x = velocidad_pez.x + aceleracion_pez.x * incremento_tiempo;
    velocidad_pez.y = velocidad_pez.y + aceleracion_pez.y * incremento_tiempo;
    velocidad_pez.z = velocidad_pez.z + aceleracion_pez.z * incremento_tiempo;

    // Posición de los peces
    posicion_pez.x = posicion_pez.x + velocidad_pez.x * incremento_tiempo;
    posicion_pez.y = posicion_pez.y + velocidad_pez.y * incremento_tiempo;
    posicion_pez.z = posicion_pez.z + velocidad_pez.z * incremento_tiempo;

    // Fuerza para huir de los tiburones, si el pez está muy cerca de un tiburón, la velocidad del pez aumentará
    if ((tiburonLider.posicion_tiburon.x + 100 == this.posicion_pez.x && tiburonLider.posicion_tiburon.y + 100== this.posicion_pez.y && tiburonLider.posicion_tiburon.z + 100 == this.posicion_pez.z)
      || (tiburon1.posicion_tiburon.x + 100 == this.posicion_pez.x && tiburon1.posicion_tiburon.y + 100 == this.posicion_pez.y && tiburon1.posicion_tiburon.z + 100 == this.posicion_pez.z) ||
      (tiburon2.posicion_tiburon.x + 100 == this.posicion_pez.x && tiburon2.posicion_tiburon.y + 100 == this.posicion_pez.y && tiburon2.posicion_tiburon.z + 100 == this.posicion_pez.z) ||
      (tiburonLider.posicion_tiburon.x - 100 == this.posicion_pez.x && tiburonLider.posicion_tiburon.y - 100== this.posicion_pez.y && tiburonLider.posicion_tiburon.z - 100 == this.posicion_pez.z)
      || (tiburon1.posicion_tiburon.x - 100 == this.posicion_pez.x && tiburon1.posicion_tiburon.y - 100 == this.posicion_pez.y && tiburon1.posicion_tiburon.z - 100 == this.posicion_pez.z) ||
      (tiburon2.posicion_tiburon.x - 100 == this.posicion_pez.x && tiburon2.posicion_tiburon.y - 100 == this.posicion_pez.y && tiburon2.posicion_tiburon.z - 100 == this.posicion_pez.z)) {
      velocidad_pez.x += constante_huir * velocidad_pez.x;
      velocidad_pez.y += constante_huir * velocidad_pez.y;
      velocidad_pez.z += constante_huir * velocidad_pez.z;
    }
  }

  // Función para pintar los peces
  void pinta_peces() {
    pushMatrix();
    translate(this.posicion_pez.x, this.posicion_pez.y, this.posicion_pez.z); // Posición de los peces
    fill(color_pez); // Color de los peces
    sphereDetail(100);
    noStroke(); // Sin margen
    lights();
    sphere(tamanyo_pez); // Tamaño de los peces --> Representados como esferas de colores
    popMatrix();
  }
}
