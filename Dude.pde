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
  private float speed = 2 ;
  private float slope = 2.0 * speed ;
  private PVector vector = new PVector(speed, slope * speed);
  /**     */  // dev comment
  // Constructor
  public Dude(boolean likesDudes, String shape, int size) {
    this.likesDudes = likesDudes;
    this.shape = shape.toLowerCase();
    this.size = size;
    this.shift = size/2;
  }
  // setter functions
  public void setColor(int r, int g, int b) {
    this.r = r;
    this.g = g;
    this.b = b;
  }
  public void setAttraction(boolean likesDudes, Dude dudeOBJ) {
    this.likesDudes = likesDudes;
    this.otherDude = dudeOBJ;
    //this.vector = new PVector(speed, slope * speed);
  }
  // Getter functions
  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }
  // Other Functions
  private void chase() {
    if (likesDudes) {
      float goX = otherDude.getX();
      float goY = otherDude.getY();
      if ( x > goX) {      // incement X in chase direction
        x -= speed;
      } else if (x < goX) {
        x += speed;
      }
      if ( y > goY) {      // incement Y in chase direction
        y -= speed;
      }
      if (y < goY) {
        y += speed;
      }
    }
  }
  private void run() {
    if (! likesDudes) {
      PVector position = new PVector(x, y);
      vector = bounce(vector);  // if over 500
      position.add(vector);

      x = position.x;
      y = position.y;
    }
  }
  
  private PVector alterCourse(PVector slopeVector){
    // if runner is withing x of chaser { alter course }
    // lilmit: only allow once every x frames.
    
    return slopeVector;
  }

  private PVector bounce(PVector slopeVector) {    // draft not tested
    if (y > height - shift || y < 0 + shift ) {
      slope = slope * - 1.0;
      slopeVector = slopeVector.set(speed, slope);
    }
    if (x > width - shift || x < 0 + shift ) {
      speed = speed * -1.0;
      slopeVector = slopeVector.set(speed, slope);
    }
    return slopeVector;
  }

  private void drawShape() {
    fill(r, g, b);
    if (shape.equals("circle")) {
      circle(x, y, size);
    } else if (shape.equals("triangle")) {
      triangle(x - shift, y + shift, x, y - shift / 1.3, x + shift, y + shift);
    } else if (shape.equals("rectangle")) {
      rect(x - size/2, y -  size/2, size, size);
    }
  }

  public void update() {
    chase();
    run();
  }
  public void show() {
    drawShape();
  }
}
