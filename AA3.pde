// Alfredo Ugarte y Pol Blesa
// AA3 --> Banco de peces y tres tiburones que los persiguen

// IMPORT'S
import camera3D.Camera3D; // Importamos la librería Camera 3D

// ZONA OBJETOS Y VARIABLES
Camera3D estereoscopia; // Objeto de Camera 3D para el efecto estereo
boolean tresD;

// Cuatro escenas:
// PANTALLA --> escena principal
// CONTROLES --> se abre manteniendo pulsado "TAB", para ver los distintos usos de los controles
// ISOMETRICA --> vista isométrica
// SUPERIOR --> vista ortográfica superior
enum EstadoPantalla {
  PANTALLA, CONTROLES, ISOMETRICA, SUPERIOR
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
PVector objetivoTiburones; // Destino y objetivo de los tiburones
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

  // Funcions per a activar estereoscopía
  tresD = false;
  if (tresD == true) {
    estereoscopia = new Camera3D(this); // Cridar al constructor
    estereoscopia.setBackgroundColor(color(255)); // Color de fons farem blanc
    estereoscopia.renderDefaultAnaglyph().setDivergence(1); // Valor per defecte
  }

  // Pantalla del menu principal
  estadoActual = EstadoPantalla.PANTALLA;

  // Obstáculos
  obstaculo1 = new obstaculos(new PVector(-100.0, -100.0, -100.0), new PVector(random(150.0, width - 150), random(150.0, height / 1.75), random(0.0, -750.0)), 100.0, 100.0, 100.0, color(0));
  obstaculo2 = new obstaculos(new PVector(100.0, 100.0, 100.0), new PVector(random(150.0, width - 150), random(150.0, height / 1.75), random(0.0, -750.0)), 100.0, 100.0, 100.0, color(0));
  obstaculo3 = new obstaculos(new PVector(-100.0, 100.0, 100.0), new PVector(random(150.0, width - 150), random(150.0, height / 1.75), random(0.0, -750.0)), 100.0, 100.0, 100.0, color(0));
  obstaculo4 = new obstaculos(new PVector(100.0, -100.0, -100.0), new PVector(random(150.0, width - 150), random(150.0, height / 1.75), random(0.0, -750.0)), 100.0, 100.0, 100.0, color(0));


  // Peces
  destinoPeces = new PVector (width / 2.0, height / 2.0, -500.0);

  pezLider = new peces(true, new PVector(width / 2.0, height / 1.25, 0.0), new PVector(0.0, 0.0, 0.0), 1.0, 10.0, 3.0, 1.0, 0.0, 0.08, color(#ffc340));

  for (int counter = 0; counter < pezRojo.length; counter ++) {
    pezRojo[counter] = new peces(false, new PVector(random(0.0, width), random(3 * height / 4.0, height), random(-1000.0, 250.0)), new PVector(0.0, 0.0, 0.0), 1.0, 10.0, 3.0, random(0.0, 0.7), random(0.4, 1.0), random(0.01, 0.1), color(#c20000));
  }
  for (int counter = 0; counter < pezAzul.length; counter ++) {
    pezAzul[counter] = new peces(false, new PVector(random(0.0, width), random(3 * height / 4.0, height), random(-1000.0, 250.0)), new PVector(0.0, 0.0, 0.0), 1.0, 10.0, 3.0, random(0.0, 0.7), random(0.4, 1.0), random(0.01, 0.1), color(#8fe3ff));
  }
  for (int counter = 0; counter < pezVerde.length; counter ++) {
    pezVerde[counter] = new peces(false, new PVector(random(0.0, width), random(3 * height / 4.0, height), random(-1000.0, 250.0)), new PVector(0.0, 0.0, 0.0), 1.0, 10.0, 3.0, random(0.0, 0.7), random(0.4, 1.0), random(0.01, 0.1), color(#92e27a));
  }
  for (int counter = 0; counter < pezNemo.length; counter ++) {
    pezNemo[counter] = new peces(false, new PVector(random(0.0, width), random(3 * height / 4.0, height), random(-1000.0, 250.0)), new PVector(0.0, 0.0, 0.0), 1.0, 10.0, 3.0, random(0.0, 0.7), random(0.4, 1.0), random(0.01, 0.1), color(#ffa500));
  }


  // Tiburones
  objetivoTiburones = new PVector (pezLider.posicion_pez.x, pezLider.posicion_pez.y, pezLider.posicion_pez.z);

  tiburonLider = new tiburon(true, new PVector(random(width, width + 200.0), random(0.0, height), random(-500.0, 50.0)), new PVector(0.0, 0.0, 0.0), 5.0, 20.0, 1.0, 0.0, 0.02, color(#554b4b));
  tiburon1 = new tiburon(false, new PVector(random(0.0, width), random(0.0, -200.0), random(-500.0, 50.0)), new PVector(0.0, 0.0, 0.0), 5.0, 20.0, 0.8, 0.2, 0.02, color(#554b4b));
  tiburon2 = new tiburon(false, new PVector(random(0.0, -200.0), random(0.0, height), random(-500.0, 50.0)), new PVector(0.0, 0.0, 0.0), 5.0, 20.0, 0.9, 0.1, 0.03, color(#554b4b));
}

// Draw
void draw() {

  // Color azul marino para el fondo
  background(#2d2c55);

  // Fondo del mar
  pushMatrix();
  translate(width / 2.0, 9000.0, -1000.0);
  fill(255, 225, 225);
  noStroke();
  sphereDetail(100);
  lights();
  sphere(7500);
  popMatrix();

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

  // Estado de la pantalla
  switch(estadoActual) {
  case PANTALLA:
    break;
  case CONTROLES:
    escenaControles();
    break;
  case ISOMETRICA:
    escenaIsometrica();
    break;
  case SUPERIOR:
    escenaSuperior();
    break;
  }

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
  obstaculo2.pinta_obstaculo();
  obstaculo3.pinta_obstaculo();
  obstaculo4.pinta_obstaculo();


  pushMatrix();
  translate(destinoPeces.x, destinoPeces.y, destinoPeces.z);
  fill(255);
  strokeWeight(0.5);
  stroke(0);
  box(10);
  popMatrix();
}

// Eventos
// Mantener pulsado los botones para hacer una acción
void keyPressed() {
  switch (keyCode) {
  case '1': // Amplía +150 la coordenada X del destino
    destinoPeces.x += 100.0;
    break;
  case '2': // Amplía +150 la coordenada Y del destino
    destinoPeces.y += 100.0;
    break;
  case '3': // Amplía +150 la coordenada Z del destino
    destinoPeces.z += 100.0;
    break;
  case '4': // Disminuye -150 la coordenada X del destino
    destinoPeces.x -= 100.0;
    break;
  case '5': // Disminuye -150 la coordenada Y del destino
    destinoPeces.y -= 100.0;
    break;
  case '6': // Disminuye -150 la coordenada Z del destino
    destinoPeces.z -= 100.0;
    break;
  case '8':
    tresD = true;
    break;
  case '0':
    estadoActual = EstadoPantalla.ISOMETRICA;
    break;
  case '9':
    estadoActual = EstadoPantalla.SUPERIOR;
    break;
  case '+':
    pezLider.constante_friccion++;

    for (int counter = 0; counter < pezRojo.length; counter ++) {
      pezRojo[counter].constante_friccion++;
    }
    for (int counter = 0; counter < pezAzul.length; counter ++) {
      pezAzul[counter].constante_friccion++;
    }
    for (int counter = 0; counter < pezVerde.length; counter ++) {
      pezVerde[counter].constante_friccion++;
    }
    for (int counter = 0; counter < pezNemo.length; counter ++) {
      pezNemo[counter].constante_friccion++;
    }

    tiburonLider.constante_friccion++;
    tiburon1.constante_friccion++;
    tiburon2.constante_friccion++;
    break;
  case '-':
    pezLider.constante_friccion--;

    for (int counter = 0; counter < pezRojo.length; counter ++) {
      pezRojo[counter].constante_friccion--;
    }
    for (int counter = 0; counter < pezAzul.length; counter ++) {
      pezAzul[counter].constante_friccion--;
    }
    for (int counter = 0; counter < pezVerde.length; counter ++) {
      pezVerde[counter].constante_friccion--;
    }
    for (int counter = 0; counter < pezNemo.length; counter ++) {
      pezNemo[counter].constante_friccion--;
    }

    tiburonLider.constante_friccion--;
    tiburon1.constante_friccion--;
    tiburon2.constante_friccion--;
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
  if (keyCode == '+' || keyCode == '-') {
    pezLider.constante_friccion += 0;

    for (int counter = 0; counter < pezRojo.length; counter ++) {
      pezRojo[counter].constante_friccion += 0;
    }
    for (int counter = 0; counter < pezAzul.length; counter ++) {
      pezAzul[counter].constante_friccion += 0;
    }
    for (int counter = 0; counter < pezVerde.length; counter ++) {
      pezVerde[counter].constante_friccion += 0;
    }
    for (int counter = 0; counter < pezNemo.length; counter ++) {
      pezNemo[counter].constante_friccion += 0;
    }

    tiburonLider.constante_friccion += 0;
    tiburon1.constante_friccion += 0;
    tiburon2.constante_friccion += 0;
  }
  if (keyCode == '8') {
    tresD = false;
  }

  // Dejar de mantener para la visualización de los controles
  if (keyCode == TAB || keyCode == '0' || keyCode == '9') {
    estadoActual = EstadoPantalla.PANTALLA;
  }
}
