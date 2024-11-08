Dude dude1 = new Dude( "rectangle", 30);
Dude dude2 = new Dude("rectangle", 30);

Dude dude3 = new Dude( "triangle", 40);
Dude dude4 = new Dude("circle", 20);
Dude dude5 = new Dude("circle", 30);

void setup() {
  size(500, 500);
  frameRate(30);
  dude1.setColor(231, 31, 31);
  dude2.setColor(20, 110, 200);
  dude1.setAttraction(dude2, 3.0);
  dude2.setAttraction(4.0);

  dude3.setAttraction(4.0);
  dude4.setAttraction(dude3, 3.0);
  dude5.setAttraction(dude3, 2.0);
}

void draw() {
  background(255, 255, 200);

  dude1.show();
  dude2.show();
  dude1.update();
  dude2.update();

  dude3.show();
  dude4.show();
  dude5.show();
  dude3.update();
  dude4.update();
  dude5.update();
}
