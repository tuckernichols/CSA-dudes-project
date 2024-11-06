Dude dude1 = new Dude(false, "circle", 30);
Dude dude2 = new Dude(false, "rectangle", 30);


void setup(){
  size(500, 500);
  frameRate(30);
  dude1.setColor(231,31,31);  
  dude2.setColor(20,110, 200);
  dude1.setAttraction(true, dude2);  // can i do this?
  dude2.setAttraction(false, dude1);
}


void draw(){
  background(255, 255, 200);
  dude1.show();
  dude2.show();
  dude1.update();  // red
  dude2.update();  // blue 
  

}
