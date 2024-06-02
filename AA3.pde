// Alfredo Ugarte y Pol Blesa
// AA3 --> Banco de peces

enum EstadoPantalla {
  PANTALLA, CONTROLES
}

EstadoPantalla estadoActual = EstadoPantalla.PANTALLA;

// Variables
//PImage arena;
//PShape suelo;

float incremento_tiempo = 0.065;

PVector destinoPeces;
peces pezLider;
peces[] pez = new peces[45];


PVector objetivoTiburones;
tiburon tiburonLider;
tiburon tiburon1;
tiburon tiburon2;


// Setup
void setup() {
  // Tamaño de la pantalla --> Pantalla completa
  fullScreen(P3D);
  // Quitamos el cursor
  noCursor();

  // Pantalla del menu principal
  estadoActual = EstadoPantalla.PANTALLA;


  destinoPeces = new PVector (width / 2.0, height / 2.0, -500.0);

  pezLider = new peces(true, new PVector(random(3 * width / 4.0, width), random(3 * height / 4.0, height), random(100.0, -100.0)), new PVector(0.0, 0.0, 0.0), 1.0, 10.0, 1.0, 0.0, 0.08, color(#ffc340));

  for (int counter = 0; counter < pez.length; counter ++) {
    pez[counter] = new peces(false, new PVector(random(3 * width / 4.0, width), random(3 * height / 4.0, height), random(100.0, -100.0)), new PVector(0.0, 0.0, 0.0), 1.0, 10.0, random(0.0, 0.4), random(0.5, 1.0), random(0.01, 0.1), color(#ffc340));
  }

  objetivoTiburones = new PVector (pezLider.posicion_pez.x, pezLider.posicion_pez.y, pezLider.posicion_pez.z);

  tiburonLider = new tiburon(true, new PVector(random(width, width + 100.0), random(0.0, height), random(50.0, -50.0)), new PVector(0.0, 0.0, 0.0), 6.0, 20.0, 1.0, 0.0, 0.02, color(#a7a7a7));
  tiburon1 = new tiburon(false, new PVector(random(0.0, width), random(0.0, -100.0), random(50.0, -50.0)), new PVector(0.0, 0.0, 0.0), 6.0, 20.0, 0.8, 0.2, 0.02, color(#a7a7a7));
  tiburon2 = new tiburon(false, new PVector(random(0.0, -100.0), random(0.0, height), random(50.0, -50.0)), new PVector(0.0, 0.0, 0.0), 6.0, 20.0, 0.9, 0.1, 0.03, color(#a7a7a7));
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


  pezLider.calcular_pez();
  pezLider.pinta_peces();


  for (peces pez : pez) {
    pez.calcular_pez();
    pez.pinta_peces();
  }


  tiburonLider.calcula_tiburon();
  tiburon1.calcula_tiburon();
  tiburon2.calcula_tiburon();

  tiburonLider.pinta_tiburones();
  tiburon1.pinta_tiburones();
  tiburon2.pinta_tiburones();

  switch(estadoActual) {
  case PANTALLA:
    break;
  case CONTROLES:
    escenaControles();
    break;
  }
}

// Eventos
void keyPressed() {
  switch (keyCode) {
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
  case TAB:
    estadoActual = EstadoPantalla.CONTROLES;
  }
}

void keyReleased() {
  if (key == '1' || key == '2') {
    destinoPeces.x += 0.0;
    destinoPeces.y += 0.0;
    destinoPeces.z += 0.0;
  }
  if (keyCode == TAB) {
    estadoActual = EstadoPantalla.PANTALLA;
  }
}
