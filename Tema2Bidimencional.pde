float x1 = 100; // Coordenada x inicial para el ejemplo 1 (rotación)
float y1 = 200; // Coordenada y inicial para el ejemplo 1 (rotación)
float angle1 = 0; // Ángulo inicial para el ejemplo 1 (rotación)

float x2 = 300; // Coordenada x inicial para el ejemplo 2 (rebote)
float y2 = 200; // Coordenada y inicial para el ejemplo 2 (rebote)
float velocidadX2 = 3; // Velocidad en la dirección x para el ejemplo 2 (rebote)
float velocidadY2 = 2; // Velocidad en la dirección y para el ejemplo 2 (rebote)

float x3 = 200; // Coordenada x inicial para el ejemplo 3 (cambio de tamaño aleatorio)
float y3 = 300; // Coordenada y inicial para el ejemplo 3 (cambio de tamaño aleatorio)
float lado3 = 50; // Tamaño inicial del cuadrado para el ejemplo 3 (cambio de tamaño aleatorio)

float x4 = 300; // Coordenada x inicial para el ejemplo 4 (sesgo)
float y4 = 100; // Coordenada y inicial para el ejemplo 4 (sesgo)
float ladoX4 = 60; // Tamaño inicial del cuadrado en el eje X para el ejemplo 4 (sesgo)
float ladoY4 = 40; // Tamaño inicial del cuadrado en el eje Y para el ejemplo 4 (sesgo)
float sesgoX4 = 1.02; // Sesgo en el tamaño en el eje X para el ejemplo 4 (sesgo)
float sesgoY4 = 0.98; // Sesgo en el tamaño en el eje Y para el ejemplo 4 (sesgo)

boolean rotacionActiva = false; // Variable para controlar el modo de rotación
boolean reboteActivo = false; // Variable para controlar el modo de rebote
boolean cambioTamanioAleatorioActivo = false; // Variable para controlar el modo de cambio de tamaño aleatorio
boolean sesgoActivo = false; // Variable para controlar el modo de sesgo

float lado = 100; // Lado del cuadrado
float intensidad = 0;
boolean aumentar = true;

void setup() {
  size(400, 400);
}

void draw() {
  float rojo = random(0, 255);
  float verde = random(0, 255);
  float azul = random(0, 255);
  background(intensidad, 255, 255);
  stroke(intensidad, 0,0);
  fill(rojo, verde, azul);

  if (intensidad == 255){
    aumentar = false;
  }else if (intensidad == 0 ){
    aumentar = true;
  }
  
  if (aumentar ){
      intensidad += 1;
  }else {
    intensidad -= 1;
  }

  if (rotacionActiva) {
    translate(x1, y1);
    rotate(radians(angle1));
    rectMode(CENTER);
    rect(0, 0, 100, 100);
    angle1 += 2;
  }

  if (reboteActivo) {
    x2 += velocidadX2;
    y2 += velocidadY2;

    if (x2 > width || x2 < 0) {
      velocidadX2 *= -1;
    }

    if (y2 > height || y2 < 0) {
      velocidadY2 *= -1;
    }

    rectMode(CENTER);
    rect(x2, y2, 100, 100);
  }

  if (cambioTamanioAleatorioActivo) {
    float factorCambio = random(0.8, 1.2); // Factor de cambio entre 0.8 y 1.2
    lado3 *= factorCambio;

    rectMode(CENTER);
    rect(x3, y3, lado3, lado3);
  }

  if (sesgoActivo) {
    // Aplica el sesgo en el cambio de tamaño del cuadrado sesgado
    ladoX4 *= sesgoX4;
    ladoY4 *= sesgoY4;
    
    // Dibuja el cuadrado sesgado
    rectMode(CENTER);
    rect(x4, y4, ladoX4, ladoY4);
  }
}

void keyPressed() {
  if (key == '1') {
    rotacionActiva = true;
    reboteActivo = false;
    cambioTamanioAleatorioActivo = false;
    sesgoActivo = false;
  } else if (key == '2') {
    rotacionActiva = false;
    reboteActivo = true;
    cambioTamanioAleatorioActivo = false;
    sesgoActivo = false;
  } else if (key == '3') {
    rotacionActiva = false;
    reboteActivo = false;
    cambioTamanioAleatorioActivo = true;
    sesgoActivo = false;
  } else if (key == '4') {
    rotacionActiva = false;
    reboteActivo = false;
    cambioTamanioAleatorioActivo = false;
    sesgoActivo = true;
  }
}
