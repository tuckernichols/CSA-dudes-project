public class Dude {
  private int x = (int) (Math.random() * 400) + 51;   // init location
  private int y = (int) (Math.random() * 400) + 51;
  private boolean likesDudes;
  private String shape;
  private int size;
  private int shift;
  private int r = 0;  // colors 
  private int g = 0;
  private int b = 0;
  // Constructor
  public Dude(boolean likesDudes, String shape, int size) {
    this.likesDudes = likesDudes;
    this.shape = shape.toLowerCase();
    this.size = size;
    this.shift = size/2;
  }
  // set functions
  public void setColor(int r, int g, int b){
    this.r = r;
    this.g = g;
    this.b = b;
  }
  // Get functions
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
  
    
  private void drawShape(){
    fill(r,g,b);
    if (shape.equals("circle")){
      circle(x, y, size);
    } else if(shape.equals("triangle")){
        triangle(120, 300, 232, 80, 344, 300);
    } else if (shape.equals("rectangle")){
        rect(x, y, size, size);
        triangle(x - shift, y + shift, x, y - shift / 1.3, x + shift, y + shift);
        // triangle(bottom left, top middle, bottom right);  shift / 1.3 creats equalizes triangle
    } else if (shape.equals("rectangle")){
        rect(50 - size/2 , 50 -  size/2 , size, size);
    }
  }

 public void update(){
   setColor(231,31,31);
   drawShape();
   
 }
  
