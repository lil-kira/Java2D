/**
 * Button. 
 * 
 * Click on one of the colored squares in the 
 * center of the image to change the color of 
 * the background. 
 */

class Button implements IUi {

  int transparency = 150;


  String backgroundImagePath = "assets/button.png";
  String bgHightltedPath = "assets/highlighted.png";

  PImage bgImage;
  PImage bgHighlitedImage;

  int rectX, rectY;      // Position of square button
  int rectSize = 90;     // Diameter of rect
  color rectColor, baseColor;
  color rectHighlight;
  color currentColor;
  boolean rectOver = false;

  public Button(int x, int y, int size) {



    //Load Images
    bgImage = new PImage();
    bgImage = loadImage(backgroundImagePath);

    bgHighlitedImage = new PImage();
    bgHighlitedImage = loadImage(bgHightltedPath);


    rectColor = color(0);
    rectHighlight = color(51);
    baseColor = color(102);
    currentColor = baseColor;

    rectX = x;
    rectY = y;
    rectSize = size;
  }

  public void display() {
    update(mouseX, mouseY);


    tint(255, transparency);

    if (rectOver) {
      image(bgHighlitedImage, rectX, rectY, rectSize, rectSize);
    } else {
      image(bgImage, rectX, rectY, rectSize, rectSize);
    }
  }

  public void update(int x, int y) {
    if ( overRect(rectX, rectY, rectSize, rectSize) ) {
      rectOver = true;
    } else {
      rectOver = false;
    }
  }

  private void Blur() {
  }

  public void mousePressed() {
    if (rectOver) {
      currentColor = rectColor;
    }
  }

  boolean overRect(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }

  boolean overCircle(int x, int y, int diameter) {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return true;
    } else {
      return false;
    }
  }
}