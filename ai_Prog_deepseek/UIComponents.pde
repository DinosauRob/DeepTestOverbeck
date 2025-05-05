// Base class
abstract class UIComponent {
  PVector pos;
  
  UIComponent(float x, float y) {
    pos = new PVector(x, y);
  }
  
  abstract void draw();
}

// Button implementation
class Button extends UIComponent {
  String label;
  int keyCode;
  Runnable action;
  boolean visible = true;
  
  Button(float x, float y, String label, int keyCode, Runnable action) {
    super(x, y);
    this.label = label;
    this.keyCode = keyCode;
    this.action = action;
  }
  
  void draw() {
    if(!visible) return;
    
    fill(isMouseOver() ? #CCCCCC : #999999);
    stroke(keyPressed && keyCode == this.keyCode ? #FF0000 : #666666);
    rect(pos.x, pos.y, 120, 40, 5);
    
    fill(0);
    textAlign(CENTER, CENTER);
    text(label, pos.x + 60, pos.y + 20);
  }
  
  boolean isMouseOver() {
    return mouseX > pos.x && mouseX < pos.x + 120 && 
           mouseY > pos.y && mouseY < pos.y + 40;
  }
  
  void checkPress(int pressedKey) {
    if(pressedKey == keyCode) action.run();
  }
}
