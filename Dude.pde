public class Dude {
  private float x = (int) (Math.random() * 400) + 51;   // init location
  private float y = (int) (Math.random() * 400) + 51;
  private boolean likesDudes;
  private Dude otherDude;
  private String shape;
  private int size;
  private int shift;
  private int r = 0;  // colors
  private int g = 0;
  private int b = 0;
  private float speed;
  // Constructor
  public Dude(boolean likesDudes, String shape, int size) {
    this.likesDudes = likesDudes;
    this.shape = shape.toLowerCase();
    this.size = size;
    this.shift = size/2;
  }
  // set functions
  public void setColor(int r, int g, int b) {
    this.r = r;
    this.g = g;
    this.b = b;
  }
  public void setAttraction(boolean likesDudes, Dude dudeOBJ, float speed) {
    this.likesDudes = likesDudes;
    this.otherDude = dudeOBJ;
    this.speed = speed / 10.0;
  }
  // Get functions
  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }

  private void chase() {
    if (likesDudes) {
      float goX = otherDude.getX();
      float goY = otherDude.getY();
      //double slope = (y- goY)/(x - goX);
      //System.out.println(slope);
      // UPNEXT make it so it goes on the most drict line to the OBJ
      // x (1/slope)  y (slope)

      if ( x > goX) {      // incement X in chase direction
        x -= 0.5;
      } else if (x < goX) {
        x += 0.5;
      }

      if ( y > goY) {      // incement Y in chase direction
        y -= 0.5;
      }
      if (y < goY) {
        y += 0.5;
      }
    }
  }

  private void run() {
    if (! likesDudes) {
      float slope = -1 * (2.0);
      PVector position = new PVector(x,y);
      PVector vector = new PVector(speed, slope * speed) ;
       position.add(vector);
       x = position.x;
       y = position.y;
    }
  }
  
  private float bounce(float location) {    // draft not tested 
    // create bounce with vecotors
    return 0.1;
  }

  private void drawShape() {
    fill(r, g, b);
    if (shape.equals("circle")) {
      circle(x, y, size);
    } else if (shape.equals("triangle")) {
      triangle(x - shift, y + shift, x, y - shift / 1.3, x + shift, y + shift);
      // triangle(bottom left, top middle, bottom right);  shift / 1.3 creats equalizes triangle
    } else if (shape.equals("rectangle")) {
      rect(x - size/2, y -  size/2, size, size);
    }
  }

  public void update() {
    drawShape();
    chase();
    run();
  }
}
