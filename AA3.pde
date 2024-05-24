// Alfredo Ugarte y Pol Blesa
// AA3 --> Banco de peces

// Variables
float incremento_tiempo = 0.05;
PVector destino;
peces pezLider;
peces pez1;
peces pez2;

// Setup
void setup() {
  // Tamaño de la pantalla --> Pantalla completa
  fullScreen(P3D);
  // Quitamos el cursor
  noCursor();

  destino = new PVector (width / 2.0, height / 2.0, 50.0);

  pezLider = new peces(true, new PVector(width/2.0, height, 0.0), new PVector(0.0, 0.0, 0.0), 1.0, 25.0, 0.9, 0.0, 0.08, color(255, 0, 0));
  pez1 = new peces(false, new PVector(width/2.0, height, 0.0), new PVector(0.0, 0.0, 0.0), 1.0, 15.0, 0.2, 0.8, 0.02, color(0, 255, 0));
  pez2 = new peces(false, new PVector(width/2.0, height, 0.0), new PVector(0.0, 0.0, 0.0), 1.0, 15.0, 0.8, 0.1, 0.02, color(0, 0, 255));
}

// Draw
void draw() {
  // Color azul marino para el fondo
  background(#2d2c55);

  pezLider.calcular_pez();
  pez1.calcular_pez();
  pez2.calcular_pez();

  pezLider.pinta_peces();
  pez1.pinta_peces();
  pez2.pinta_peces();
}
