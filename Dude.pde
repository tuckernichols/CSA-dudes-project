public class Dude {
  private int x = (int) (Math.random() * 400) + 51;
  private int y = (int) (Math.random() * 400) + 51;
  private boolean likesDudes;
  private String shape;
  private int size;
  private int r = 0;
  private int g = 0;
  private int b = 0;
  
  public Dude(boolean likesDudes, String shape, int size) {
    this.likesDudes = likesDudes;
    this.shape = shape.toLowerCase();
    this.size = size;
  }
  
  public void setColor(int r, int g, int b){
    this.r = r;
    this.g = g;
    this.b = b;
  }
  
  private void drawShape(){
    fill(r,g,b);
    if (shape.equals("circle")){
      circle(x, y, size);
    } else if(shape.equals("triangle")){
        triangle(120, 300, 232, 80, 344, 300);
    } else if (shape.equals("rectangle")){
        rect(x, y, size, size);
    }
  }

 public void update(){
   setColor(231,31,31);
   drawShape();
   
 }
  
    

  
}
