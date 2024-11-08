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
  private float slope;
  private PVector vector;
  // Constructor
  public Dude( String shape, int size) {
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
  public void setAttraction(boolean likesDudes, Dude dudeOBJ, float speed) {
    this.likesDudes = likesDudes;
    this.otherDude = dudeOBJ;
    this.speed = speed ;
    this.slope = (float) ((Math.random() * 6) - 2) * speed;
    this.vector = new PVector(speed, slope);
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
    float goX = otherDude.getX();
    float goY = otherDude.getY();
    if (isCollision()) {
      setColor( (int) (Math.random() * 255) + 1, (int) (Math.random() * 255) + 1, (int) (Math.random() * 255) + 1);
      drawShape((int) (Math.random() * 3));
    }
    if ( x > goX) {      // incement X in chase direction
      x -= speed;
    } else if (x < goX) {
      x += speed;
    }
    if ( y > goY) {      // incement Y in chase direction
      y -= speed;
    } else if (y < goY) {
      y += speed;
    }
  }

  private void run() {
    PVector position = new PVector(x, y);
    vector = bounce(vector);  // if over 500
    position.add(vector);
    x = position.x;
    y = position.y;
    if (isCollision()) {
      setColor((int) (Math.random() * 255) + 1, (int) (Math.random() * 255) + 1, (int) (Math.random() * 255) + 1);
      drawShape((int) (Math.random() * 3));
    }
  }

  private boolean isCollision() {
    boolean crossX = (Math.abs(x - otherDude.getX()) < 2 * shift);
    boolean crossY = (Math.abs(y - otherDude.getY()) < 2 *shift);
    if (crossX && crossY) {
      return true;
    }
    return false;
  }

  private PVector bounce(PVector slopeVector) {
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

  private void drawShape(int shape) {
    if (shape == 0) {
      this.shape = "circle";
      circle(x, y, size);
    } else if (shape == 1) {
      this.shape = "triangle";
      triangle(x - shift, y + shift, x, y - shift / 1.3, x + shift, y + shift);
    } else if (shape == 2) {
      this.shape = "rectangle";
      rect(x - size/2, y -  size/2, size, size);
    }
  }

  public void update() {
    if (likesDudes) {
      chase();
    } else {
      run();
    }
  }
  public void show() {
    drawShape();
  }
}
