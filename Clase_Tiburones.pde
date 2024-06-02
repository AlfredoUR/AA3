// Clase de los tiburones para la caza de los peces

class tiburon {
  // Atributos
  PVector posicion_tiburon;
  PVector velocidad_tiburon;
  PVector aceleracion_tiburon;

  color color_tiburon;

  float masa_tiburon;
  float tamanyo_tiburon;

  boolean lider;

  float constante_objetivo;
  float constante_lider;
  float constante_friccion;

  // Constructor
  tiburon(boolean leader, PVector posicion, PVector velocidad, float masa, float tamanyo, float const_objetivo, float const_leader, float const_friccion, color c) {
    posicion_tiburon = new PVector (0.0, 0.0, 0.0);
    velocidad_tiburon = new PVector (0.0, 0.0, 0.0);
    aceleracion_tiburon = new PVector (0.0, 0.0, 0.0);

    posicion_tiburon.set(posicion);
    velocidad_tiburon.set(velocidad);

    color_tiburon = c;

    masa_tiburon = masa;
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
