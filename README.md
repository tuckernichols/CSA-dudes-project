## Dude project  
AP computer science A, with Processing and GitHub

## Class Overview
The Dude class is designed to:

Display a shape (circle, triangle, or rectangle) with customizable size and color.
Move independently, bouncing off canvas edges, or chase another Dude object.
Change color and shape when colliding with another Dude.

## atributes 
Position: random Initial x and y positions.
Color: RGB values that can be customized.
Shape: Circle, triangle, or rectangle.
Size: Size of the shape.
Movement Mode: Either chase (if set to follow another Dude) or run (move independently).
Velocity: Controlled using PVectors, with a speed and slope.

## Public Methods

### setAttraction(Dude otherDude, float speed)
Enables chase mode, making this Dude chase another Dude.
  otherDude: The target Dude to chase.
  speed: Movement speed of the Dude while chasing.
  
### setAttraction(float speed)
Enables independent run mode.
  speed: Movement speed for random, bouncing behavior.

### update()
Updates the position of the Dude based.

### show()
Draws the Dude on the canvas in its current shape and color.


## Usage
To use the Dude class:

Create a Dude object with the any shape and size.
Set the color and movement mode using setColor and setAttraction methods.
Call update() to move the Dude and show() to display it.



Created by - Tucker Nichols
