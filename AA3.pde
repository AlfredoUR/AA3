// Alfredo Ugarte y Pol Blesa
// AA3 --> Banco de peces

enum EstadoPantalla {
  PANTALLA, CONTROLES
}

EstadoPantalla estadoActual = EstadoPantalla.PANTALLA;

// Variables
PImage arena;
PShape suelo;

float incremento_tiempo = 0.04;

PVector destinoPeces;
peces pezLider;
peces pez1;
peces pez2;
peces pez3;
peces pez4;
peces pez5;
peces pez6;

// Setup
void setup() {
  // Tamaño de la pantalla --> Pantalla completa
  fullScreen(P3D);
  // Quitamos el cursor
  noCursor();

  // Pantalla del menu principal
  estadoActual = EstadoPantalla.PANTALLA;

  destinoPeces = new PVector (width / 2.0, height / 2.0, -500.0);

  pezLider = new peces(true, new PVector(random(3 * width / 4.0, width), random(3 * height / 4.0, height), random(100.0, -100.0)), new PVector(0.0, 0.0, 0.0), 1.0, 10.0, 1.0, 0.0, 0.08, color(255, 0, 0));
  pez1 = new peces(false, new PVector(random(3 * width / 4.0, width), random(3 * height / 4.0, height), random(100.0, -100.0)), new PVector(0.0, 0.0, 0.0), 1.0, 10.0, 0.4, 0.6, 0.09, color(255, 0, 0));
  pez2 = new peces(false, new PVector(random(3 * width / 4.0, width), random(3 * height / 4.0, height), random(100.0, -100.0)), new PVector(0.0, 0.0, 0.0), 1.0, 10.0, 0.2, 0.8, 0.02, color(255, 0, 0));
  pez3 = new peces(false, new PVector(random(3 * width / 4.0, width), random(3 * height / 4.0, height), random(100.0, -100.0)), new PVector(0.0, 0.0, 0.0), 1.0, 10.0, 0.7, 0.3, 0.06, color(255, 0, 0));
  pez4 = new peces(false, new PVector(random(3 * width / 4.0, width), random(3 * height / 4.0, height), random(100.0, -100.0)), new PVector(0.0, 0.0, 0.0), 1.0, 10.0, 0.4, 0.6, 0.05, color(255, 0, 0));
  pez5 = new peces(false, new PVector(random(3 * width / 4.0, width), random(3 * height / 4.0, height), random(100.0, -100.0)), new PVector(0.0, 0.0, 0.0), 1.0, 10.0, 0.9, 0.1, 0.08, color(255, 0, 0));
  pez6 = new peces(false, new PVector(random(3 * width / 4.0, width), random(3 * height / 4.0, height), random(100.0, -100.0)), new PVector(0.0, 0.0, 0.0), 1.0, 10.0, 0.3, 0.7, 0.04, color(255, 0, 0));
}

// Draw
void draw() {
  // Color azul marino para el fondo
  background(#2d2c55);

  pushMatrix();
  stroke(225);
  strokeWeight(2.5);
  line(2.5, height - 50.0, width - 2.5, height - 50.0);
  line(2.5, height - 2.5, width - 2.5, height - 2.5);
  line(2.5, height - 50.0, 2.5, height - 2.5);
  line(width - 2.5, height - 50.0, width - 2.5, height - 2.5);
  String text = "Mantén pulsado 'TAB' para poder visualizar la pantalla de los controles.";
  fill(200);
  textSize(20);
  textAlign(CENTER);
  text(text, 0.0, height - 40.0, width, height - 40.0);
  popMatrix();

  switch(estadoActual) {
  case PANTALLA:
    break;
  case CONTROLES:
    escenaControles();
    break;
  }

  pezLider.calcular_pez();
  pez1.calcular_pez();
  pez2.calcular_pez();
  pez3.calcular_pez();
  pez4.calcular_pez();
  pez5.calcular_pez();
  pez6.calcular_pez();

  pezLider.pinta_peces();
  pez1.pinta_peces();
  pez2.pinta_peces();
  pez3.pinta_peces();
  pez4.pinta_peces();
  pez5.pinta_peces();
  pez6.pinta_peces();
}

// Eventos
void keyPressed() {
  switch (keyCode) {
  case TAB:
    estadoActual = EstadoPantalla.CONTROLES;
  case '1':
    destinoPeces.x += 100.0;
    destinoPeces.y += 100.0;
    destinoPeces.z += 100.0;
    break;
  case '2':
    destinoPeces.x -= 100.0;
    destinoPeces.y -= 100.0;
    destinoPeces.z -= 100.0;
    break;
  }
}

void keyReleased() {
  if (keyCode == TAB) {
    estadoActual = EstadoPantalla.PANTALLA;
  }
  if (key == '1' || key == '2') {
    destinoPeces.x += 0.0;
    destinoPeces.y += 0.0;
    destinoPeces.z += 0.0;
  }
}
