// Clase de los peces para el banco de peces

class peces {

  // Atributos
  PVector posicion_pez;
  PVector velocidad_pez;
  PVector aceleracion_pez;

  color color_pez;

  float masa_pez;
  float tamanyo_pez;

  boolean lider;

  float constante_destino;
  float constante_lider;
  float constante_friccion;


  // Constructor
  peces(boolean leader, PVector posicion, PVector velocidad, float masa, float tamanyo, float const_destino, float const_leader, float const_friccion, color colour) {
    posicion_pez = new PVector (0.0, 0.0, 0.0);
    velocidad_pez = new PVector (0.0, 0.0, 0.0);
    aceleracion_pez = new PVector (0.0, 0.0, 0.0);

    posicion_pez.set(posicion);
    velocidad_pez.set(velocidad);

    color_pez = colour;

    masa_pez = masa;
    tamanyo_pez = tamanyo;

    constante_destino = const_destino;
    constante_lider = const_leader;
    constante_friccion = const_friccion;

    lider = leader;
  }

  // Métodos
  void calcular_pez() {
    PVector acumulador_fuerza;
    PVector vector_usable;

    acumulador_fuerza = new PVector (0.0, 0.0, 0.0);
    vector_usable = new PVector (0.0, 0.0, 0.0);


    vector_usable.x = destino.x - posicion_pez.x;
    vector_usable.y = destino.y - posicion_pez.y;
    vector_usable.z = destino.z - posicion_pez.z;

    float modulo = sqrt(vector_usable.x * vector_usable.x + vector_usable.y * vector_usable.y + vector_usable.z * vector_usable.z);

    vector_usable.x /= modulo;
    vector_usable.y /= modulo;
    vector_usable.z /= modulo;

    vector_usable.x *= constante_destino;
    vector_usable.y *= constante_destino;
    vector_usable.z *= constante_destino;

    acumulador_fuerza.x = vector_usable.x;
    acumulador_fuerza.y = vector_usable.y;
    acumulador_fuerza.z = vector_usable.z;

    if (lider == false) {
      vector_usable.x = pezLider.posicion_pez.x - posicion_pez.x;
      vector_usable.y = pezLider.posicion_pez.y - posicion_pez.y;
      vector_usable.z = pezLider.posicion_pez.z - posicion_pez.z;

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

    acumulador_fuerza.x += -1.0 * constante_friccion * velocidad_pez.x;
    acumulador_fuerza.y += -1.0 * constante_friccion * velocidad_pez.y;
    acumulador_fuerza.z += -1.0 * constante_friccion * velocidad_pez.z;

    aceleracion_pez.x = acumulador_fuerza.x / masa_pez;
    aceleracion_pez.y = acumulador_fuerza.y / masa_pez;
    aceleracion_pez.z = acumulador_fuerza.z / masa_pez;

    velocidad_pez.x = velocidad_pez.x + aceleracion_pez.x * incremento_tiempo;
    velocidad_pez.y = velocidad_pez.y + aceleracion_pez.y * incremento_tiempo;
    velocidad_pez.z = velocidad_pez.z + aceleracion_pez.z * incremento_tiempo;

    posicion_pez.x = posicion_pez.x + velocidad_pez.x * incremento_tiempo;
    posicion_pez.y = posicion_pez.y + velocidad_pez.y * incremento_tiempo;
    posicion_pez.z = posicion_pez.z + velocidad_pez.z * incremento_tiempo;
  }

  void pinta_peces() {
    translate(posicion_pez.x, posicion_pez.y, posicion_pez.z);
    fill(color_pez);
    sphereDetail(100);
    noStroke();
    lights();
    sphere(tamanyo_pez);
  }
}
