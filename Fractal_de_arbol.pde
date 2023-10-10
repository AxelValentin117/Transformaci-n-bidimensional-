float branchLength = 100; // Longitud inicial de las ramas
float branchAngle = PI / 6.0; // Ángulo de las ramas
int[] colors; // Arreglo de colores para las ramas

void setup() {
  size(800, 600);
  background(255);
  noLoop();
  colors = new int[6];
  for (int i = 0; i < colors.length; i++) {
    colors[i] = color(random(255), random(255), random(255));
  }
  translate(width / 2, height);
  drawTree(branchLength, 9); // Nivel de detalle
}

void drawTree(float len, int depth) {
  if (depth > 0) {
    int randColor = (int) random(colors.length);
    stroke(colors[randColor]);
    line(0, 0, 0, -len);
    translate(0, -len);
    pushMatrix();
    rotate(branchAngle);
    drawTree(len * 0.67, depth - 1);
    popMatrix();
    pushMatrix();
    rotate(-branchAngle);
    drawTree(len * 0.67, depth - 1);
    popMatrix();
  }
}
