// Alfredo Ugarte y Pol Blesa
// AA3 --> Banco de peces y tres tiburones que los persiguen

// Dos escenas:
// PANTALLA --> escena principal
// CONTROLES --> se abre manteniendo pulsado "TAB", para ver los distintos usos de los controles
enum EstadoPantalla {
  PANTALLA, CONTROLES
}

// Estado de la pantalla
EstadoPantalla estadoActual = EstadoPantalla.PANTALLA;

// Variables
float incremento_tiempo = 0.1; // Incremento del tiempo

// Peces
PVector destinoPeces; // Destino de los peces
peces pezLider; // Pez Líder (color amarillo)
peces[] pezRojo = new peces[14]; // Array de peces (color rojo)
peces[] pezAzul = new peces[14]; // Array de peces (color azul)
peces[] pezVerde = new peces[7]; // Array de peces (color verde)
peces[] pezNemo = new peces[7]; // Array de peces (color naranja)

// Tiburones
PVector objetivoTiburones; // Destino y/o Objetivo de los tiburones
tiburon tiburonLider; // Tiburón Líder (color gris)
tiburon tiburon1; // Tiburón Uno (color gris)
tiburon tiburon2; // Tiburón Dos (color gris)

// Obstáculos
obstaculos obstaculo1;
obstaculos obstaculo2;
obstaculos obstaculo3;
obstaculos obstaculo4;

// Setup
void setup() {
  // Tamaño de la pantalla --> Pantalla completa
  fullScreen(P3D);
  // Quitamos el cursor
  noCursor();

  // Pantalla del menu principal
  estadoActual = EstadoPantalla.PANTALLA;


  // Obstáculos
  obstaculo1 = new obstaculos(new PVector(-10.0, -10.0, -10.0), new PVector(width / 5.0, 200.0, 0.0), 150.0, 150.0, 150.0, color(0));


  // Peces
  destinoPeces = new PVector (width / 2.0, height / 2.0, -500.0);

  pezLider = new peces(true, new PVector(width / 2.0, height / 1.25, 0.0), new PVector(0.0, 0.0, 0.0), 1.0, 10.0, 3.0, 1.0, 0.0, 0.08, color(#ffc340));

  for (int counter = 0; counter < pezRojo.length; counter ++) {
    pezRojo[counter] = new peces(false, new PVector(random(0.0, width), random(3 * height / 4.0, height), random(100.0, -100.0)), new PVector(0.0, 0.0, 0.0), 1.0, 10.0, 3.0, random(0.0, 0.7), random(0.4, 1.0), random(0.01, 0.1), color(#c20000));
  }
  for (int counter = 0; counter < pezAzul.length; counter ++) {
    pezAzul[counter] = new peces(false, new PVector(random(0.0, width), random(3 * height / 4.0, height), random(100.0, -100.0)), new PVector(0.0, 0.0, 0.0), 1.0, 10.0, 3.0, random(0.0, 0.7), random(0.4, 1.0), random(0.01, 0.1), color(#8fe3ff));
  }
  for (int counter = 0; counter < pezVerde.length; counter ++) {
    pezVerde[counter] = new peces(false, new PVector(random(0.0, width), random(3 * height / 4.0, height), random(100.0, -100.0)), new PVector(0.0, 0.0, 0.0), 1.0, 10.0, 3.0, random(0.0, 0.7), random(0.4, 1.0), random(0.01, 0.1), color(#92e27a));
  }
  for (int counter = 0; counter < pezNemo.length; counter ++) {
    pezNemo[counter] = new peces(false, new PVector(random(0.0, width), random(3 * height / 4.0, height), random(100.0, -100.0)), new PVector(0.0, 0.0, 0.0), 1.0, 10.0, 3.0, random(0.0, 0.7), random(0.4, 1.0), random(0.01, 0.1), color(#ffa500));
  }


  // Tiburones
  objetivoTiburones = new PVector (pezLider.posicion_pez.x, pezLider.posicion_pez.y, pezLider.posicion_pez.z);

  tiburonLider = new tiburon(true, new PVector(random(width, width + 100.0), random(0.0, height), random(50.0, -50.0)), new PVector(0.0, 0.0, 0.0), 5.0, 20.0, 1.0, 0.0, 0.02, color(#a7a7a7));
  tiburon1 = new tiburon(false, new PVector(random(0.0, width), random(0.0, -100.0), random(50.0, -50.0)), new PVector(0.0, 0.0, 0.0), 5.0, 20.0, 0.8, 0.2, 0.02, color(#a7a7a7));
  tiburon2 = new tiburon(false, new PVector(random(0.0, -100.0), random(0.0, height), random(50.0, -50.0)), new PVector(0.0, 0.0, 0.0), 5.0, 20.0, 0.9, 0.1, 0.03, color(#a7a7a7));
}

// Draw
void draw() {
  // Color azul marino para el fondo
  background(#2d2c55);

  // Caja de texto informativo
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

  // Calcular y pintar el pez líder
  pezLider.calcular_pez();
  pezLider.pinta_peces();

  // Calcular y pintar los demás peces
  for (peces pez : pezRojo) {
    pez.calcular_pez();
    pez.pinta_peces();
  }
  for (peces pez : pezAzul) {
    pez.calcular_pez();
    pez.pinta_peces();
  }
  for (peces pez : pezVerde) {
    pez.calcular_pez();
    pez.pinta_peces();
  }
  for (peces pez : pezNemo) {
    pez.calcular_pez();
    pez.pinta_peces();
  }

  // Calcular los tiburones
  tiburonLider.calcula_tiburon();
  tiburon1.calcula_tiburon();
  tiburon2.calcula_tiburon();

  // Pintar los tiburones
  tiburonLider.pinta_tiburones();
  tiburon1.pinta_tiburones();
  tiburon2.pinta_tiburones();

  //Pintar los obstáculos
  obstaculo1.pinta_obstaculo();

  // Estado de la pantalla
  switch(estadoActual) {
  case PANTALLA:
    break;
  case CONTROLES:
    escenaControles();
    break;
  }
}

// Eventos
// Mantener pulsado los botones para hacer una acción
void keyPressed() {
  switch (keyCode) {
  case '1': // Amplía +150 la coordenada X del destino
    destinoPeces.x += 150.0;
    break;
  case '2': // Amplía +150 la coordenada Y del destino
    destinoPeces.y += 150.0;
    break;
  case '3': // Amplía +150 la coordenada Z del destino
    destinoPeces.z += 150.0;
    break;
  case '4': // Disminuye -150 la coordenada X del destino
    destinoPeces.x -= 150.0;
    break;
  case '5': // Disminuye -150 la coordenada Y del destino
    destinoPeces.y -= 150.0;
    break;
  case '6': // Disminuye -150 la coordenada Z del destino
    destinoPeces.z -= 150.0;
    break;
  case TAB: // Mantener para ver los controles
    estadoActual = EstadoPantalla.CONTROLES;
  }
}

// Dejar de mantener pulsado los botones para dejar de hacer una acción
void keyReleased() { 
  // Dejar de mantener para las acciones de ampliación y disminución de las coordenadas del destino
  if (key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6') {
    destinoPeces.x += 0.0;
    destinoPeces.y += 0.0;
    destinoPeces.z += 0.0;
  }
  // Dejar de mantener para la visualización de los controles
  if (keyCode == TAB) {
    estadoActual = EstadoPantalla.PANTALLA;
  }
}
