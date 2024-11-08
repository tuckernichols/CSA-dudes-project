public class Dude {
  private float x = (int) (Math.random() * 400) + 51;   // Initial x location
  private float y = (int) (Math.random() * 400) + 51;   // Initial y location
  private boolean likesDudes;    // true -> chase
  private Dude otherDude;
  private String shape;
  private int size;
  private int shift;
  private int r = 0;  // Color components
  private int g = 0;
  private int b = 0;
  private float speed;
  private float slope;
  private PVector vector;

  // Constructor
  public Dude(String shape, int size) {
    this.shape = shape.toLowerCase();
    this.size = size;
    this.shift = size / 2;
  }

  // Setter methods
  public void setColor(int r, int g, int b) {
    this.r = r;
    this.g = g;
    this.b = b;
  }

  public void setAttraction(boolean likesDudes, Dude otherDude, float speed) {
    this.likesDudes = likesDudes;
    this.otherDude = otherDude;
    this.speed = speed;
    this.slope = (float) ((Math.random() * 6) - 2) * speed;
    this.vector = new PVector(speed, slope);
  }

  // Getter methods
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
    vector = bounce(vector);
    position.add(vector);

    x = position.x;
    y = position.y;

    if (isCollision()) {
      setColor((int) (Math.random() * 255) + 1, (int) (Math.random() * 255) + 1, (int) (Math.random() * 255) + 1);
      drawShape((int) (Math.random() * 3));
    }
  }

  private boolean isCollision() {
    boolean collidesX = Math.abs(x - otherDude.getX()) < 2 * shift;
    boolean collidesY = Math.abs(y - otherDude.getY()) < 2 * shift;
    return collidesX && collidesY;
  }

  private PVector bounce(PVector slopeVector) {
    if (y > height - shift || y < shift) {
      slope = -slope;
      slopeVector.set(speed, slope);
    }
    if (x > width - shift || x < shift) {
      speed = -speed;
      slopeVector.set(speed, slope);
    }
    return slopeVector;
  }


  private void drawShape() {
    fill(r, g, b);

    if ("circle".equals(shape)) {
      circle(x, y, size);
    } else if ("triangle".equals(shape)) {
      triangle(x - shift, y + shift, x, y - shift / 1.3f, x + shift, y + shift);
    } else if ("rectangle".equals(shape)) {
      rect(x - size / 2, y - size / 2, size, size);
    }
  }

  private void drawShape(int shapeIndex) {
    if (shapeIndex == 0) {
      shape = "circle";
      circle(x, y, size);
    } else if (shapeIndex == 1) {
      shape = "triangle";
      triangle(x - shift, y + shift, x, y - shift / 1.3f, x + shift, y + shift);
    } else if (shapeIndex == 2) {
      shape = "rectangle";
      rect(x - size / 2, y - size / 2, size, size);
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
