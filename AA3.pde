// Alfredo Ugarte y Pol Blesa
// AA3 --> Banco de peces

// Variables
float incremento_tiempo = 0.04;
PVector destino;
peces pezLider;
peces pez1;
peces pez2;
peces pez3;
peces pez4;

// Setup
void setup() {
  // Tamaño de la pantalla --> Pantalla completa
  fullScreen(P3D);
  // Quitamos el cursor
  noCursor();

  destino = new PVector (width / 2.0, height / 2.0, -500.0);

  pezLider = new peces(true, new PVector(random(3 * width / 4.0, width), random(3 * height / 4.0, height), random(100.0, -100.0)), new PVector(0.0, 0.0, 0.0), 1.0, 10.0, 1.0, 0.0, 0.08, color(255, 0, 0));
  pez1 = new peces(false, new PVector(random(3 * width / 4.0, width), random(3 * height / 4.0, height), random(100.0, -100.0)), new PVector(0.0, 0.0, 0.0), 1.0, 10.0, 0.4, 0.6, 0.09, color(255, 0, 0));
  pez2 = new peces(false, new PVector(random(3 * width / 4.0, width), random(3 * height / 4.0, height), random(100.0, -100.0)), new PVector(0.0, 0.0, 0.0), 1.0, 10.0, 0.2, 0.8, 0.02, color(255, 0, 0));
  pez3 = new peces(false, new PVector(random(3 * width / 4.0, width), random(3 * height / 4.0, height), random(100.0, -100.0)), new PVector(0.0, 0.0, 0.0), 1.0, 10.0, 0.7, 0.3, 0.06, color(255, 0, 0));
  pez4 = new peces(false, new PVector(random(3 * width / 4.0, width), random(3 * height / 4.0, height), random(100.0, -100.0)), new PVector(0.0, 0.0, 0.0), 1.0, 10.0, 0.4, 0.6, 0.05, color(255, 0, 0));
}

// Draw
void draw() {
  // Color azul marino para el fondo
  background(#2d2c55);

  pezLider.calcular_pez();
  pez1.calcular_pez();
  pez2.calcular_pez();
  pez3.calcular_pez();
  pez4.calcular_pez();

  pezLider.pinta_peces();
  pez1.pinta_peces();
  pez2.pinta_peces();
  pez3.pinta_peces();
  pez4.pinta_peces();
}
