public class ToolTip implements IUi {

  private boolean isShowing = false;

  private String titleText;
  private float titleYOffset = 50;
  private float titleY;


  private String descriptionText;
  private PImage icon;

  public float xOffset = 110;
  public float yOffset = -60;

  public float rectWidth = 180;
  public float rectHeight = 150;
  
  private PFont pixelFont;

  public ToolTip() {
    
    pixelFont = createFont("assets/RetroFont.TTF",18);
    textFont(pixelFont);
    
    
    ui.addUi(this);
  }

  public void Show(Item item) {
    titleText = item.getName();
    descriptionText = item.description;
    icon = item.icon;
    isShowing = true;
  }


  public void Hide() {
    isShowing = false;
  }


  public void display() {
    if (isShowing) {
      float mx = mouseX;
      float my = mouseY;

      float x = mx - xOffset;
      float y = my - yOffset;

      textAlign(CENTER);

      titleY = y - titleYOffset;


      fill(0, 200);
      rect(x, y, rectWidth, rectHeight);

      fill(255);
      text(titleText, x, titleY);
    }
  }
}
